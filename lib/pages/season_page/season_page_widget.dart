import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/becomeplusmember/becomeplusmember_widget.dart';
import '/components/dialogs/onboarding_home_step3/onboarding_home_step3_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/workout_comp/workout_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'season_page_model.dart';
export 'season_page_model.dart';

class SeasonPageWidget extends StatefulWidget {
  const SeasonPageWidget({
    super.key,
    required this.season,
    int? workoutCount,
    int? seasonIndex,
    int? selectedLvl,
  })  : this.workoutCount = workoutCount ?? 0,
        this.seasonIndex = seasonIndex ?? 0,
        this.selectedLvl = selectedLvl ?? 1;

  final SeasonsRecord? season;
  final int workoutCount;
  final int seasonIndex;
  final int selectedLvl;

  static String routeName = 'SeasonPage';
  static String routePath = '/seasonPage';

  @override
  State<SeasonPageWidget> createState() => _SeasonPageWidgetState();
}

class _SeasonPageWidgetState extends State<SeasonPageWidget> {
  late SeasonPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeasonPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SeasonPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEASON_SeasonPage_ON_INIT_STATE');
      logFirebaseEvent('SeasonPage_custom_action');
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      logFirebaseEvent('SeasonPage_custom_action');
      unawaited(
        () async {
          await actions.setStatusBarColor();
        }(),
      );
      if ((FFAppState().onboardingHome == true) &&
          (FFAppState().onboardingStep == 3)) {
        logFirebaseEvent('SeasonPage_bottom_sheet');
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
                child: OnboardingHomeStep3Widget(
                  seasonDoc: widget!.season!,
                  workoutCount: widget!.workoutCount,
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
                    logFirebaseEvent('SEASON_PAGE_PAGE_arrowLeft24_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed(
                      SeasonWorkoutPageWidget.routeName,
                      queryParameters: {
                        'level': serializeParam(
                          valueOrDefault<int>(
                            widget!.selectedLvl,
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
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: StreamBuilder<List<ProgressRecord>>(
                          stream: queryProgressRecord(
                            queryBuilder: (progressRecord) =>
                                progressRecord.where(
                              'user',
                              isEqualTo: currentUserReference,
                            ),
                            singleRecord: true,
                          ),
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
                            List<ProgressRecord> containerProgressRecordList =
                                snapshot.data!;
                            final containerProgressRecord =
                                containerProgressRecordList.isNotEmpty
                                    ? containerProgressRecordList.first
                                    : null;

                            return Container(
                              decoration: BoxDecoration(),
                              child: AuthUserStreamWidget(
                                builder: (context) => FutureBuilder<int>(
                                  future: queryWorkoutsRecordCount(
                                    queryBuilder: (workoutsRecord) =>
                                        workoutsRecord.where(
                                      'season_id',
                                      isEqualTo: widget!.season?.reference.id,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 20.0,
                                          height: 20.0,
                                          child: SpinKitRipple(
                                            color: FlutterFlowTheme.of(context)
                                                .green,
                                            size: 20.0,
                                          ),
                                        ),
                                      );
                                    }
                                    int columnCount = snapshot.data!;

                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: valueOrDefault<
                                                            String>(
                                                          widget!
                                                              .season?.titleEn,
                                                          '-',
                                                        ),
                                                        deText: valueOrDefault<
                                                            String>(
                                                          widget!
                                                              .season?.titleDe,
                                                          '-',
                                                        ),
                                                        jaText: valueOrDefault<
                                                            String>(
                                                          widget!
                                                              .season?.titleJa,
                                                          '-',
                                                        ),
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
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.07,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.4,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Wrap(
                                                  spacing: 8.0,
                                                  runSpacing: 8.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .middleGray,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  FFAppState()
                                                                      .levels
                                                                      .where((e) =>
                                                                          e.number ==
                                                                          widget!
                                                                              .season
                                                                              ?.level)
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.titleEn,
                                                                  'Beginner',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.07,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  lineHeight:
                                                                      1.4,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .middleGray,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .middleGray,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  formatNumber(
                                                                    columnCount,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '0 ',
                                                                    locale: '',
                                                                  ),
                                                                  '1 ',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'mxpx9rzm' /* Workouts */,
                                                                ),
                                                                style: GoogleFonts
                                                                    .urbanist(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      12.0,
                                                                  height: 1.4,
                                                                ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.07,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  lineHeight:
                                                                      1.4,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .middleGray,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .middleGray,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  () {
                                                                    if (containerProgressRecord
                                                                            ?.workoutDone
                                                                            ?.where((e) =>
                                                                                e.seasonId ==
                                                                                widget!
                                                                                    .season?.reference.id)
                                                                            .toList()
                                                                            ?.length ==
                                                                        0) {
                                                                      return valueOrDefault<
                                                                          String>(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              'No activity yet',
                                                                          deText:
                                                                              'Noch keine Aktivität',
                                                                          jaText:
                                                                              'まだ活動はありません',
                                                                        ),
                                                                        'No activity yet',
                                                                      );
                                                                    } else if (functions.workoutSeasonExistOrNotDone(
                                                                            containerProgressRecord?.workoutDone
                                                                                ?.toList(),
                                                                            widget!
                                                                                .season!.reference.id,
                                                                            columnCount) ||
                                                                        functions.workoutSeasonDone(
                                                                            containerProgressRecord?.workoutDone?.toList(),
                                                                            widget!.season!.reference.id,
                                                                            columnCount)) {
                                                                      return valueOrDefault<
                                                                          String>(
                                                                        '${valueOrDefault<String>(
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                            enText:
                                                                                'Last activity ',
                                                                            deText:
                                                                                'Letzte Aktivität ',
                                                                            jaText:
                                                                                '最後のアクティビティ',
                                                                          ),
                                                                          'Last activity ',
                                                                        )}${valueOrDefault<String>(
                                                                          dateTimeFormat(
                                                                            "dd MMMM yyyy",
                                                                            functions.lastActivitySeason(containerProgressRecord?.workoutDone?.toList(),
                                                                                widget!.season!.reference.id),
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          '-',
                                                                        )}',
                                                                        'Last activity undefined',
                                                                      );
                                                                    } else {
                                                                      return valueOrDefault<
                                                                          String>(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              'No activity yet',
                                                                          deText:
                                                                              'Noch keine Aktivität',
                                                                          jaText:
                                                                              'まだ活動はありません',
                                                                        ),
                                                                        'No activity yet',
                                                                      );
                                                                    }
                                                                  }(),
                                                                  'No activity yet',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.07,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  lineHeight:
                                                                      1.4,
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
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .darkGray,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 16.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 24.0,
                                                    height: 24.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .blue,
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      FFIcons.kway16,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '9r70ns32' /* Follow the order we suggest to... */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
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
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: PagedListView<
                                                DocumentSnapshot<Object?>?,
                                                WorkoutsRecord>.separated(
                                              pagingController:
                                                  _model.setListViewController(
                                                WorkoutsRecord.collection
                                                    .where(
                                                      'season_id',
                                                      isEqualTo: widget!
                                                          .season?.reference.id,
                                                    )
                                                    .orderBy('index'),
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                12.0,
                                                0,
                                                24.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              reverse: false,
                                              scrollDirection: Axis.vertical,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 16.0),
                                              builderDelegate:
                                                  PagedChildBuilderDelegate<
                                                      WorkoutsRecord>(
                                                // Customize what your widget looks like when it's loading the first page.
                                                firstPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 20.0,
                                                    height: 20.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .green,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                                // Customize what your widget looks like when it's loading another page.
                                                newPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 20.0,
                                                    height: 20.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .green,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                                noItemsFoundIndicatorBuilder:
                                                    (_) => Center(
                                                  child: EmptyListWidget(),
                                                ),
                                                itemBuilder: (context, _,
                                                    listViewIndex) {
                                                  final listViewWorkoutsRecord =
                                                      _model.listViewPagingController!
                                                              .itemList![
                                                          listViewIndex];
                                                  return wrapWithModel(
                                                    model: _model
                                                        .workoutCompModels
                                                        .getModel(
                                                      listViewWorkoutsRecord
                                                          .reference.id,
                                                      listViewIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child: WorkoutCompWidget(
                                                      key: Key(
                                                        'Keygdu_${listViewWorkoutsRecord.reference.id}',
                                                      ),
                                                      workout:
                                                          listViewWorkoutsRecord,
                                                      season: widget!.season!,
                                                      workoutCount:
                                                          valueOrDefault<int>(
                                                        columnCount,
                                                        0,
                                                      ),
                                                      progress:
                                                          containerProgressRecord!,
                                                      indexWork:
                                                          valueOrDefault<int>(
                                                        listViewIndex,
                                                        0,
                                                      ),
                                                      seasonIndex:
                                                          valueOrDefault<int>(
                                                        widget!.seasonIndex,
                                                        0,
                                                      ),
                                                      selectedLvl:
                                                          valueOrDefault<int>(
                                                        widget!.selectedLvl,
                                                        1,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 16.0))
                                            .addToStart(SizedBox(height: 8.0))
                                            .addToEnd(SizedBox(
                                                height: !valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.plusmember,
                                                        false)
                                                    ? 200.0
                                                    : 34.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      if (!valueOrDefault<bool>(
                          currentUserDocument?.plusmember, false))
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 34.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: double.infinity,
                                height: 160.0,
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: !valueOrDefault<bool>(
                                    FFAppState().onboardingHome,
                                    false,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: wrapWithModel(
                                      model: _model.becomeplusmemberModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BecomeplusmemberWidget(),
                                    ),
                                  ),
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
