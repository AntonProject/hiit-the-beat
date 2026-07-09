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
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workout_success3times_dialog_model.dart';
export 'workout_success3times_dialog_model.dart';

class WorkoutSuccess3timesDialogWidget extends StatefulWidget {
  const WorkoutSuccess3timesDialogWidget({
    super.key,
    required this.workoutDone,
    int? workoutCount,
    required this.season,
    required this.progress,
    required this.seasonNumber,
    int? selectedLvl,
  })  : this.workoutCount = workoutCount ?? 0,
        this.selectedLvl = selectedLvl ?? 1;

  final WorkoutStatisticStruct? workoutDone;
  final int workoutCount;
  final SeasonsRecord? season;
  final DocumentReference? progress;
  final int? seasonNumber;
  final int selectedLvl;

  @override
  State<WorkoutSuccess3timesDialogWidget> createState() =>
      _WorkoutSuccess3timesDialogWidgetState();
}

class _WorkoutSuccess3timesDialogWidgetState
    extends State<WorkoutSuccess3timesDialogWidget>
    with TickerProviderStateMixin {
  late WorkoutSuccess3timesDialogModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutSuccess3timesDialogModel());

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
    context.watch<FFAppState>();

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
              flex: 5,
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/frame_1000006796.webp',
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
                      Spacer(),
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
                                '0iji3oos' /* points */,
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
                            '1t6vwh32' /* NICELY DONE! */,
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
                          'uuh2zkwa' /* You've done this workout 3 tim... */,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 4,
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
                                              'knyyti6y' /* Warm Up */,
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
                                              'fl1vsckd' /* Workout */,
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
                                              'g25b1yqv' /* Cool Down */,
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: StreamBuilder<ProgressRecord>(
                  stream: ProgressRecord.getDocument(widget!.progress!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: SpinKitRipple(
                            color: FlutterFlowTheme.of(context).green,
                            size: 20.0,
                          ),
                        ),
                      );
                    }

                    final columnProgressRecord = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'WORKOUT_SUCCESS3TIMES_DIALOG_Finish_ON_T');
                            logFirebaseEvent('Finish_haptic_feedback');
                            HapticFeedback.selectionClick();
                            logFirebaseEvent('Finish_bottom_sheet');
                            Navigator.pop(context);
                            if (functions.workoutSeasonDone(
                                columnProgressRecord.workoutDone.toList(),
                                widget!.season!.reference.id,
                                widget!.workoutCount)) {
                              if (!functions.seasonDoneExist(
                                  columnProgressRecord.seasonDone.toList(),
                                  widget!.season!.reference.id)) {
                                logFirebaseEvent('Finish_backend_call');
                                unawaited(
                                  () async {
                                    await widget!.progress!.update({
                                      ...mapToFirestore(
                                        {
                                          'season_done': FieldValue.arrayUnion([
                                            getSeasonStatisticFirestoreData(
                                              updateSeasonStatisticStruct(
                                                SeasonStatisticStruct(
                                                  seasonNumber:
                                                      valueOrDefault<int>(
                                                    widget!.season?.number,
                                                    1,
                                                  ),
                                                  datetime: getCurrentTimestamp,
                                                  seasonLevel:
                                                      valueOrDefault<int>(
                                                    widget!.season?.level,
                                                    1,
                                                  ),
                                                  seasonId: widget!
                                                      .season?.reference.id,
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
                                logFirebaseEvent('Finish_bottom_sheet');
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
                                        seasonNumber: widget!.seasonNumber!,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              }
                              return;
                            } else {
                              logFirebaseEvent('Finish_bottom_sheet');
                              Navigator.pop(context);
                              logFirebaseEvent('Finish_navigate_to');

                              context.goNamed(
                                SeasonPageWidget.routeName,
                                queryParameters: {
                                  'season': serializeParam(
                                    widget!.season,
                                    ParamType.Document,
                                  ),
                                  'workoutCount': serializeParam(
                                    widget!.workoutCount,
                                    ParamType.int,
                                  ),
                                  'seasonIndex': serializeParam(
                                    widget!.seasonNumber,
                                    ParamType.int,
                                  ),
                                  'selectedLvl': serializeParam(
                                    valueOrDefault<int>(
                                      widget!.selectedLvl,
                                      1,
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

                              return;
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            'nig2c2xf' /* Finish */,
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
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'WORKOUT_SUCCESS3TIMES_DIALOG_Ididnthavee');
                            logFirebaseEvent(
                                'Ididnthaveenough_haptic_feedback');
                            HapticFeedback.selectionClick();
                            logFirebaseEvent('Ididnthaveenough_bottom_sheet');
                            Navigator.pop(context);
                            if (functions.seasonDoneExist(
                                columnProgressRecord.seasonDone.toList(),
                                widget!.season!.reference.id)) {
                              logFirebaseEvent(
                                  'Ididnthaveenough_custom_action');
                              _model.nextSeason = await actions.seasonIdNext(
                                columnProgressRecord.workoutDone.toList(),
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
                                columnProgressRecord.seasonDone.toList(),
                              );
                              logFirebaseEvent(
                                  'Ididnthaveenough_firestore_query');
                              _model.countNext = await queryWorkoutsRecordCount(
                                queryBuilder: (workoutsRecord) =>
                                    workoutsRecord.where(
                                  'season_id',
                                  isEqualTo: _model.nextSeason?.reference.id,
                                ),
                              );
                              logFirebaseEvent('Ididnthaveenough_navigate_to');

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
                                    _model.nextSeason?.number,
                                    ParamType.int,
                                  ),
                                  'selectedLvl': serializeParam(
                                    valueOrDefault<int>(
                                      widget!.selectedLvl,
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
                            } else {
                              if (functions.workoutSeasonDone(
                                  columnProgressRecord.workoutDone.toList(),
                                  widget!.season!.reference.id,
                                  widget!.workoutCount)) {
                                logFirebaseEvent(
                                    'Ididnthaveenough_navigate_to');

                                context.pushNamed(
                                  SeasonPageWidget.routeName,
                                  queryParameters: {
                                    'season': serializeParam(
                                      widget!.season,
                                      ParamType.Document,
                                    ),
                                    'workoutCount': serializeParam(
                                      widget!.workoutCount,
                                      ParamType.int,
                                    ),
                                    'seasonIndex': serializeParam(
                                      widget!.seasonNumber,
                                      ParamType.int,
                                    ),
                                    'selectedLvl': serializeParam(
                                      valueOrDefault<int>(
                                        widget!.selectedLvl,
                                        1,
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
                              } else {
                                logFirebaseEvent(
                                    'Ididnthaveenough_custom_action');
                                _model.workDoc = await actions.workoutById(
                                  widget!.workoutDone!.workoutId,
                                  columnProgressRecord.workoutDone.toList(),
                                );
                                logFirebaseEvent(
                                    'Ididnthaveenough_navigate_to');

                                context.pushNamed(
                                  WorkoutPageWidget.routeName,
                                  queryParameters: {
                                    'season': serializeParam(
                                      widget!.season,
                                      ParamType.Document,
                                    ),
                                    'workout': serializeParam(
                                      _model.workDoc,
                                      ParamType.Document,
                                    ),
                                    'workoutCount': serializeParam(
                                      widget!.workoutCount,
                                      ParamType.int,
                                    ),
                                    'indexInList': serializeParam(
                                      valueOrDefault<int>(
                                        valueOrDefault<int>(
                                                  _model.workDoc!.index - 1,
                                                  1,
                                                ) <
                                                1
                                            ? 0
                                            : valueOrDefault<int>(
                                                _model.workDoc!.index - 1,
                                                1,
                                              ),
                                        0,
                                      ),
                                      ParamType.int,
                                    ),
                                    'progress': serializeParam(
                                      widget!.progress,
                                      ParamType.DocumentReference,
                                    ),
                                    'seasonIndex': serializeParam(
                                      widget!.seasonNumber,
                                      ParamType.int,
                                    ),
                                    'selectedLvl': serializeParam(
                                      valueOrDefault<int>(
                                        widget!.selectedLvl,
                                        1,
                                      ),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'season': widget!.season,
                                    'workout': _model.workDoc,
                                  },
                                );
                              }
                            }

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'tnhvf7wk' /* I didn't have enough. Let's go... */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                      ]
                          .divide(SizedBox(height: 16.0))
                          .addToStart(SizedBox(height: 32.0)),
                    );
                  },
                ),
              ),
            ),
          ].addToEnd(SizedBox(height: 34.0)),
        ),
      ),
    );
  }
}
