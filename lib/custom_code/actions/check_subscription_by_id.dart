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
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (!userDoc.exists) return false;

    // Check for lifetime subscription first
    final bool isLifetime = userDoc.data()?['lifetime'] ?? false;
    if (isLifetime) return true;

    final customerInfo = await Purchases.getCustomerInfo();
    if (customerInfo == null) return false;

    final plusMemberEntitlement =
        customerInfo.entitlements.active['plusmember'];

    // Check both existence AND activation status
    if (plusMemberEntitlement != null && plusMemberEntitlement.isActive) {
      // ACTIVE SUBSCRIPTION
      final expirationDate = plusMemberEntitlement.expirationDate!;
      final willRenew = plusMemberEntitlement.willRenew;

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'plusmember': true,
        'expired_at': DateTime.tryParse(expirationDate) ?? null,
      });

      print('Active subscription for $userId');
      print('Will renew? $willRenew');
      return true;
    } else {
      // NO ACTIVE SUBSCRIPTION
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'plusmember': false});

      print('Subscription inactive/expired for $userId');
      return false;
    }
  } catch (e) {
    print('Error checking subscription: $e');
    return false;
  }
}
