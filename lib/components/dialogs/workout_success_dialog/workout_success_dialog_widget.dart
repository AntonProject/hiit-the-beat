import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/dialogs/season_done_dialog/season_done_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workout_success_dialog_model.dart';
export 'workout_success_dialog_model.dart';

class WorkoutSuccessDialogWidget extends StatefulWidget {
  const WorkoutSuccessDialogWidget({
    super.key,
    required this.workoutDone,
    required this.progress,
    required this.season,
    int? wockoutCount,
    required this.seasonNumber,
  }) : this.wockoutCount = wockoutCount ?? 0;

  final WorkoutStatisticStruct? workoutDone;
  final DocumentReference? progress;
  final SeasonsRecord? season;
  final int wockoutCount;
  final int? seasonNumber;

  @override
  State<WorkoutSuccessDialogWidget> createState() =>
      _WorkoutSuccessDialogWidgetState();
}

class _WorkoutSuccessDialogWidgetState extends State<WorkoutSuccessDialogWidget>
    with TickerProviderStateMixin {
  late WorkoutSuccessDialogModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutSuccessDialogModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/frame_100000679622.webp',
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 36.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 2),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              valueOrDefault<String>(
                                formatNumber(
                                  valueOrDefault<int>(
                                        widget!.workoutDone?.warpmupPoints,
                                        0,
                                      ) +
                                      valueOrDefault<int>(
                                        widget!.workoutDone?.cooldownPoints,
                                        0,
                                      ) +
                                      valueOrDefault<int>(
                                        widget!.workoutDone?.workoutPoints,
                                        0,
                                      ),
                                  formatType: FormatType.custom,
                                  format: '+ 0',
                                  locale: '',
                                ),
                                '+ 0',
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 24.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.4,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            AutoSizeText(
                              FFLocalizations.of(context).getText(
                                'q6q0100i' /* points */,
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.4,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ]
                              .addToStart(SizedBox(height: 8.0))
                              .addToEnd(SizedBox(height: 8.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: AutoSizeText(
                          FFLocalizations.of(context).getText(
                            '9es261xp' /* YOU ARE INSANE! */,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
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
                      ),
                      AutoSizeText(
                        FFLocalizations.of(context).getText(
                          '4rgsh6mz' /* Keep up the great work */,
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.07,
                              fontWeight: FontWeight.w600,
                              lineHeight: 1.4,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 12.0,
                            sigmaY: 12.0,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).black30,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: AutoSizeText(
                                            FFLocalizations.of(context).getText(
                                              '27k05ixx' /* Warm Up */,
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.07,
                                                  lineHeight: 1.4,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            '${valueOrDefault<String>(
                                              formatNumber(
                                                widget!
                                                    .workoutDone?.warpmupPoints,
                                                formatType: FormatType.custom,
                                                format: '+ 0 ',
                                                locale: '',
                                              ),
                                              '+ 0 ',
                                            )}${valueOrDefault<String>(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'points',
                                                deText: 'Punkte',
                                                jaText: 'ポイント',
                                              ),
                                              'points',
                                            )}',
                                            '+ 0 points',
                                          ),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                letterSpacing: 0.07,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.4,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: AutoSizeText(
                                            FFLocalizations.of(context).getText(
                                              '5nmj1xo1' /* Workout */,
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.07,
                                                  lineHeight: 1.4,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            '${valueOrDefault<String>(
                                              formatNumber(
                                                widget!
                                                    .workoutDone?.workoutPoints,
                                                formatType: FormatType.custom,
                                                format: '+ 0 ',
                                                locale: '',
                                              ),
                                              '+ 0 ',
                                            )}${valueOrDefault<String>(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'points',
                                                deText: 'punkte',
                                                jaText: 'ポイント',
                                              ),
                                              'points',
                                            )}',
                                            '+ 0 points',
                                          ),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                letterSpacing: 0.07,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.4,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: AutoSizeText(
                                            FFLocalizations.of(context).getText(
                                              'wn9gl3cq' /* Cool Down */,
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.07,
                                                  lineHeight: 1.4,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            '${valueOrDefault<String>(
                                              formatNumber(
                                                widget!.workoutDone
                                                    ?.cooldownPoints,
                                                formatType: FormatType.custom,
                                                format: '+ 0 ',
                                                locale: '',
                                              ),
                                              '+ 0 ',
                                            )}${valueOrDefault<String>(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'points',
                                                deText: 'punkte',
                                                jaText: 'ポイント',
                                              ),
                                              'points',
                                            )}',
                                            '+ 0 points',
                                          ),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                letterSpacing: 0.07,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.4,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ]
                        .divide(SizedBox(height: 12.0))
                        .addToStart(SizedBox(height: 24.0)),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'WORKOUT_SUCCESS_DIALOG_LetsGo_ON_TAP');
                        var _shouldSetState = false;
                        logFirebaseEvent('LetsGo_haptic_feedback');
                        HapticFeedback.selectionClick();
                        logFirebaseEvent('LetsGo_backend_call');
                        _model.progress = await ProgressRecord.getDocumentOnce(
                            widget!.progress!);
                        _shouldSetState = true;
                        logFirebaseEvent('LetsGo_bottom_sheet');
                        Navigator.pop(context);
                        if (functions.workoutSeasonDone(
                            _model.progress?.workoutDone?.toList(),
                            widget!.season!.reference.id,
                            widget!.wockoutCount)) {
                          if (!functions.seasonDoneExist(
                              _model.progress?.seasonDone?.toList(),
                              widget!.season!.reference.id)) {
                            logFirebaseEvent('LetsGo_backend_call');
                            unawaited(
                              () async {
                                await widget!.progress!.update({
                                  ...mapToFirestore(
                                    {
                                      'season_done': FieldValue.arrayUnion([
                                        getSeasonStatisticFirestoreData(
                                          updateSeasonStatisticStruct(
                                            SeasonStatisticStruct(
                                              seasonNumber: valueOrDefault<int>(
                                                widget!.season?.number,
                                                1,
                                              ),
                                              datetime: getCurrentTimestamp,
                                              seasonLevel: valueOrDefault<int>(
                                                widget!.season?.level,
                                                1,
                                              ),
                                              seasonId:
                                                  widget!.season?.reference.id,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                              }(),
                            );
                            logFirebaseEvent('LetsGo_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SeasonDoneDialogWidget(
                                    season: widget!.season!,
                                    progress: widget!.progress!,
                                    seasonNumber: valueOrDefault<int>(
                                      widget!.seasonNumber,
                                      0,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          logFirebaseEvent('LetsGo_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('LetsGo_navigate_to');

                          context.goNamed(
                            SeasonPageWidget.routeName,
                            queryParameters: {
                              'season': serializeParam(
                                widget!.season,
                                ParamType.Document,
                              ),
                              'workoutCount': serializeParam(
                                valueOrDefault<int>(
                                  widget!.wockoutCount,
                                  0,
                                ),
                                ParamType.int,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'season': widget!.season,
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'bj8er4cy' /* Let’s Go! */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
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
                ],
              ),
            ),
          ].addToEnd(SizedBox(height: 34.0)),
        ),
      ),
    );
  }
}
