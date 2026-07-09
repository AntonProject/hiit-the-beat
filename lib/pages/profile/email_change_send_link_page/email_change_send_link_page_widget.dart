import '/auth/firebase_auth/auth_util.dart';
import '/components/page_component/email_change_success/email_change_success_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'email_change_send_link_page_model.dart';
export 'email_change_send_link_page_model.dart';

class EmailChangeSendLinkPageWidget extends StatefulWidget {
  const EmailChangeSendLinkPageWidget({
    super.key,
    required this.email,
  });

  final String? email;

  static String routeName = 'EmailChangeSendLinkPage';
  static String routePath = '/emailChangeSendLinkPage';

  @override
  State<EmailChangeSendLinkPageWidget> createState() =>
      _EmailChangeSendLinkPageWidgetState();
}

class _EmailChangeSendLinkPageWidgetState
    extends State<EmailChangeSendLinkPageWidget> {
  late EmailChangeSendLinkPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailChangeSendLinkPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EmailChangeSendLinkPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EMAIL_CHANGE_SEND_LINK_EmailChangeSendLi');
      logFirebaseEvent('EmailChangeSendLinkPage_custom_action');
      unawaited(
        () async {
          await actions.setStatusBarColor();
        }(),
      );
      logFirebaseEvent('EmailChangeSendLinkPage_start_periodic_a');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          if (widget!.email == currentUserEmail) {
            logFirebaseEvent('EmailChangeSendLinkPage_bottom_sheet');
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              isDismissible: false,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: EmailChangeSuccessWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          }
        },
        startImmediately: true,
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).middleGray,
                    borderRadius: 12.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      FFIcons.karrowLeft24,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'EMAIL_CHANGE_SEND_LINK_arrowLeft24_ICN_O');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'z90bzxho' /* We sent the link to the  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.3,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                widget!.email,
                                'example@gmail.com',
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.3,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'rvff6jvm' /* Follow this link to change ema... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.07,
                                lineHeight: 1.4,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    ].addToStart(SizedBox(height: 24.0)),
                  ),
                ),
              ),
              if (!_model.timer)
                FFButtonWidget(
                  onPressed: (widget!.email == null || widget!.email == '')
                      ? null
                      : () async {
                          logFirebaseEvent(
                              'EMAIL_CHANGE_SEND_LINK_resend_ON_TAP');
                          logFirebaseEvent('resend_haptic_feedback');
                          HapticFeedback.selectionClick();
                          logFirebaseEvent('resend_wait__delay');
                          await Future.delayed(
                            Duration(
                              milliseconds: 500,
                            ),
                          );
                          logFirebaseEvent('resend_timer');
                          _model.timerController.onResetTimer();

                          logFirebaseEvent('resend_update_page_state');
                          _model.timer = true;
                          safeSetState(() {});
                          logFirebaseEvent('resend_wait__delay');
                          await Future.delayed(
                            Duration(
                              milliseconds: 500,
                            ),
                          );
                          logFirebaseEvent('resend_timer');
                          _model.timerController.onStartTimer();
                          logFirebaseEvent('resend_update_page_state');

                          safeSetState(() {});
                          logFirebaseEvent('resend_auth');
                          if (widget!.email!.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  FFLocalizations.of(context).getText(
                                    'vpfdzl3u' /* Email required! */,
                                  ),
                                ),
                              ),
                            );
                            return;
                          }

                          await authManager.updateEmail(
                            email: widget!.email!,
                            context: context,
                          );
                          safeSetState(() {});
                        },
                  text: FFLocalizations.of(context).getText(
                    'ma77uizh' /* Resend */,
                  ),
                  options: FFButtonOptions(
                    width: 100.0,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 14.0,
                          letterSpacing: 0.07,
                          lineHeight: 1.4,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              if (_model.timer)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'urbuh3wp' /* Resend */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).gray,
                            letterSpacing: 0.07,
                            fontWeight: FontWeight.w600,
                            lineHeight: 1.4,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                    FlutterFlowTimer(
                      initialTime: _model.timerInitialTimeMs,
                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        milliSecond: false,
                      ),
                      controller: _model.timerController,
                      updateStateInterval: Duration(milliseconds: 1000),
                      onChanged: (value, displayTime, shouldUpdate) {
                        _model.timerMilliseconds = value;
                        _model.timerValue = displayTime;
                        if (shouldUpdate) safeSetState(() {});
                      },
                      onEnded: () async {
                        logFirebaseEvent(
                            'EMAIL_CHANGE_SEND_LINK_Timer_szp8p635_ON');
                        logFirebaseEvent('Timer_update_page_state');
                        _model.timer = false;
                        safeSetState(() {});
                        if (widget!.email == currentUserEmail) {
                          logFirebaseEvent('Timer_bottom_sheet');
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            isDismissible: false,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: EmailChangeSuccessWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      },
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                color: FlutterFlowTheme.of(context).gray,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                lineHeight: 1.4,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineSmallIsCustom,
                              ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
            ]
                .divide(SizedBox(height: 16.0))
                .addToStart(SizedBox(height: 48.0))
                .addToEnd(SizedBox(height: 34.0)),
          ),
        ),
      ),
    );
  }
}
