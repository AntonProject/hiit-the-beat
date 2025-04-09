import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog/dialog_widget.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/payment_dialog/payment_dialog_widget.dart';
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
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.lockLandscapeMode();
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                                lineHeight: 1.4,
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                                lineHeight: 1.4,
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
                                            HapticFeedback.mediumImpact();
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
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
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
                                                            'tqv5js2f' /* GET 2.5 MONTHS FREE! */,
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
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                                lineHeight:
                                                                    1.25,
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
                                                                            'Yearly',
                                                                        deText:
                                                                            'jährlich',
                                                                      ),
                                                                      'Yearly',
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
                                                                            'monatlich',
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
                                                                            'Yearly',
                                                                        deText:
                                                                            'jährlich',
                                                                      ),
                                                                      'Yearly',
                                                                    );
                                                                  }
                                                                }(),
                                                                'Yearly',
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
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    lineHeight:
                                                                        1.4,
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
                                                                            'Yearly',
                                                                        deText:
                                                                            'jährlich',
                                                                      ),
                                                                      'Yearly',
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
                                                                            'monatlich',
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
                                                                      ),
                                                                      'Monthly',
                                                                    );
                                                                  }
                                                                }(),
                                                                'Yearly',
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
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    lineHeight:
                                                                        1.4,
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
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            lineHeight:
                                                                                1.4,
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
                                                                              ),
                                                                              ' / 6 months',
                                                                            );
                                                                          } else if (packagesItem.identifier ==
                                                                              'plusmember12') {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / year',
                                                                                deText: ' / Jahr',
                                                                              ),
                                                                              ' / year',
                                                                            );
                                                                          } else if (packagesItem.identifier ==
                                                                              'plusmember1') {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / month',
                                                                                deText: ' / Monat',
                                                                              ),
                                                                              ' / year',
                                                                            );
                                                                          } else {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / month',
                                                                                deText: ' / Monat',
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
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            lineHeight:
                                                                                1.4,
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
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        lineHeight:
                                                                            1.4,
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
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            lineHeight:
                                                                                1.4,
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
                                                                              ),
                                                                              ' / 6 months',
                                                                            );
                                                                          } else if (packagesItem.identifier ==
                                                                              'plusmember12') {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / year',
                                                                                deText: ' / Jahr',
                                                                              ),
                                                                              ' / year',
                                                                            );
                                                                          } else if (packagesItem.identifier ==
                                                                              'plusmember1') {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / month',
                                                                                deText: ' / Monat',
                                                                              ),
                                                                              ' / year',
                                                                            );
                                                                          } else {
                                                                            return valueOrDefault<String>(
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: ' / month',
                                                                                deText: ' / Monat',
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
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            lineHeight:
                                                                                1.4,
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
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        lineHeight:
                                                                            1.4,
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
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                    '3j0q74op' /* Only $2.40 / week — less than ... */,
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
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                              .addToStart(SizedBox(height: 24.0))
                              .addToEnd(SizedBox(height: 220.0)),
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
                                          HapticFeedback.selectionClick();
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
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
                                                  child: PaymentDialogWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
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
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                                lineHeight: 1.4,
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
                                                var _shouldSetState = false;
                                                HapticFeedback.selectionClick();
                                                if (currentUserEmail != '') {
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
                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        plusmember: true,
                                                      ));
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

                                                    await action_blocks
                                                        .removeAllActiveCampaignSubscriptions(
                                                      context,
                                                      id: valueOrDefault(
                                                          currentUserDocument
                                                              ?.activeCampgainContactId,
                                                          ''),
                                                    );

                                                    await currentUserReference!
                                                        .update(
                                                            createUsersRecordData(
                                                      hasPayable: true,
                                                    ));
                                                  } else {
                                                    context.safePop();
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                } else {
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
                                                  ),
                                                  'Start your 7-day free trial',
                                                )
                                              : valueOrDefault<String>(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText: 'Go to payment',
                                                    deText:
                                                        'Weiter zur Zahlung',
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
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                                lineHeight: 1.4,
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
                                                            'Try 7 days for free. If you love it, continue for just ',
                                                        deText:
                                                            'Teste 7 Tage kostenlos, dann ',
                                                      ),
                                                      'Try 7 days for free. If you love it, continue for just ',
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
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.07,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                        lineHeight: 1.4,
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
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.07,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                        lineHeight: 1.4,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'hivpj2fq' /*  (billed annually, $125 charge... */,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 12.0,
                                                height: 1.4,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'e3lyamf9' /* privacy policy */,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 12.0,
                                                height: 1.4,
                                              ),
                                              mouseCursor:
                                                  SystemMouseCursors.click,
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  context.pushNamed(
                                                      PolicyPageWidget
                                                          .routeName);
                                                },
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'tn4ewelj' /*  and  */,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 12.0,
                                                height: 1.4,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'lp2f9po6' /* terms of use */,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 12.0,
                                                height: 1.4,
                                              ),
                                              mouseCursor:
                                                  SystemMouseCursors.click,
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  context.pushNamed(
                                                      TermsPageWidget
                                                          .routeName);
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
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                                lineHeight: 1.4,
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
                                                            ),
                                                            'Restoring purchases...',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

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
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.07,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                          lineHeight: 1.4,
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
                                                    HapticFeedback
                                                        .selectionClick();
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
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.07,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                          lineHeight: 1.4,
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
                                ].addToEnd(SizedBox(height: 34.0)),
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
