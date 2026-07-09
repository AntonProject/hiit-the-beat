import '/auth/firebase_auth/auth_util.dart';
import '/components/navbar_active_button/navbar_active_button_widget.dart';
import '/components/navbar_inactive_button/navbar_inactive_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    int? pageNumber,
  }) : this.pageNumber = pageNumber ?? 1;

  final int pageNumber;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NAVBAR_COMP_navbar_ON_INIT_STATE');
      logFirebaseEvent('navbar_action_block');
      await action_blocks.recheckUserDeviceLanguage(context);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 34.0),
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).alternate,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context) {
                  if (widget!.pageNumber == 1) {
                    return wrapWithModel(
                      model: _model.homeActiveButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarActiveButtonWidget(
                        icon: Icon(
                          FFIcons.khome20,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        text: 'Home',
                      ),
                    );
                  } else {
                    return wrapWithModel(
                      model: _model.homeInactiveButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarInactiveButtonWidget(
                        icon: Icon(
                          FFIcons.khome20,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        action: () async {
                          logFirebaseEvent(
                              'NAVBAR_COMP_homeInactiveButton_CALLBACK');
                          logFirebaseEvent(
                              'homeInactiveButton_haptic_feedback');
                          HapticFeedback.mediumImpact();
                          logFirebaseEvent('homeInactiveButton_action_block');
                          await action_blocks
                              .recheckUserDeviceLanguage(context);
                          logFirebaseEvent('homeInactiveButton_navigate_to');

                          context.goNamed(
                            HomePageWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              Builder(
                builder: (context) {
                  if (widget!.pageNumber == 2) {
                    return wrapWithModel(
                      model: _model.workoutActiveButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarActiveButtonWidget(
                        icon: Icon(
                          FFIcons.kcollections20,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        text: FFLocalizations.of(context).getText(
                          '6cm7wb2r' /* Workout collections */,
                        ),
                      ),
                    );
                  } else {
                    return wrapWithModel(
                      model: _model.workoutInactiveButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarInactiveButtonWidget(
                        icon: Icon(
                          FFIcons.kcollections20,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        action: () async {
                          logFirebaseEvent(
                              'NAVBAR_workoutInactiveButton_CALLBACK');
                          logFirebaseEvent(
                              'workoutInactiveButton_haptic_feedback');
                          HapticFeedback.mediumImpact();
                          logFirebaseEvent(
                              'workoutInactiveButton_action_block');
                          await action_blocks
                              .recheckUserDeviceLanguage(context);
                          logFirebaseEvent('workoutInactiveButton_navigate_to');

                          context.goNamed(
                            SeasonWorkoutPageWidget.routeName,
                            queryParameters: {
                              'level': serializeParam(
                                valueOrDefault<int>(
                                  valueOrDefault(
                                      currentUserDocument?.currentLevel, 0),
                                  1,
                                ),
                                ParamType.int,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              Builder(
                builder: (context) {
                  if (widget!.pageNumber == 3) {
                    return wrapWithModel(
                      model: _model.addActiveButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarActiveButtonWidget(
                        icon: Icon(
                          FFIcons.kadditionals20,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        text: FFLocalizations.of(context).getText(
                          'wo69idjh' /* Additionals */,
                        ),
                      ),
                    );
                  } else {
                    return wrapWithModel(
                      model: _model.addInactiveButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarInactiveButtonWidget(
                        icon: Icon(
                          FFIcons.kadditionals20,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        action: () async {
                          logFirebaseEvent(
                              'NAVBAR_COMP_addInactiveButton_CALLBACK');
                          logFirebaseEvent('addInactiveButton_haptic_feedback');
                          HapticFeedback.mediumImpact();
                          logFirebaseEvent('addInactiveButton_action_block');
                          await action_blocks
                              .recheckUserDeviceLanguage(context);
                          logFirebaseEvent('addInactiveButton_navigate_to');

                          context.goNamed(
                            AdditionalsPageWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              Builder(
                builder: (context) {
                  if (widget!.pageNumber == 4) {
                    return wrapWithModel(
                      model: _model.profileActiveButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarActiveButtonWidget(
                        icon: Icon(
                          FFIcons.kuser20,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        text: FFLocalizations.of(context).getText(
                          'c6q3xdkd' /* Profile */,
                        ),
                      ),
                    );
                  } else {
                    return wrapWithModel(
                      model: _model.profileInactiveButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarInactiveButtonWidget(
                        icon: Icon(
                          FFIcons.kuser20,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        action: () async {
                          logFirebaseEvent(
                              'NAVBAR_profileInactiveButton_CALLBACK');
                          logFirebaseEvent(
                              'profileInactiveButton_haptic_feedback');
                          HapticFeedback.mediumImpact();
                          logFirebaseEvent(
                              'profileInactiveButton_action_block');
                          await action_blocks
                              .recheckUserDeviceLanguage(context);
                          logFirebaseEvent('profileInactiveButton_navigate_to');

                          context.goNamed(
                            ProfilePageWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
