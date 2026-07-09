import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/advanced_seasons_done_dialog/advanced_seasons_done_dialog_widget.dart';
import '/components/dialogs/beginner_seasons_done_dialog/beginner_seasons_done_dialog_widget.dart';
import '/components/dialogs/expert_seasons_done_dialog/expert_seasons_done_dialog_widget.dart';
import '/components/dialogs/gos_mode_seasons_done_dialog/gos_mode_seasons_done_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'season_done_dialog_model.dart';
export 'season_done_dialog_model.dart';

class SeasonDoneDialogWidget extends StatefulWidget {
  const SeasonDoneDialogWidget({
    super.key,
    required this.season,
    required this.progress,
    required this.seasonNumber,
  });

  final SeasonsRecord? season;
  final DocumentReference? progress;
  final int? seasonNumber;

  @override
  State<SeasonDoneDialogWidget> createState() => _SeasonDoneDialogWidgetState();
}

class _SeasonDoneDialogWidgetState extends State<SeasonDoneDialogWidget>
    with TickerProviderStateMixin {
  late SeasonDoneDialogModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeasonDoneDialogModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 1.0),
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/frame_1410103595.webp',
                  ).image,
                ),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation1']!),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF9C244C), Color(0xFF2883AE)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kcheckmark24,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 54.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'f8v79pyt' /* SEASON */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 24.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.4,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                formatNumber(
                                  valueOrDefault<int>(
                                        widget!.seasonNumber,
                                        0,
                                      ) +
                                      1,
                                  formatType: FormatType.custom,
                                  format: ' 0 ',
                                  locale: '',
                                ),
                                ' 1 ',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 24.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.4,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'xpzitrhb' /* IS DONE! */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 24.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.bold,
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
                                fontSize: 24.0,
                                letterSpacing: 0.07,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.4,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'u68427cb' /* You’re getting stronger. Let´s... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.07,
                            fontWeight: FontWeight.w600,
                            lineHeight: 1.4,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'SEASON_DONE_DIALOG_Gotonextseason_ON_TAP');
                          logFirebaseEvent('Gotonextseason_haptic_feedback');
                          HapticFeedback.selectionClick();
                          logFirebaseEvent('Gotonextseason_backend_call');
                          _model.progress =
                              await ProgressRecord.getDocumentOnce(
                                  widget!.progress!);
                          logFirebaseEvent('Gotonextseason_custom_action');
                          _model.allSeasonDone =
                              await actions.allSeasonDoneByLevel(
                            valueOrDefault<int>(
                              valueOrDefault(
                                  currentUserDocument?.currentLevel, 0),
                              1,
                            ),
                            _model.progress?.seasonDone?.toList(),
                            valueOrDefault<String>(
                              FFAppState().seasonFilter,
                              'de',
                            ),
                            valueOrDefault<bool>(
                              FFAppState().hideCompleted,
                              false,
                            ),
                          );
                          if (_model.allSeasonDone!) {
                            if (widget!.season?.level == 1) {
                              logFirebaseEvent('Gotonextseason_bottom_sheet');
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: BeginnerSeasonsDoneDialogWidget(),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else if (widget!.season?.level == 2) {
                              logFirebaseEvent('Gotonextseason_bottom_sheet');
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: AdvancedSeasonsDoneDialogWidget(),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else if (widget!.season?.level == 3) {
                              logFirebaseEvent('Gotonextseason_bottom_sheet');
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ExpertSeasonsDoneDialogWidget(),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else if (widget!.season?.level == 4) {
                              logFirebaseEvent('Gotonextseason_bottom_sheet');
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: GosModeSeasonsDoneDialogWidget(),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          } else {
                            logFirebaseEvent('Gotonextseason_custom_action');
                            _model.nextSeason = await actions.seasonIdNext(
                              _model.progress?.workoutDone?.toList(),
                              valueOrDefault<int>(
                                valueOrDefault(
                                    currentUserDocument?.currentLevel, 0),
                                1,
                              ),
                              valueOrDefault<String>(
                                FFAppState().seasonFilter,
                                'de',
                              ),
                              valueOrDefault<bool>(
                                FFAppState().hideCompleted,
                                false,
                              ),
                              _model.progress?.seasonDone?.toList(),
                            );
                            logFirebaseEvent('Gotonextseason_firestore_query');
                            _model.countNext = await queryWorkoutsRecordCount(
                              queryBuilder: (workoutsRecord) =>
                                  workoutsRecord.where(
                                'season_id',
                                isEqualTo: _model.nextSeason?.reference.id,
                              ),
                            );
                            logFirebaseEvent('Gotonextseason_bottom_sheet');
                            Navigator.pop(context);
                            logFirebaseEvent('Gotonextseason_navigate_to');

                            context.pushNamed(
                              SeasonPageWidget.routeName,
                              queryParameters: {
                                'season': serializeParam(
                                  _model.nextSeason,
                                  ParamType.Document,
                                ),
                                'workoutCount': serializeParam(
                                  _model.countNext,
                                  ParamType.int,
                                ),
                                'seasonIndex': serializeParam(
                                  valueOrDefault<int>(
                                    _model.nextSeason?.number,
                                    0,
                                  ),
                                  ParamType.int,
                                ),
                                'selectedLvl': serializeParam(
                                  valueOrDefault<int>(
                                    valueOrDefault(
                                        currentUserDocument?.currentLevel, 0),
                                    1,
                                  ),
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'season': _model.nextSeason,
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '93tk94wz' /* Go to next season */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 14.0,
                                letterSpacing: 0.07,
                                lineHeight: 1.4,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleSmallIsCustom,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 8.0))
                      .addToStart(SizedBox(height: 8.0))
                      .addToEnd(SizedBox(height: 34.0)),
                ),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation2']!),
          ),
        ],
      ),
    );
  }
}
