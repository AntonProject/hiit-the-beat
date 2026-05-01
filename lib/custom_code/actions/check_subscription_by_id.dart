// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

Future<bool> checkSubscriptionById(String userId) async {
  try {
    print('Checking subscription for user: $userId');

    // Retrieve the user document from Firestore
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (!userDoc.exists) {
      print('User document does not exist for $userId');
      return false;
    }

    final userData = userDoc.data() ?? {};
    final bool isLifetime = userData['lifetime'] ?? false;
    final Timestamp? expiredAt = userData['expired_at'];

    print('Lifetime subscription status: $isLifetime');
    print('Expired_at exists: ${expiredAt != null}');

    // Check the combination of expired_at and lifetime flags
    if (expiredAt != null) {
      // Convert the date correctly and use UTC
      final DateTime expirationDate = expiredAt.toDate().toUtc();
      final DateTime now = DateTime.now().toUtc();

      print('Current time (UTC): $now');
      print('Expiration date (UTC): $expirationDate');
      print('Is subscription expired: ${now.isAfter(expirationDate)}');

      // If the expiration date is still valid but lifetime flag is false — fix the inconsistency
      if (now.isBefore(expirationDate) && !isLifetime) {
        print(
            'Found valid expiration date but lifetime flag is false – fixing error');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'lifetime': true,
          'plusmember': true,
        });
        print(
            'Restored lifetime status for user with valid expiration date: $userId');
        return true;
      }

      // Standard check when lifetime is active
      if (isLifetime && now.isBefore(expirationDate)) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'plusmember': true,
        });
        print(
            'Lifetime subscription valid until ${expirationDate.toString()} for $userId');
        return true;
      }

      // If the expiration date has passed, update the status
      if (now.isAfter(expirationDate)) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'plusmember': false,
        });
        print('Subscription expired for $userId');
      }
    } else if (isLifetime) {
      // Case when lifetime is true but there is no expiration date (perpetual subscription)
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'plusmember': true,
      });
      print('Lifetime subscription without expiration date for $userId');
      return true;
    }

    // Continue with RevenueCat subscription check
    print('Checking RevenueCat subscription for $userId');
    final customerInfo = await Purchases.getCustomerInfo();
    if (customerInfo == null) {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'plusmember': false,
      });
      print('No customer info found in RevenueCat for $userId');
      return false;
    }

    final plusMemberEntitlement =
        customerInfo.entitlements.active['plusmember'];
    if (plusMemberEntitlement != null && plusMemberEntitlement.isActive) {
      // Active subscription in RevenueCat
      final expirationDate = plusMemberEntitlement.expirationDate;
      final willRenew = plusMemberEntitlement.willRenew;

      DateTime? parsedExpirationDate =
          expirationDate != null ? DateTime.tryParse(expirationDate) : null;

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'plusmember': true,
        'expired_at': parsedExpirationDate,
      });

      print('Active RevenueCat subscription for $userId');
      print(
          'RevenueCat expiration date: ${parsedExpirationDate?.toString() ?? 'unknown'}');
      return true;
    } else {
      // No active subscription in RevenueCat
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'plusmember': false,
      });
      print('No active RevenueCat subscription found for $userId');
      return false;
    }
  } catch (e) {
    print('Error checking subscription: $e');
    // If an error occurs, verify the current status before resetting
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        final userData = userDoc.data() ?? {};
        final Timestamp? expiredAt = userData['expired_at'];

        // If there is a valid expiration date, preserve the status
        if (expiredAt != null) {
          final DateTime now = DateTime.now().toUtc();
          final DateTime expirationDate = expiredAt.toDate().toUtc();

          if (now.isBefore(expirationDate)) {
            print(
                'Error occurred but user has valid expiration date. Preserving status.');
            await FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .update({
              'plusmember': true,
              'lifetime': true,
            });
            return true;
          }
        }
      }

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'plusmember': false,
      });
    } catch (updateError) {
      print('Failed to update subscription status: $updateError');
    }
    return false;
  }
}
