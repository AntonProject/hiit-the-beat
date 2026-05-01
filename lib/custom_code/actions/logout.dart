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

// log out action from app
import 'package:firebase_auth/firebase_auth.dart';

Future logout() async {
  try {
    // Sign out from Firebase Auth
    await FirebaseAuth.instance.signOut();

    // Reset app state to clear any cached user data
    FFAppState.reset();

    // Clear all cached data
    FFAppState().clearWorkoutsCache();
    FFAppState().clearSeasonsCache();
    FFAppState().clearUsersCache();
    FFAppState().clearAddCache();
    FFAppState().clearZoomCache();
    FFAppState().clearBannersCache();
    FFAppState().clearPromoCache();
    FFAppState().clearProgressCache();

    // Reset onboarding and other user-specific flags
    FFAppState().requestFBpermission = true;
    FFAppState().refreshDate = null;

    // Clear hidden banners list
    FFAppState().hideBanners = [];
  } catch (e) {
    // Handle logout errors gracefully
    debugPrint('Error during logout: $e');
    throw e;
  }
}
