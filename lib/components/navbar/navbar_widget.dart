import '/components/navbar_active_button/navbar_active_button_widget.dart';
import '/components/navbar_inactive_button/navbar_inactive_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  if (widget.pageNumber == 1) {
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
                          HapticFeedback.mediumImpact();

                          context.goNamed(
                            HomePageWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
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
                  if (widget.pageNumber == 2) {
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
                          HapticFeedback.mediumImpact();

                          context.goNamed(
                            SeasonWorkoutPageWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
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
                  if (widget.pageNumber == 3) {
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
                          HapticFeedback.mediumImpact();

                          context.goNamed(
                            AdditionalsPageWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
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
                  if (widget.pageNumber == 4) {
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
                          HapticFeedback.mediumImpact();

                          context.goNamed(
                            ProfilePageWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
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
