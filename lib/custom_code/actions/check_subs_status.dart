// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

// Returns one of: active | trial | manual | trialExpired | subscriptionExpired
// | manualExpired | none. Priority: lifetime > real RC (trial/active) >
// active manual (Full Unlock) > manual just expired > RC expired > none.
Future<String> checkSubsStatus(String userId) async {
  try {
    String rcStatus = 'none';
    String firestoreStatus = 'none';

    // ───────── FIREBASE ─────────

    final doc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    final data = doc.data() ?? {};

    final bool isLifetime = data['lifetime'] ?? false;

    if (isLifetime) {
      firestoreStatus = 'active';
    }

    // ───────── MANUAL ACCESS (Full Unlock) ─────────
    // Gifted trial: subscription_status == 'manual' while trial_ends_at is in
    // the future. Reuses the trial_* fields, has no RevenueCat entitlement.

    final String existingStatus = (data['subscription_status'] as String?) ?? '';

    final Timestamp? trialEndsTs = data['trial_ends_at'];

    final bool trialEndsInFuture = trialEndsTs != null &&
        DateTime.now().toUtc().isBefore(trialEndsTs.toDate().toUtc());

    final bool manualActive = existingStatus == 'manual' && trialEndsInFuture;

    final bool manualExpiredNow = existingStatus == 'manual' && !trialEndsInFuture;

    // ───────── REVENUECAT ─────────

    await Purchases.invalidateCustomerInfoCache();

    final CustomerInfo info = await Purchases.getCustomerInfo();

    final activeEntitlement = info.entitlements.active['plusmember'];

    final allEntitlement = info.entitlements.all['plusmember'];

    final entitlement = activeEntitlement ?? allEntitlement;

    print('========== REVENUECAT ==========');
    print('UserId: $userId');
    print('Lifetime: $isLifetime');
    print('Existing status: $existingStatus');
    print('Manual active: $manualActive');

    if (entitlement != null) {
      print('Identifier: ${entitlement.identifier}');
      print('Product ID: ${entitlement.productIdentifier}');
      print('Is Active: ${entitlement.isActive}');
      print('Period Type: ${entitlement.periodType}');
      print('Latest Purchase: ${entitlement.latestPurchaseDate}');
      print('Expiration: ${entitlement.expirationDate}');
    }

    print('===============================');

    if (entitlement != null) {
      if (entitlement.isActive && entitlement.periodType == PeriodType.trial) {
        rcStatus = 'trial';
      } else if (entitlement.isActive) {
        rcStatus = 'active';
      } else {
        rcStatus = entitlement.periodType == PeriodType.trial
            ? 'trialExpired'
            : 'subscriptionExpired';
      }
    }

    final bool rcHasRealSub = rcStatus == 'trial' || rcStatus == 'active';

    // ───────── RESULT ─────────

    final String result = firestoreStatus == 'active'
        ? 'active'
        : rcHasRealSub
            ? rcStatus
            : manualActive
                ? 'manual'
                : manualExpiredNow
                    ? 'manualExpired'
                    : rcStatus != 'none'
                        ? rcStatus
                        : firestoreStatus; // 'none'

    final bool isPlusMember =
        result == 'active' || result == 'trial' || result == 'manual';

    final Map<String, dynamic> update = {
      'plusmember': isPlusMember,
    };

    // Write the resolved status verbatim (distinct expired values kept).
    update['subscription_status'] = result == 'none' ? '' : result;

    // ───────── TIMEZONE ─────────

    final existingTz = data['timezone'];

    if (existingTz == null || (existingTz is String && existingTz.isEmpty)) {
      try {
        final tz = await FlutterTimezone.getLocalTimezone();

        if (tz.identifier.isNotEmpty) {
          update['timezone'] = tz.identifier;
        }
      } catch (_) {}
    }

    // ───────── DATES ─────────
    // Only when there is a RevenueCat entitlement. A manual (Full Unlock) user
    // has none, so its reused trial_started_at/trial_ends_at are never touched
    // here. A real purchase (entitlement present) overwrites them — correct.

    if (entitlement != null) {
      final bool isTrial = entitlement.periodType == PeriodType.trial;

      final DateTime? start = DateTime.tryParse(entitlement.latestPurchaseDate);

      final DateTime? end = entitlement.expirationDate != null
          ? DateTime.tryParse(entitlement.expirationDate!)
          : null;

      if (isTrial) {
        if (start != null) {
          update['trial_started_at'] = Timestamp.fromDate(start.toUtc());
        }
        if (end != null) {
          update['trial_ends_at'] = Timestamp.fromDate(end.toUtc());
        }
      } else {
        if (data['subscription_started_at'] == null && start != null) {
          update['subscription_started_at'] = Timestamp.fromDate(start.toUtc());
        }
        if (end != null) {
          update['subscription_ends_at'] = Timestamp.fromDate(end.toUtc());
        }
      }
    }

    // ───────── WRITE ─────────

    print('RC Status: $rcStatus');
    print('Result: $result');
    print('Firestore update: $update');
    print('===============================');

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update(update);

    return result;
  } catch (_) {
    return 'none';
  }
}
