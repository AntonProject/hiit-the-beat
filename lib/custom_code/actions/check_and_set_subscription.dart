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

Future<bool> checkAndSetSubscription() async {
  // Get current Firebase user
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) return false;

  try {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();
    if (!userDoc.exists) return false;

    final bool isPlusMember = userDoc.data()?['plusmember'] ?? false;
    if (!isPlusMember) {
      print('User ${currentUser.uid} is not a plus member');
      return false;
    }

    final bool isLifetime = userDoc.data()?['lifetime'] ?? false;
    if (isLifetime) {
      print('User ${currentUser.uid} has lifetime subscription');
      return true;
    }

    final customerInfo = await Purchases.getCustomerInfo();
    if (customerInfo == null) return false;

    final plusMemberEntitlement =
        customerInfo.entitlements.active['plusmember'];
    if (plusMemberEntitlement == null) return false;

    final bool isActivePlusMember = plusMemberEntitlement.isActive;
    if (isActivePlusMember) {
      final String productId = plusMemberEntitlement.productIdentifier;
      final List<String> productIds = productId.split(':');
      final String mainProductId = productIds.last;

      final String? expirationDateString = plusMemberEntitlement.expirationDate;
      DateTime? expirationDate;
      if (expirationDateString != null) {
        expirationDate = DateTime.parse(expirationDateString);
      }

      String subscriptionType;
      switch (mainProductId) {
        case 'plusmember1':
          subscriptionType = 'Month';
          break;
        case 'plusmember6':
          subscriptionType = 'HalfYear';
          break;
        case 'plusmember12':
          subscriptionType = 'Year';
          break;
        default:
          subscriptionType = 'Unknown';
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({
        'plusmember': true,
        'subscription_type': subscriptionType,
        'expired_at': expirationDate,
        'subscription_product_id': mainProductId,
        'last_check': DateTime.now(),
      });

      print('Updated subscription for user ${currentUser.uid}:');
      print('PlusMember: true');
      print('Type: $subscriptionType');
      print('Product ID: $mainProductId');
      print('Expires: $expirationDate');
      return true;
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({
        'plusmember': false,
        'subscription_type': null,
        'expired_at': null,
        'subscription_product_id': null,
        'last_check': DateTime.now(),
      });
      print('User ${currentUser.uid} has no active subscription');
      return false;
    }
  } catch (e) {
    print('Error checking subscription: $e');
    return false;
  }
}
