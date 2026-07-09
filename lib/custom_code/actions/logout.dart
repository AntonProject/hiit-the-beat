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

// log out action from app
import 'package:firebase_auth/firebase_auth.dart';

Future logout() async {
  try {
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    FFAppState().requestFBpermission = true;
    FFAppState().refreshDate = null;
    FFAppState().hideBanners = [];
  } catch (e) {
    debugPrint('Error during logout: $e');
    rethrow;
  }
}
