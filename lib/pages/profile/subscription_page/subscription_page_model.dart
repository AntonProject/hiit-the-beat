import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/dialog/dialog_widget.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/page_component/change_subs/change_subs_widget.dart';
import '/components/page_component/success_subs/success_subs_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'subscription_page_widget.dart' show SubscriptionPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscriptionPageModel extends FlutterFlowModel<SubscriptionPageWidget> {
  ///  Local state fields for this page.

  double? price = 139.99;

  String? packageId = 'plusmember12';

  String? priceString;

  String subsStatus = 'none';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkSubsStatus] action in SubscriptionPage widget.
  String? status;
  // Stores action output result for [RevenueCat - Purchase] action in Gotopayment widget.
  bool? revenue;
  // Stores action output result for [Backend Call - API (addContactTags)] action in Gotopayment widget.
  ApiCallResponse? apiResultu1f;
  // Stores action output result for [Backend Call - API (getContactTags)] action in Gotopayment widget.
  ApiCallResponse? contactTags;
  // Stores action output result for [Backend Call - API (deleteContactTag)] action in Gotopayment widget.
  ApiCallResponse? apiResultm5v;
  // Stores action output result for [Custom Action - checkSubsStatus] action in Gotopayment widget.
  String? subsStatusUpdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
