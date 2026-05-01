import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/level_success_dialog/level_success_dialog_widget.dart';
import '/components/dialogs/onboarding_home_step4/onboarding_home_step4_widget.dart';
import '/components/dialogs/select_warm_up_cool_down_dialog/select_warm_up_cool_down_dialog_widget.dart';
import '/components/dialogs/workout_success3times_dialog/workout_success3times_dialog_widget.dart';
import '/components/dialogs/workout_success_dialog/workout_success_dialog_widget.dart';
import '/components/skeleton/skeleton_workout/skeleton_workout_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workout_page_model.dart';
export 'workout_page_model.dart';

class WorkoutPageWidget extends StatefulWidget {
  const WorkoutPageWidget({
    super.key,
    required this.season,
    required this.workout,
    int? workoutCount,
    int? indexInList,
    required this.progress,
    int? seasonIndex,
  })  : this.workoutCount = workoutCount ?? 0,
        this.indexInList = indexInList ?? 0,
        this.seasonIndex = seasonIndex ?? 0;

  final SeasonsRecord? season;
  final WorkoutsRecord? workout;
  final int workoutCount;
  final int indexInList;
  final DocumentReference? progress;
  final int seasonIndex;

  static String routeName = 'WorkoutPage';
  static String routePath = '/workoutPage';

  @override
  State<WorkoutPageWidget> createState() => _WorkoutPageWidgetState();
}

class _WorkoutPageWidgetState extends State<WorkoutPageWidget> {
  late WorkoutPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'WorkoutPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('WORKOUT_WorkoutPage_ON_INIT_STATE');
      logFirebaseEvent('WorkoutPage_custom_action');
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      logFirebaseEvent('WorkoutPage_custom_action');
      unawaited(
        () async {
          await actions.setStatusBarColor();
        }(),
      );
      if (FFAppState().onboardingHome) {
        logFirebaseEvent('WorkoutPage_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.transparent,
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
                child: OnboardingHomeStep4Widget(
                  season: widget!.season!,
                  workout: widget!.workout!,
                  workoutCount: widget!.workoutCount,
                  progress: widget!.progress!,
                  workIndex: widget!.indexInList,
                  seasonIndex: widget!.seasonIndex,
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
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
    context.watch<FFAppState>();

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
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowIconButton(
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
                        'WORKOUT_PAGE_PAGE_arrowLeft24_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_to');

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
                          widget!.seasonIndex,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'season': widget!.season,
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: StreamBuilder<ProgressRecord>(
                  stream: ProgressRecord.getDocument(widget!.progress!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return SkeletonWorkoutWidget();
                    }

                    final columnProgressRecord = snapshot.data!;

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'hfc9tug4' /* Workout */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 24.0,
                                                letterSpacing: 0.07,
                                                fontWeight: FontWeight.bold,
                                                lineHeight: 1.4,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            formatNumber(
                                              widget!.indexInList + 1,
                                              formatType: FormatType.custom,
                                              format: ' 0',
                                              locale: '',
                                            ),
                                            ' 1',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 24.0,
                                                letterSpacing: 0.07,
                                                fontWeight: FontWeight.bold,
                                                lineHeight: 1.4,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 28.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        (columnProgressRecord.workoutDone
                                                        .where((e) =>
                                                            e.workoutId ==
                                                            widget!.workout
                                                                ?.reference.id)
                                                        .toList()
                                                        .length >=
                                                    1) &&
                                                (columnProgressRecord
                                                        .workoutDone.length >
                                                    0)
                                            ? FlutterFlowTheme.of(context)
                                                .secondary
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          (columnProgressRecord.workoutDone
                                                          .where((e) =>
                                                              e.workoutId ==
                                                              widget!
                                                                  .workout
                                                                  ?.reference
                                                                  .id)
                                                          .toList()
                                                          .length >=
                                                      1) &&
                                                  (columnProgressRecord
                                                          .workoutDone.length >
                                                      0)
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                    ),
                                    child: Visibility(
                                      visible: (columnProgressRecord.workoutDone
                                                  .where((e) =>
                                                      e.workoutId ==
                                                      widget!.workout?.reference
                                                          .id)
                                                  .toList()
                                                  .length >=
                                              1) &&
                                          (columnProgressRecord
                                                  .workoutDone.length >
                                              0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kcheckmark24,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 28.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        (columnProgressRecord.workoutDone
                                                        .where((e) =>
                                                            e.workoutId ==
                                                            widget!.workout
                                                                ?.reference.id)
                                                        .toList()
                                                        .length >=
                                                    2) &&
                                                (columnProgressRecord
                                                        .workoutDone.length >
                                                    0)
                                            ? FlutterFlowTheme.of(context)
                                                .secondary
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          (columnProgressRecord.workoutDone
                                                          .where((e) =>
                                                              e.workoutId ==
                                                              widget!
                                                                  .workout
                                                                  ?.reference
                                                                  .id)
                                                          .toList()
                                                          .length >=
                                                      2) &&
                                                  (columnProgressRecord
                                                          .workoutDone.length >
                                                      0)
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                    ),
                                    child: Visibility(
                                      visible: (columnProgressRecord.workoutDone
                                                  .where((e) =>
                                                      e.workoutId ==
                                                      widget!.workout?.reference
                                                          .id)
                                                  .toList()
                                                  .length >=
                                              2) &&
                                          (columnProgressRecord
                                                  .workoutDone.length >
                                              0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kcheckmark24,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 28.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        (columnProgressRecord.workoutDone
                                                        .where((e) =>
                                                            e.workoutId ==
                                                            widget!.workout
                                                                ?.reference.id)
                                                        .toList()
                                                        .length >=
                                                    3) &&
                                                (columnProgressRecord
                                                        .workoutDone.length >
                                                    0)
                                            ? FlutterFlowTheme.of(context)
                                                .secondary
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          (columnProgressRecord.workoutDone
                                                          .where((e) =>
                                                              e.workoutId ==
                                                              widget!
                                                                  .workout
                                                                  ?.reference
                                                                  .id)
                                                          .toList()
                                                          .length >=
                                                      3) &&
                                                  (columnProgressRecord
                                                          .workoutDone.length >
                                                      0)
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                    ),
                                    child: Visibility(
                                      visible: (columnProgressRecord.workoutDone
                                                  .where((e) =>
                                                      e.workoutId ==
                                                      widget!.workout?.reference
                                                          .id)
                                                  .toList()
                                                  .length >=
                                              3) &&
                                          (columnProgressRecord
                                                  .workoutDone.length >
                                              0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kcheckmark24,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .middleGray,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  FFAppState()
                                                      .levels
                                                      .where((e) =>
                                                          e.number ==
                                                          widget!.season?.level)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.titleEn,
                                                  'Beginner',
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
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.07,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.4,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .middleGray,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText:
                                                        valueOrDefault<String>(
                                                      widget!.season?.titleEn,
                                                      '-',
                                                    ),
                                                    deText:
                                                        valueOrDefault<String>(
                                                      widget!.season?.titleDe,
                                                      '-',
                                                    ),
                                                    jaText:
                                                        valueOrDefault<String>(
                                                      widget!.season?.titleJa,
                                                      '-',
                                                    ),
                                                  ),
                                                  '-',
                                                ),
                                                style: GoogleFonts.urbanist(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0,
                                                  height: 1.4,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.07,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.4,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .middleGray,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .middleGray,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  () {
                                                    if ((columnProgressRecord
                                                                .workoutDone
                                                                .where((e) =>
                                                                    e.workoutId ==
                                                                    widget!
                                                                        .workout
                                                                        ?.reference
                                                                        .id)
                                                                .toList()
                                                                .length ==
                                                            0) ||
                                                        (columnProgressRecord.workoutDone.length ==
                                                            0)) {
                                                      return valueOrDefault<
                                                          String>(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText:
                                                              'No activity yet',
                                                          deText:
                                                              'Noch keine Aktivität',
                                                          jaText: 'まだ活動はありません',
                                                        ),
                                                        'No activity yet',
                                                      );
                                                    } else if (functions.workoutSeasonExistOrNotDone(
                                                            columnProgressRecord
                                                                .workoutDone
                                                                .toList(),
                                                            widget!.season!
                                                                .reference.id,
                                                            widget!
                                                                .workoutCount) ||
                                                        functions.workoutSeasonDone(
                                                            columnProgressRecord
                                                                .workoutDone
                                                                .toList(),
                                                            widget!.season!.reference.id,
                                                            widget!.workoutCount)) {
                                                      return valueOrDefault<
                                                          String>(
                                                        '${valueOrDefault<String>(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                            enText:
                                                                'Last completion ',
                                                            deText:
                                                                'Letzte Fertigstellung',
                                                            jaText: '最後の完了 ',
                                                          ),
                                                          'Last completion',
                                                        )}${valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "dd MMMM yyyy",
                                                            functions.lastActivityWorkout(
                                                                columnProgressRecord
                                                                    .workoutDone
                                                                    .toList(),
                                                                widget!
                                                                    .workout!
                                                                    .reference
                                                                    .id),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          'undefined',
                                                        )}',
                                                        'Last completion undefined',
                                                      );
                                                    } else {
                                                      return valueOrDefault<
                                                          String>(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText:
                                                              'No activity yet',
                                                          deText:
                                                              'Noch keine Aktivität',
                                                          jaText: 'まだ活動はありません',
                                                        ),
                                                        'No activity yet',
                                                      );
                                                    }
                                                  }(),
                                                  'No activity yet',
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
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.07,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.4,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (((columnProgressRecord.workoutDone
                                          .where((e) =>
                                              e.workoutId ==
                                              widget!.workout?.reference.id)
                                          .toList()
                                          .length >
                                      0) &&
                                  (columnProgressRecord.workoutDone
                                          .where((e) =>
                                              e.workoutId ==
                                              widget!.workout?.reference.id)
                                          .toList()
                                          .length <
                                      3)) &&
                              (functions.durationBetween2dates(
                                      functions.lastActivityWorkout(
                                          columnProgressRecord.workoutDone
                                              .toList(),
                                          widget!.workout!.reference.id),
                                      getCurrentTimestamp) <=
                                  1))
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).darkGray,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).darkGray,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).red,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).red,
                                        ),
                                      ),
                                      child: Icon(
                                        FFIcons.kinfo16,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'ogo05fgc' /* We recommend to have at least ... */,
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
                                                        lineHeight: 1.4,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                dateTimeFormat(
                                                  "dd MMMM",
                                                  functions.dayPlusInt(
                                                      functions
                                                          .lastActivityWorkout(
                                                              columnProgressRecord
                                                                  .workoutDone
                                                                  .toList(),
                                                              widget!
                                                                  .workout!
                                                                  .reference
                                                                  .id),
                                                      2),
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                '-',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .pink,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).darkGray,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 24.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).blue,
                                      borderRadius: BorderRadius.circular(6.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).blue,
                                      ),
                                    ),
                                    child: Icon(
                                      FFIcons.kway16,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 16.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'xqkxpz10' /* Follow the order we suggest to... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.07,
                                            fontWeight: FontWeight.normal,
                                            lineHeight: 1.4,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                          if (((columnProgressRecord.workoutDone
                                          .where((e) =>
                                              e.workoutId ==
                                              widget!.workout?.reference.id)
                                          .toList()
                                          .length >
                                      0) &&
                                  (columnProgressRecord.workoutDone
                                          .where((e) =>
                                              e.workoutId ==
                                              widget!.workout?.reference.id)
                                          .toList()
                                          .length <
                                      3)) &&
                              (functions.durationBetween2dates(
                                      functions.lastActivityWorkout(
                                          columnProgressRecord.workoutDone
                                              .toList(),
                                          widget!.workout!.reference.id),
                                      getCurrentTimestamp) >
                                  2))
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).darkGray,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .darkGreen,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .darkGreen,
                                        ),
                                      ),
                                      child: Icon(
                                        FFIcons.khi16,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 16.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ttmquoe5' /* Late to the party?  We’re stil... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'WORKOUT_PAGE_PAGE_Warmup_ON_TAP');
                              if (!(_model.trainingsDone.contains(1) &&
                                  _model.trainingsDone.contains(2) &&
                                  _model.trainingsDone.contains(3))) {
                                logFirebaseEvent('Warmup_update_page_state');
                                _model.trainingChoose = 1;
                                safeSetState(() {});
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 44.0,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              _model.trainingChoose == 1
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .middleGray,
                                              FlutterFlowTheme.of(context)
                                                  .middleGray,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                _model.trainingChoose == 1
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .alternate
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .middleGray,
                                                FlutterFlowTheme.of(context)
                                                    .middleGray,
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'p53fx38i' /* 1 */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.trainingChoose == 1
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                    ),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'hyj8qyc2' /* Warm Up */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.07,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.4,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (_model.trainingsDone
                                                      .contains(
                                                          valueOrDefault<int>(
                                                    1,
                                                    1,
                                                  ))) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'q9ykafwt' /* Done */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.07,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              lineHeight: 1.4,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
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
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'd4zh2xau' /* Select one of ours or do you o... */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.07,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              lineHeight: 1.4,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                    FFButtonWidget(
                                      onPressed: (_model.trainingChoose != 1)
                                          ? null
                                          : () async {
                                              logFirebaseEvent(
                                                  'WORKOUT_PAGE_PAGE_Selectoneofours_ON_TAP');
                                              logFirebaseEvent(
                                                  'Selectoneofours_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'Selectoneofours_bottom_sheet');
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
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          SelectWarmUpCoolDownDialogWidget(
                                                        type: 1,
                                                        workout:
                                                            widget!.workout!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                      text: FFLocalizations.of(context).getText(
                                        'ao6mwsco' /* Select one of ours */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: valueOrDefault<Color>(
                                                _model.trainingChoose == 1
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .gray,
                                                FlutterFlowTheme.of(context)
                                                    .gray,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.07,
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: valueOrDefault<Color>(
                                            _model.trainingChoose == 1
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .gray,
                                            FlutterFlowTheme.of(context).gray,
                                          ),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: (_model.trainingChoose != 1)
                                          ? null
                                          : () async {
                                              logFirebaseEvent(
                                                  'WORKOUT_PAGE_PAGE_Ididit_ON_TAP');
                                              logFirebaseEvent(
                                                  'Ididit_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              if (!_model.trainingsDone
                                                  .contains(1)) {
                                                logFirebaseEvent(
                                                    'Ididit_update_page_state');
                                                _model.addToTrainingsDone(1);
                                                safeSetState(() {});
                                              }
                                              logFirebaseEvent(
                                                  'Ididit_update_page_state');
                                              _model.trainingChoose = 2;
                                              safeSetState(() {});
                                            },
                                      text: FFLocalizations.of(context).getText(
                                        'rfuq6jtu' /* Done */,
                                      ),
                                      icon: Icon(
                                        FFIcons.kcheckmark24,
                                        size: 24.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.trainingChoose == 1
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .middleGray,
                                          FlutterFlowTheme.of(context)
                                              .middleGray,
                                        ),
                                        textStyle: FlutterFlowTheme.of(context)
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
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: valueOrDefault<Color>(
                                            _model.trainingChoose == 1
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .middleGray,
                                            FlutterFlowTheme.of(context)
                                                .middleGray,
                                          ),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'WORKOUT_PAGE_PAGE_Warmup_ON_TAP');
                              if (_model.trainingsDone.contains(1) &&
                                  (_model.trainingsDone.length < 3)) {
                                logFirebaseEvent('Warmup_update_page_state');
                                _model.trainingChoose = 2;
                                safeSetState(() {});
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 44.0,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              _model.trainingChoose == 2
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .middleGray,
                                              FlutterFlowTheme.of(context)
                                                  .middleGray,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                _model.trainingChoose == 2
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .alternate
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .middleGray,
                                                FlutterFlowTheme.of(context)
                                                    .middleGray,
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dqu8vcqt' /* 2 */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.trainingChoose == 2
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                    ),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '3woy2uip' /* Workout */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.07,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.4,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (_model.trainingsDone
                                                      .contains(
                                                          valueOrDefault<int>(
                                                    2,
                                                    2,
                                                  ))) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'kop4kqqr' /* Done */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.07,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              lineHeight: 1.4,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
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
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ki4vgbte' /* Tap on the video to start */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.07,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              lineHeight: 1.4,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'WORKOUT_Container_31lhq6kw_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_haptic_feedback');
                                        HapticFeedback.mediumImpact();
                                        if (currentUserEmail != null &&
                                            currentUserEmail != '') {
                                          if (_model.trainingsDone
                                              .contains(1)) {
                                            logFirebaseEvent(
                                                'Container_update_page_state');
                                            _model.trainingChoose = 2;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Container_navigate_to');
                                            unawaited(
                                              () async {
                                                context.pushNamed(
                                                  VideoPageWidget.routeName,
                                                  queryParameters: {
                                                    'videoEn': serializeParam(
                                                      widget!
                                                          .workout?.videoUrlEn,
                                                      ParamType.String,
                                                    ),
                                                    'videoDe': serializeParam(
                                                      widget!
                                                          .workout?.videoUrlDe,
                                                      ParamType.String,
                                                    ),
                                                    'videoJa': serializeParam(
                                                      widget!
                                                          .workout?.videoUrlJa,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }(),
                                            );
                                            return;
                                          } else {
                                            return;
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
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
                                                  child: GuestDialogWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          return;
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.25,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                              valueOrDefault<String>(
                                                widget!.workout?.cover,
                                                'https://firebasestorage.googleapis.com/v0/b/breakletics-9245d.appspot.com/o/image2_3x.webp?alt=media&token=f8d93e5d-90ee-476f-b7b1-388519177fe7',
                                              ),
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.transparent,
                                                  FlutterFlowTheme.of(context)
                                                      .primary
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      FFIcons.kplay24,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                            enText: widget!
                                                                .workout
                                                                ?.titleEn,
                                                            deText: widget!
                                                                .workout
                                                                ?.titleDe,
                                                            jaText: widget!
                                                                .workout
                                                                ?.titleJa,
                                                          ),
                                                          'Fit Fusion',
                                                        ),
                                                        maxLines: 2,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 24.0,
                                                              letterSpacing:
                                                                  0.07,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              lineHeight: 1.4,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: widget!
                                                            .workout?.duration,
                                                        deText: widget!.workout
                                                            ?.durationDe,
                                                        jaText: widget!.workout
                                                            ?.durationJa,
                                                      ),
                                                      '-',
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.07,
                                                          lineHeight: 1.4,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: (_model.trainingChoose != 2)
                                          ? null
                                          : () async {
                                              logFirebaseEvent(
                                                  'WORKOUT_PAGE_PAGE_Ididit_ON_TAP');
                                              logFirebaseEvent(
                                                  'Ididit_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              if (!_model.trainingsDone
                                                  .contains(2)) {
                                                logFirebaseEvent(
                                                    'Ididit_update_page_state');
                                                _model.addToTrainingsDone(2);
                                                safeSetState(() {});
                                              }
                                              logFirebaseEvent(
                                                  'Ididit_update_page_state');
                                              _model.trainingChoose = 3;
                                              safeSetState(() {});
                                            },
                                      text: FFLocalizations.of(context).getText(
                                        'bd3xpxi8' /* Done */,
                                      ),
                                      icon: Icon(
                                        FFIcons.kcheckmark24,
                                        size: 24.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.trainingChoose == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .middleGray,
                                          FlutterFlowTheme.of(context)
                                              .middleGray,
                                        ),
                                        textStyle: FlutterFlowTheme.of(context)
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
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: valueOrDefault<Color>(
                                            _model.trainingChoose == 2
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .middleGray,
                                            FlutterFlowTheme.of(context)
                                                .middleGray,
                                          ),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'WORKOUT_PAGE_PAGE_Cooldown_ON_TAP');
                              if (_model.trainingsDone.contains(2) &&
                                  (_model.trainingsDone.length < 3)) {
                                logFirebaseEvent('Cooldown_update_page_state');
                                _model.trainingChoose = 3;
                                safeSetState(() {});
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 44.0,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              _model.trainingChoose == 3
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .middleGray,
                                              FlutterFlowTheme.of(context)
                                                  .middleGray,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                _model.trainingChoose == 3
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .alternate
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .middleGray,
                                                FlutterFlowTheme.of(context)
                                                    .middleGray,
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dxsm9yqn' /* 3 */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.trainingChoose == 3
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                    ),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5rwsp51x' /* Cool Down */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.07,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.4,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (_model.trainingsDone
                                                      .contains(
                                                          valueOrDefault<int>(
                                                    3,
                                                    3,
                                                  ))) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'lr3dsez4' /* Done */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.07,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              lineHeight: 1.4,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
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
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'qqc0qxqz' /* Select one of ours or do you o... */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.07,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              lineHeight: 1.4,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                    FFButtonWidget(
                                      onPressed: (_model.trainingChoose != 3)
                                          ? null
                                          : () async {
                                              logFirebaseEvent(
                                                  'WORKOUT_PAGE_PAGE_Selectoneofours_ON_TAP');
                                              logFirebaseEvent(
                                                  'Selectoneofours_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'Selectoneofours_bottom_sheet');
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
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          SelectWarmUpCoolDownDialogWidget(
                                                        type: 2,
                                                        workout:
                                                            widget!.workout!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                      text: FFLocalizations.of(context).getText(
                                        'kr5agtv7' /* Select one of ours */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: valueOrDefault<Color>(
                                                _model.trainingChoose == 3
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .gray,
                                                FlutterFlowTheme.of(context)
                                                    .gray,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.07,
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: valueOrDefault<Color>(
                                            _model.trainingChoose == 3
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .gray,
                                            FlutterFlowTheme.of(context).gray,
                                          ),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: (_model.trainingChoose != 3)
                                          ? null
                                          : () async {
                                              logFirebaseEvent(
                                                  'WORKOUT_PAGE_PAGE_Ididit_ON_TAP');
                                              logFirebaseEvent(
                                                  'Ididit_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              if (!_model.trainingsDone
                                                  .contains(3)) {
                                                logFirebaseEvent(
                                                    'Ididit_update_page_state');
                                                _model.addToTrainingsDone(3);
                                                safeSetState(() {});
                                              }
                                              logFirebaseEvent(
                                                  'Ididit_update_page_state');
                                              _model.trainingChoose = 0;
                                              safeSetState(() {});
                                            },
                                      text: FFLocalizations.of(context).getText(
                                        'l4j7009c' /* Done */,
                                      ),
                                      icon: Icon(
                                        FFIcons.kcheckmark24,
                                        size: 24.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.trainingChoose == 3
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .middleGray,
                                          FlutterFlowTheme.of(context)
                                              .middleGray,
                                        ),
                                        textStyle: FlutterFlowTheme.of(context)
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
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: valueOrDefault<Color>(
                                            _model.trainingChoose == 3
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .middleGray,
                                            FlutterFlowTheme.of(context)
                                                .middleGray,
                                          ),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: (_model.trainingsDone.length < 3)
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'WORKOUT_PAGE_PAGE_Ididit_ON_TAP');
                                    logFirebaseEvent('Ididit_haptic_feedback');
                                    HapticFeedback.selectionClick();
                                    logFirebaseEvent('Ididit_backend_call');
                                    unawaited(
                                      () async {
                                        await columnProgressRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'workout_done':
                                                  FieldValue.arrayUnion([
                                                getWorkoutStatisticFirestoreData(
                                                  updateWorkoutStatisticStruct(
                                                    WorkoutStatisticStruct(
                                                      seasonId: widget!
                                                          .season?.reference.id,
                                                      level:
                                                          valueOrDefault<int>(
                                                        widget!.season?.level,
                                                        1,
                                                      ),
                                                      datetime:
                                                          getCurrentTimestamp,
                                                      warpmupPoints:
                                                          valueOrDefault<int>(
                                                        FFAppState()
                                                            .warmupPoints,
                                                        2,
                                                      ),
                                                      cooldownPoints:
                                                          valueOrDefault<int>(
                                                        FFAppState()
                                                            .cooldownPoints,
                                                        2,
                                                      ),
                                                      workoutPoints:
                                                          valueOrDefault<int>(
                                                        widget!.workout?.points,
                                                        0,
                                                      ),
                                                      workoutId: widget!.workout
                                                          ?.reference.id,
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
                                    logFirebaseEvent(
                                        'Ididit_update_page_state');
                                    _model.trainingsDone = [];
                                    _model.trainingChoose = 0;
                                    safeSetState(() {});
                                    if (columnProgressRecord.workoutDone
                                            .where((e) =>
                                                e.workoutId ==
                                                widget!.workout?.reference.id)
                                            .toList()
                                            .length ==
                                        2) {
                                      logFirebaseEvent('Ididit_bottom_sheet');
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
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  WorkoutSuccess3timesDialogWidget(
                                                workoutDone:
                                                    WorkoutStatisticStruct(
                                                  seasonId: widget!
                                                      .season?.reference.id,
                                                  level: valueOrDefault<int>(
                                                    widget!.season?.level,
                                                    1,
                                                  ),
                                                  datetime: getCurrentTimestamp,
                                                  warpmupPoints:
                                                      valueOrDefault<int>(
                                                    FFAppState().warmupPoints,
                                                    2,
                                                  ),
                                                  cooldownPoints:
                                                      valueOrDefault<int>(
                                                    FFAppState().cooldownPoints,
                                                    2,
                                                  ),
                                                  workoutPoints:
                                                      valueOrDefault<int>(
                                                    widget!.workout?.points,
                                                    0,
                                                  ),
                                                  workoutId: widget!
                                                      .workout?.reference.id,
                                                ),
                                                workoutCount:
                                                    valueOrDefault<int>(
                                                  widget!.workoutCount,
                                                  0,
                                                ),
                                                season: widget!.season!,
                                                progress: widget!.progress!,
                                                seasonNumber:
                                                    widget!.seasonIndex,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    } else {
                                      logFirebaseEvent('Ididit_bottom_sheet');
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
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: WorkoutSuccessDialogWidget(
                                                workoutDone:
                                                    WorkoutStatisticStruct(
                                                  seasonId: widget!
                                                      .season?.reference.id,
                                                  level: valueOrDefault<int>(
                                                    widget!.season?.level,
                                                    1,
                                                  ),
                                                  datetime: getCurrentTimestamp,
                                                  warpmupPoints:
                                                      valueOrDefault<int>(
                                                    FFAppState().warmupPoints,
                                                    2,
                                                  ),
                                                  cooldownPoints:
                                                      valueOrDefault<int>(
                                                    FFAppState().cooldownPoints,
                                                    2,
                                                  ),
                                                  workoutPoints:
                                                      valueOrDefault<int>(
                                                    widget!.workout?.points,
                                                    0,
                                                  ),
                                                  workoutId: widget!
                                                      .workout?.reference.id,
                                                ),
                                                progress: columnProgressRecord
                                                    .reference,
                                                season: widget!.season!,
                                                wockoutCount:
                                                    valueOrDefault<int>(
                                                  widget!.workoutCount,
                                                  0,
                                                ),
                                                seasonNumber:
                                                    widget!.seasonIndex,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }

                                    logFirebaseEvent('Ididit_update_app_state');
                                    FFAppState().warmupPoints = 2;
                                    FFAppState().cooldownPoints = 2;
                                    safeSetState(() {});
                                    if (currentUserEmail != null &&
                                        currentUserEmail != '') {
                                      if (functions.newLevelAchieved(
                                          columnProgressRecord.workoutDone
                                              .toList(),
                                          WorkoutStatisticStruct(
                                            seasonId:
                                                widget!.season?.reference.id,
                                            level: valueOrDefault<int>(
                                              widget!.season?.level,
                                              1,
                                            ),
                                            datetime: getCurrentTimestamp,
                                            warpmupPoints: valueOrDefault<int>(
                                              FFAppState().warmupPoints,
                                              2,
                                            ),
                                            cooldownPoints: valueOrDefault<int>(
                                              FFAppState().cooldownPoints,
                                              2,
                                            ),
                                            workoutPoints: valueOrDefault<int>(
                                              widget!.workout?.points,
                                              0,
                                            ),
                                            workoutId:
                                                widget!.workout?.reference.id,
                                          ),
                                          functions.levels().toList())) {
                                        logFirebaseEvent('Ididit_bottom_sheet');
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
                                                child:
                                                    LevelSuccessDialogWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    } else {
                                      logFirebaseEvent('Ididit_bottom_sheet');
                                      unawaited(
                                        () async {}(),
                                      );
                                    }
                                  },
                            text: FFLocalizations.of(context).getText(
                              'pf7q4dog' /* Finish workout */,
                            ),
                            icon: Icon(
                              FFIcons.kflag24,
                              size: 24.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                _model.trainingsDone.length < 3
                                    ? FlutterFlowTheme.of(context).middleGray
                                    : FlutterFlowTheme.of(context).secondary,
                                FlutterFlowTheme.of(context).middleGray,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.07,
                                    lineHeight: 1.4,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: valueOrDefault<Color>(
                                  _model.trainingsDone.length < 3
                                      ? FlutterFlowTheme.of(context).middleGray
                                      : FlutterFlowTheme.of(context).secondary,
                                  FlutterFlowTheme.of(context).middleGray,
                                ),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 12.0))
                            .addToStart(SizedBox(height: 8.0))
                            .addToEnd(SizedBox(height: 34.0)),
                      ),
                    );
                  },
                ),
              ),
            ].divide(SizedBox(height: 16.0)).addToStart(SizedBox(height: 48.0)),
          ),
        ),
      ),
    );
  }
}
