import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/dialog/dialog_widget.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/payment_dialog/payment_dialog_widget.dart';
import '/components/dialogs/payment_dialog_start/payment_dialog_start_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/page_component/change_subs/change_subs_widget.dart';
import '/components/page_component/success_subs/success_subs_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subscription_page_model.dart';
export 'subscription_page_model.dart';

class SubscriptionPageWidget extends StatefulWidget {
  const SubscriptionPageWidget({super.key});

  static String routeName = 'SubscriptionPage';
  static String routePath = '/subscriptionPage';

  @override
  State<SubscriptionPageWidget> createState() => _SubscriptionPageWidgetState();
}

class _SubscriptionPageWidgetState extends State<SubscriptionPageWidget> {
  late SubscriptionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SubscriptionPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SUBSCRIPTION_SubscriptionPage_ON_INIT_ST');
      logFirebaseEvent('SubscriptionPage_custom_action');
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      logFirebaseEvent('SubscriptionPage_custom_action');
      unawaited(
        () async {
          await actions.setStatusBarColor();
        }(),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF38001E), Color(0xFF00111F)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 12.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: Colors.transparent,
                      icon: Icon(
                        FFIcons.karrowLeft24,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('SUBSCRIPTION_arrowLeft24_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                    if (!valueOrDefault<bool>(
                        currentUserDocument?.plusmember, false))
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          FFLocalizations.of(context).getText(
                            'px4yi7gk' /* Choose your plan */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.07,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.4,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    if (valueOrDefault<bool>(
                        currentUserDocument?.plusmember, false))
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          FFLocalizations.of(context).getText(
                            'e7bvr8te' /* Manage subscription */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.07,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.4,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final packages = revenue_cat
                                      .offerings!.current!.availablePackages
                                      .where((e) =>
                                          (e.identifier == 'plusmember12') ||
                                          (e.identifier == 'plusmember1'))
                                      .toList()
                                      .sortedList(
                                          keyOf: (e) => e.storeProduct.price,
                                          desc: true)
                                      .toList();
                                  if (packages.isEmpty) {
                                    return EmptyListWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: packages.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 16.0),
                                    itemBuilder: (context, packagesIndex) {
                                      final packagesItem =
                                          packages[packagesIndex];
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SUBSCRIPTION_PAGE_PAGE_month_ON_TAP');
                                            logFirebaseEvent(
                                                'month_haptic_feedback');
                                            HapticFeedback.mediumImpact();
                                            logFirebaseEvent(
                                                'month_update_page_state');
                                            _model.price =
                                                valueOrDefault<double>(
                                              packagesItem.storeProduct.price,
                                              139.0,
                                            );
                                            _model.packageId =
                                                valueOrDefault<String>(
                                              packagesItem.identifier,
                                              'plusmember12',
                                            );
                                            _model.priceString =
                                                valueOrDefault<String>(
                                              packagesItem
                                                  .storeProduct.priceString,
                                              '€139.99',
                                            );
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0x08FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: valueOrDefault<Color>(
                                                  _model.packageId ==
                                                          packagesItem
                                                              .identifier
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondary
                                                      : Color(0x08FFFFFF),
                                                  Color(0x08FFFFFF),
                                                ),
                                                width: 3.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (packagesItem.identifier ==
                                                    'plusmember12')
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.packageId ==
                                                                packagesItem
                                                                    .identifier
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                8.0),
                                                      ),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.packageId ==
                                                                  packagesItem
                                                                      .identifier
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                        ),
                                                        width: 0.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    6.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'tqv5js2f' /* GET 3 MONTHS FREE! */,
                                                          ),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                letterSpacing:
                                                                    0.07,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                lineHeight:
                                                                    1.25,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .packageId ==
                                                              packagesItem
                                                                  .identifier) {
                                                            return AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                () {
                                                                  if (packagesItem
                                                                          .identifier ==
                                                                      'plusmember12') {
                                                                    return valueOrDefault<
                                                                        String>(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            'Annual',
                                                                        deText:
                                                                            'Jährlich',
                                                                        jaText:
                                                                            '年間',
                                                                      ),
                                                                      'Annual',
                                                                    );
                                                                  } else if (packagesItem
                                                                          .identifier ==
                                                                      'plusmember6') {
                                                                    return valueOrDefault<
                                                                        String>(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            '6 months',
                                                                        deText:
                                                                            '6 Monate',
                                                                        jaText:
                                                                            '6ヶ月',
                                                                      ),
                                                                      '6 months',
                                                                    );
                                                                  } else if (packagesItem
                                                                          .identifier ==
                                                                      'plusmember1') {
                                                                    return valueOrDefault<
                                                                        String>(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            'Monthly',
                                                                        deText:
                                                                            'Monatlich',
                                                                        jaText:
                                                                            '月次',
                                                                      ),
                                                                      'Monthly',
                                                                    );
                                                                  } else {
                                                                    return valueOrDefault<
                                                                        String>(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            'Annual',
                                                                        deText:
                                                                            'Jährlich',
                                                                        jaText:
                                                                            '年間',
                                                                      ),
                                                                      'Annual',
                                                                    );
                                                                  }
                                                                }(),
                                                                'Annual',
                                                              ),
                                                              maxLines: 1,
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        24.0,
                                                                    letterSpacing:
                                                                        0.07,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    lineHeight:
                                                                        1.4,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            );
                                                          } else {
                                                            return AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                () {
                                                                  if (packagesItem
                                                                          .identifier ==
                                                                      'plusmember12') {
                                                                    return valueOrDefault<
                                                                        String>(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            'Annual',
                                                                        deText:
                                                                            'Jährlich',
                                                                        jaText:
                                                                            '年間',
                                                                      ),
                                                                      'Annual',
                                                                    );
                                                                  } else if (packagesItem
                                                                          .identifier ==
                                                                      'plusmember6') {
                                                                    return valueOrDefault<
                                                                        String>(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            '6 months',
                                                                        deText:
                                                                            '6 Monate',
                                                                        jaText:
                                                                            '6ヶ月',
                                                                      ),
                                                                      '6 months',
                                                                    );
                                                                  } else if (packagesItem
                                                                          .identifier ==
                                                                      'plusmember1') {
                                                                    return valueOrDefault<
                                                                        String>(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            'Monthly',
                                                                        deText:
                                                                            'Monatlich',
                                                                        jaText:
                                                                            '月次',
                                                                      ),
                                                                      'Monthly',
                                                                    );
                                                                  } else {
                                                                    return valueOrDefault<
                                                                        String>(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            'Monthly',
                                                                        deText:
                                                                            'monatlich',
                                                                        jaText:
                                                                            '年間',
                                                                      ),
                                                                      'Monthly',
                                                                    );
                                                                  }
                                                                }(),
                                                                'Annual',
                                                              ),
                                                              maxLines: 1,
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        24.0,
                                                                    letterSpacing:
                                                                        0.07,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    lineHeight:
                                                                        1.4,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .packageId ==
                                                              packagesItem
                                                                  .identifier) {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        functions.pricePeriod(
                                                                            valueOrDefault<String>(
                                                                              packagesItem.storeProduct.priceString,
                                                                              '€0',
                                                                            ),
                                                                            1,
                                                                            '0',
                                                                            false),
                                                                        '€0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                24.0,
                                                                            letterSpacing:
                                                                                0.07,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            lineHeight:
                                                                                1.4,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        () {
                                                                          if (packagesItem.identifier ==
                                                                              'plusmember6') {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / 6 months',
                                                                                deText: ' / 6 Monate',
                                                                                jaText: ' / 6ヶ月',
                                                                              ),
                                                                              ' / 6 months',
                                                                            );
                                                                          } else if (packagesItem.identifier ==
                                                                              'plusmember12') {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / year',
                                                                                deText: ' / Jahr',
                                                                                jaText: ' / 年',
                                                                              ),
                                                                              ' / year',
                                                                            );
                                                                          } else if (packagesItem.identifier ==
                                                                              'plusmember1') {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / month',
                                                                                deText: ' / Monat',
                                                                                jaText: ' / 月',
                                                                              ),
                                                                              ' / month',
                                                                            );
                                                                          } else {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / month',
                                                                                deText: ' / Monat',
                                                                                jaText: ' / 月',
                                                                              ),
                                                                              ' / month',
                                                                            );
                                                                          }
                                                                        }(),
                                                                        ' / month',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.07,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            lineHeight:
                                                                                1.4,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.07,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        lineHeight:
                                                                            1.4,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            );
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        functions.pricePeriod(
                                                                            valueOrDefault<String>(
                                                                              packagesItem.storeProduct.priceString,
                                                                              '€0',
                                                                            ),
                                                                            1,
                                                                            '0',
                                                                            false),
                                                                        '€0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                24.0,
                                                                            letterSpacing:
                                                                                0.07,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            lineHeight:
                                                                                1.4,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        () {
                                                                          if (packagesItem.identifier ==
                                                                              'plusmember6') {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / 6 months',
                                                                                deText: ' / 6 Monate',
                                                                                jaText: ' / 6ヶ月',
                                                                              ),
                                                                              ' / 6 months',
                                                                            );
                                                                          } else if (packagesItem.identifier ==
                                                                              'plusmember12') {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / year',
                                                                                deText: ' / Jahr',
                                                                                jaText: ' / 年',
                                                                              ),
                                                                              ' / year',
                                                                            );
                                                                          } else if (packagesItem.identifier ==
                                                                              'plusmember1') {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / month',
                                                                                deText: ' / Monat',
                                                                                jaText: ' / 月',
                                                                              ),
                                                                              ' / month',
                                                                            );
                                                                          } else {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / month',
                                                                                deText: ' / Monat',
                                                                                jaText: ' / 月',
                                                                              ),
                                                                              ' / year',
                                                                            );
                                                                          }
                                                                        }(),
                                                                        ' / month',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.07,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            lineHeight:
                                                                                1.4,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.07,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        lineHeight:
                                                                            1.4,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      if (packagesItem
                                                              .identifier ==
                                                          'plusmember12')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 5.0,
                                                                height: 5.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '7tbrnflb' /* 76% of users commit to long-te... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      if (packagesItem
                                                              .identifier ==
                                                          'plusmember12')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 5.0,
                                                                height: 5.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '3j0q74op' /* $2.9 / week - instead of a cup... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      if (packagesItem
                                                              .identifier ==
                                                          'plusmember12')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 5.0,
                                                                height: 5.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'hm7frjjm' /* Long-term motivation & continu... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      if (packagesItem
                                                              .identifier ==
                                                          'plusmember1')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 5.0,
                                                                height: 5.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'm345soo5' /* Maximum flexibility — cancel a... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ]
                              .addToStart(SizedBox(height: 14.0))
                              .addToEnd(SizedBox(height: 240.0)),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 2.0,
                              sigmaY: 2.0,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'SUBSCRIPTION_PAGE_PAGE_Learnmore_ON_TAP');
                                          logFirebaseEvent(
                                              'Learnmore_haptic_feedback');
                                          HapticFeedback.selectionClick();
                                          if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.plusmember,
                                                  false) ==
                                              false) {
                                            logFirebaseEvent(
                                                'Learnmore_bottom_sheet');
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        PaymentDialogStartWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          } else {
                                            logFirebaseEvent(
                                                'Learnmore_bottom_sheet');
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        PaymentDialogWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'zn68g42o' /* Learn more about benefits */,
                                        ),
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 14.0,
                                                letterSpacing: 0.07,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.4,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: (_model.packageId == null ||
                                                _model.packageId == '')
                                            ? null
                                            : () async {
                                                logFirebaseEvent(
                                                    'SUBSCRIPTION_Gotopayment_ON_TAP');
                                                var _shouldSetState = false;
                                                logFirebaseEvent(
                                                    'Gotopayment_haptic_feedback');
                                                HapticFeedback.selectionClick();
                                                if (currentUserEmail != null &&
                                                    currentUserEmail != '') {
                                                  logFirebaseEvent(
                                                      'Gotopayment_revenue_cat');
                                                  _model.revenue =
                                                      await revenue_cat
                                                          .purchasePackage(
                                                              valueOrDefault<
                                                                  String>(
                                                    _model.packageId,
                                                    'plusmember12',
                                                  ));
                                                  _shouldSetState = true;
                                                  if (_model.revenue!) {
                                                    if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.plusmember,
                                                        false)) {
                                                      logFirebaseEvent(
                                                          'Gotopayment_bottom_sheet');
                                                      showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  ChangeSubsWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Gotopayment_backend_call');

                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        plusmember: true,
                                                      ));
                                                      logFirebaseEvent(
                                                          'Gotopayment_backend_call');
                                                      _model.apiResultu1f =
                                                          await ActivecampaignGroup
                                                              .addContactTagsCall
                                                              .call(
                                                        contactId: valueOrDefault(
                                                            currentUserDocument
                                                                ?.activeCampgainContactId,
                                                            ''),
                                                        tagId: FFAppConstants
                                                            .activeCampaignPlusmemberTagId,
                                                      );

                                                      _shouldSetState = true;
                                                      logFirebaseEvent(
                                                          'Gotopayment_backend_call');
                                                      _model.contactTags =
                                                          await ActivecampaignGroup
                                                              .getContactTagsCall
                                                              .call(
                                                        contactId: valueOrDefault(
                                                            currentUserDocument
                                                                ?.activeCampgainContactId,
                                                            ''),
                                                      );

                                                      _shouldSetState = true;
                                                      logFirebaseEvent(
                                                          'Gotopayment_backend_call');
                                                      _model.apiResultm5v =
                                                          await ActivecampaignGroup
                                                              .deleteContactTagCall
                                                              .call(
                                                        contactTagId: ActivecampaignGroup
                                                            .getContactTagsCall
                                                            .contactTags(
                                                              (_model.contactTags
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            ?.where((e) =>
                                                                e.tag ==
                                                                FFAppConstants
                                                                    .activeCampaignFreememberTagId)
                                                            .toList()
                                                            ?.firstOrNull
                                                            ?.id,
                                                      );

                                                      _shouldSetState = true;
                                                      logFirebaseEvent(
                                                          'Gotopayment_action_block');
                                                      await action_blocks
                                                          .startTrial(context);
                                                      logFirebaseEvent(
                                                          'Gotopayment_bottom_sheet');
                                                      showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  SuccessSubsWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    }

                                                    logFirebaseEvent(
                                                        'Gotopayment_backend_call');

                                                    await currentUserReference!
                                                        .update(
                                                            createUsersRecordData(
                                                      hasPayable: true,
                                                    ));
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Gotopayment_navigate_back');
                                                    context.safePop();
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                } else {
                                                  logFirebaseEvent(
                                                      'Gotopayment_bottom_sheet');
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              GuestDialogWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                        text: valueOrDefault<String>(
                                          !valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.plusmember,
                                                  false)
                                              ? valueOrDefault<String>(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText:
                                                        'Start your 7-day free trial',
                                                    deText:
                                                        'Jetzt 7 Tage gratis testen',
                                                    jaText: '7日間の無料トライアルを始める',
                                                  ),
                                                  'Start your 7-day free trial',
                                                )
                                              : valueOrDefault<String>(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText: 'Go to payment',
                                                    deText:
                                                        'Weiter zur Zahlung',
                                                    jaText: '支払いへ進む',
                                                  ),
                                                  'Go to payment',
                                                ),
                                          'Start your 7-day free trial',
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 14.0,
                                                letterSpacing: 0.07,
                                                lineHeight: 1.4,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: !valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.plusmember,
                                                      false)
                                                  ? valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText:
                                                            'Start your 7-day free trial. After the trial, your plan renews automatically at ',
                                                        deText:
                                                            'Teste 7 Tage kostenlos, dann verlängert sich dein Abo automatisch',
                                                        jaText:
                                                            '7日間無料でお試しください。気に入ったら、今すぐ継続してください。 ',
                                                      ),
                                                      'Start your 7-day free trial. After the trial, your plan renews automatically at ',
                                                    )
                                                  : ' ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                415.0
                                                            ? 10.0
                                                            : 12.0,
                                                        letterSpacing: 0.07,
                                                        lineHeight: 1.4,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                _model.priceString != null &&
                                                        _model.priceString != ''
                                                    ? valueOrDefault<String>(
                                                        () {
                                                          if (_model
                                                                  .packageId ==
                                                              'plusmember1') {
                                                            return valueOrDefault<
                                                                String>(
                                                              '${valueOrDefault<String>(
                                                                _model
                                                                    .priceString,
                                                                '€17.99',
                                                              )}${valueOrDefault<String>(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText:
                                                                      ' / month',
                                                                  deText:
                                                                      ' / Monat',
                                                                  jaText:
                                                                      ' / 月',
                                                                ),
                                                                ' / month',
                                                              )}',
                                                              '€17.99 / month',
                                                            );
                                                          } else if (_model
                                                                  .packageId ==
                                                              'plusmember6') {
                                                            return valueOrDefault<
                                                                String>(
                                                              '${valueOrDefault<String>(
                                                                _model
                                                                    .priceString,
                                                                '€84.99',
                                                              )}${valueOrDefault<String>(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText:
                                                                      ' / 6 months',
                                                                  deText:
                                                                      ' / 6 Monate',
                                                                  jaText:
                                                                      ' / 6ヶ月',
                                                                ),
                                                                ' / 6 months',
                                                              )}',
                                                              '€84.99 / 6 months',
                                                            );
                                                          } else if (_model
                                                                  .packageId ==
                                                              'plusmember12') {
                                                            return valueOrDefault<
                                                                String>(
                                                              '${valueOrDefault<String>(
                                                                _model
                                                                    .priceString,
                                                                '€139.99',
                                                              )}${valueOrDefault<String>(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText:
                                                                      ' / year',
                                                                  deText:
                                                                      ' / Jahr',
                                                                  jaText:
                                                                      ' / 年',
                                                                ),
                                                                ' / year',
                                                              )}',
                                                              '€139.99 / year',
                                                            );
                                                          } else {
                                                            return ' ';
                                                          }
                                                        }(),
                                                        '€139.99 / year',
                                                      )
                                                    : valueOrDefault<String>(
                                                        '${valueOrDefault<String>(
                                                          revenue_cat
                                                              .offerings!
                                                              .current!
                                                              .availablePackages
                                                              .where((e) =>
                                                                  e.identifier ==
                                                                  'plusmember12')
                                                              .toList()
                                                              .firstOrNull!
                                                              .storeProduct
                                                              .priceString,
                                                          '€0',
                                                        )}${valueOrDefault<String>(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                            enText: ' / year',
                                                            deText: ' / Jahr',
                                                            jaText: ' / 年',
                                                          ),
                                                          ' / year',
                                                        )}',
                                                        '€139.99 / year',
                                                      ),
                                                '€139.99 / year',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                415.0
                                                            ? 10.0
                                                            : 12.0,
                                                        letterSpacing: 0.07,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        lineHeight: 1.4,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'hivpj2fq' /* . Cancel anytime during the tr... */,
                                              ),
                                              style: GoogleFonts.urbanist(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            415.0
                                                        ? 10.0
                                                        : 12.0,
                                                height: 1.4,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'e3lyamf9' /*  Privacy policy */,
                                              ),
                                              style: GoogleFonts.urbanist(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            415.0
                                                        ? 10.0
                                                        : 12.0,
                                                height: 1.4,
                                              ),
                                              mouseCursor:
                                                  SystemMouseCursors.click,
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  logFirebaseEvent(
                                                      'SUBSCRIPTION_RichTextSpan_e9h44lgb_ON_TA');
                                                  if (FFLocalizations.of(
                                                              context)
                                                          .languageCode ==
                                                      'en') {
                                                    logFirebaseEvent(
                                                        'RichTextSpan_launch_u_r_l');
                                                    await launchURL(
                                                        'https://www.hiit-the-beat.com/app/privacy-policy');
                                                  } else {
                                                    logFirebaseEvent(
                                                        'RichTextSpan_launch_u_r_l');
                                                    await launchURL(
                                                        'https://www.hiit-the-beat.com/de/app/privacy-policy');
                                                  }
                                                },
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'tn4ewelj' /*  and  */,
                                              ),
                                              style: GoogleFonts.urbanist(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            415.0
                                                        ? 10.0
                                                        : 12.0,
                                                height: 1.4,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'lp2f9po6' /* Terms of Use */,
                                              ),
                                              style: GoogleFonts.urbanist(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            415.0
                                                        ? 10.0
                                                        : 12.0,
                                                height: 1.4,
                                              ),
                                              mouseCursor:
                                                  SystemMouseCursors.click,
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  logFirebaseEvent(
                                                      'SUBSCRIPTION_RichTextSpan_ulq11ab3_ON_TA');
                                                  if (FFLocalizations.of(
                                                              context)
                                                          .languageCode ==
                                                      'en') {
                                                    logFirebaseEvent(
                                                        'RichTextSpan_launch_u_r_l');
                                                    await launchURL(
                                                        'https://www.hiit-the-beat.com/app/terms-and-conditions');
                                                  } else {
                                                    logFirebaseEvent(
                                                        'RichTextSpan_launch_u_r_l');
                                                    await launchURL(
                                                        'https://www.hiit-the-beat.com/de/app/terms-and-conditions');
                                                  }
                                                },
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 12.0,
                                                letterSpacing: 0.07,
                                                lineHeight: 1.4,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'SUBSCRIPTION_Restorepurchase_ON_TAP');
                                                logFirebaseEvent(
                                                    'Restorepurchase_bottom_sheet');
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: DialogWidget(
                                                          text: valueOrDefault<
                                                              String>(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              enText:
                                                                  'Restoring purchases...',
                                                              deText:
                                                                  'Käufe werden wiederhergestellt...',
                                                              jaText:
                                                                  '購入を復元しています...',
                                                            ),
                                                            'Restoring purchases...',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                logFirebaseEvent(
                                                    'Restorepurchase_revenue_cat');
                                                unawaited(
                                                  () async {
                                                    await revenue_cat
                                                        .restorePurchases();
                                                  }(),
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'gc2akpkc' /* Restore purchase */,
                                              ),
                                              options: FFButtonOptions(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Colors.transparent,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              365.0
                                                          ? 10.0
                                                          : 12.0,
                                                      letterSpacing: 0.07,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      lineHeight: 1.4,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.plusmember,
                                            false))
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'SUBSCRIPTION_Cancelcurrentsubscription_O');
                                                    logFirebaseEvent(
                                                        'Cancelcurrentsubscription_haptic_feedbac');
                                                    HapticFeedback
                                                        .selectionClick();
                                                    logFirebaseEvent(
                                                        'Cancelcurrentsubscription_launch_u_r_l');
                                                    unawaited(
                                                      () async {
                                                        await launchURL(
                                                            valueOrDefault<
                                                                String>(
                                                          isiOS
                                                              ? FFAppConstants
                                                                  .subsAppleURL
                                                              : FFAppConstants
                                                                  .subsGoogleURL,
                                                          'https://play.google.com/store',
                                                        ));
                                                      }(),
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'aemzehtp' /* Cancel current subscription */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Colors.transparent,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize:
                                                                  MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          365.0
                                                                      ? 10.0
                                                                      : 12.0,
                                                              letterSpacing:
                                                                  0.07,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              lineHeight: 1.4,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallIsCustom,
                                                            ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ].addToEnd(SizedBox(height: 14.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ].divide(SizedBox(height: 16.0)).addToStart(SizedBox(height: 48.0)),
          ),
        ),
      ),
    );
  }
}
