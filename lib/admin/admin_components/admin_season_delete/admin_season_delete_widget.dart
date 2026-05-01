import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_season_delete_model.dart';
export 'admin_season_delete_model.dart';

class AdminSeasonDeleteWidget extends StatefulWidget {
  const AdminSeasonDeleteWidget({
    super.key,
    required this.season,
  });

  final SeasonsRecord? season;

  @override
  State<AdminSeasonDeleteWidget> createState() =>
      _AdminSeasonDeleteWidgetState();
}

class _AdminSeasonDeleteWidgetState extends State<AdminSeasonDeleteWidget> {
  late AdminSeasonDeleteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminSeasonDeleteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('ADMIN_SEASON_DELETE_Column_5s8mz6s0_ON_T');
        logFirebaseEvent('Column_close_dialog_drawer_etc');
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.35,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 36.0, 24.0, 36.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '44136c4q' /* Delete Season 
 */
                                ,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 20.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.4,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                '${valueOrDefault<String>(
                                  formatNumber(
                                    widget!.season?.number,
                                    formatType: FormatType.custom,
                                    format: '0. ',
                                    locale: '',
                                  ),
                                  '1. ',
                                )}${valueOrDefault<String>(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: valueOrDefault<String>(
                                      widget!.season?.titleEn,
                                      '-',
                                    ),
                                    deText: valueOrDefault<String>(
                                      widget!.season?.titleDe,
                                      '-',
                                    ),
                                    jaText: valueOrDefault<String>(
                                      widget!.season?.titleJa,
                                      '-',
                                    ),
                                  ),
                                  '-',
                                )}',
                                '1. ',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 20.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.4,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'w4dp0y0m' /*  You’ll not be able to undo th... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_SEASON_DELETE_YES_DELETE_BTN_ON_TA');
                                logFirebaseEvent('Button_haptic_feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('Button_cloud_function');
                                unawaited(
                                  () async {
                                    try {
                                      final result =
                                          await FirebaseFunctions.instanceFor(
                                                  region: 'europe-west3')
                                              .httpsCallable(
                                                  'deleteWorkoutsSeason')
                                              .call({
                                        "seasonId":
                                            widget!.season!.reference.id,
                                      });
                                      _model.seasonDelete =
                                          DeleteWorkoutsSeasonCloudFunctionCallResponse(
                                        succeeded: true,
                                      );
                                    } on FirebaseFunctionsException catch (error) {
                                      _model.seasonDelete =
                                          DeleteWorkoutsSeasonCloudFunctionCallResponse(
                                        errorCode: error.code,
                                        succeeded: false,
                                      );
                                    }
                                  }(),
                                );
                                logFirebaseEvent('Button_backend_call');
                                await widget!.season!.reference.delete();
                                logFirebaseEvent('Button_navigate_to');

                                context.goNamed(
                                  AdminSeasonsWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );

                                logFirebaseEvent('Button_bottom_sheet');
                                Navigator.pop(context);

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'w46hcok7' /* Yes, delete */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 36.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.07,
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_SEASON_DELETE_NO_CANCEL_BTN_ON_TAP');
                                logFirebaseEvent('Button_haptic_feedback');
                                HapticFeedback.selectionClick();
                                logFirebaseEvent('Button_bottom_sheet');
                                Navigator.pop(context);
                              },
                              text: FFLocalizations.of(context).getText(
                                'jctsbof6' /* No, cancel */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 36.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.07,
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
