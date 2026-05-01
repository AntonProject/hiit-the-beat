import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/admin/admin_components/admin_workout_dialog/admin_workout_dialog_widget.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_workouts_model.dart';
export 'admin_workouts_model.dart';

class AdminWorkoutsWidget extends StatefulWidget {
  const AdminWorkoutsWidget({
    super.key,
    required this.season,
  });

  final SeasonsRecord? season;

  static String routeName = 'AdminWorkouts';
  static String routePath = '/adminWorkouts';

  @override
  State<AdminWorkoutsWidget> createState() => _AdminWorkoutsWidgetState();
}

class _AdminWorkoutsWidgetState extends State<AdminWorkoutsWidget> {
  late AdminWorkoutsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminWorkoutsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AdminWorkouts'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADMIN_WORKOUTS_AdminWorkouts_ON_INIT_STA');
      logFirebaseEvent('AdminWorkouts_set_dark_mode_settings');
      setDarkModeSetting(context, ThemeMode.dark);
      logFirebaseEvent('AdminWorkouts_custom_action');
      unawaited(
        () async {
          await actions.setStatusBarColor();
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.adminNavBarModel,
              updateCallback: () => safeSetState(() {}),
              child: AdminNavBarWidget(
                pageNum: 2,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 32.0, 40.0, 34.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).middleGray,
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                FFIcons.karrowLeft24,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_WORKOUTS_arrowLeft24_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_to');

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
                              },
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          formatNumber(
                                            widget!.season?.number,
                                            formatType: FormatType.custom,
                                            format: '0. ',
                                            locale: '',
                                          ),
                                          '1. ',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 24.0,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.w500,
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          FFLocalizations.of(context)
                                              .getVariableText(
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
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 24.0,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.w500,
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
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_WORKOUTS_PAGE_Newworkout_ON_TAP');
                                logFirebaseEvent('Newworkout_navigate_to');

                                context.pushNamed(
                                  AdminAddWorkoutWidget.routeName,
                                  queryParameters: {
                                    'season': serializeParam(
                                      widget!.season,
                                      ParamType.Document,
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
                              },
                              text: FFLocalizations.of(context).getText(
                                'yq3mgv9i' /* New workout */,
                              ),
                              options: FFButtonOptions(
                                height: 36.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).alternate,
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
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ].divide(SizedBox(width: 24.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                FFLocalizations.of(context).getVariableText(
                                  enText: FFAppState()
                                      .levels
                                      .where((e) =>
                                          e.number == widget!.season?.level)
                                      .toList()
                                      .firstOrNull
                                      ?.titleEn,
                                  deText: FFAppState()
                                      .levels
                                      .where((e) =>
                                          e.number == widget!.season?.level)
                                      .toList()
                                      .firstOrNull
                                      ?.titleDe,
                                  jaText: FFAppState()
                                      .levels
                                      .where((e) =>
                                          e.number == widget!.season?.level)
                                      .toList()
                                      .firstOrNull
                                      ?.titleJa,
                                ),
                                'Beginner',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).gray,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    decoration: TextDecoration.underline,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            FutureBuilder<int>(
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
                                      width: 14.0,
                                      height: 14.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                int richTextCount = snapshot.data!;

                                return RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          formatNumber(
                                            richTextCount,
                                            formatType: FormatType.custom,
                                            format: '0 ',
                                            locale: '',
                                          ),
                                          '0 ',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray,
                                              fontSize: 12.0,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'f693yg8l' /* Workouts */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray,
                                              fontSize: 12.0,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '2d5gapne' /*  ~  */,
                                        ),
                                        style: GoogleFonts.urbanist(
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12.0,
                                          height: 1.4,
                                        ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: widget!.season?.duration,
                                            deText: widget!.season?.durationDe,
                                            jaText: widget!.season?.durationJa,
                                          ),
                                          '-',
                                        ),
                                        style: GoogleFonts.urbanist(
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12.0,
                                          height: 1.4,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                );
                              },
                            ),
                            FutureBuilder<List<ProgressRecord>>(
                              future: queryProgressRecordOnce(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 14.0,
                                      height: 14.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ProgressRecord>
                                    richTextProgressRecordList = snapshot.data!;

                                return RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          formatNumber(
                                            functions.userSeasonPassed(
                                                richTextProgressRecordList
                                                    .toList(),
                                                widget!.season!.reference.id),
                                            formatType: FormatType.custom,
                                            format: '0 ',
                                            locale: '',
                                          ),
                                          '0 ',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray,
                                              fontSize: 12.0,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'o89bixfq' /* people passed */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray,
                                              fontSize: 12.0,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.normal,
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                );
                              },
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                    Expanded(
                      child: FutureBuilder<List<WorkoutsRecord>>(
                        future: FFAppState().workouts(
                          uniqueQueryKey: valueOrDefault<String>(
                            FFAppState().refreshDate?.toString(),
                            '0',
                          ),
                          requestFn: () => queryWorkoutsRecordOnce(
                            queryBuilder: (workoutsRecord) => workoutsRecord
                                .where(
                                  'season_id',
                                  isEqualTo: widget!.season?.reference.id,
                                )
                                .orderBy('index'),
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
                                  color: FlutterFlowTheme.of(context).green,
                                  size: 20.0,
                                ),
                              ),
                            );
                          }
                          List<WorkoutsRecord> containerWorkoutsRecordList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final work =
                                    containerWorkoutsRecordList.toList();
                                if (work.isEmpty) {
                                  return EmptyListWidget();
                                }

                                return FlutterFlowDataTable<WorkoutsRecord>(
                                  controller:
                                      _model.paginatedDataTableController,
                                  data: work,
                                  columnsBuilder: (onSortChanged) => [
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Container(),
                                      ),
                                      fixedWidth: 300.0,
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Container(),
                                      ),
                                      fixedWidth: 100.0,
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Container(),
                                      ),
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Container(),
                                      ),
                                      fixedWidth: 200.0,
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'wnw7iud9' /*   */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .labelLargeIsCustom,
                                              ),
                                        ),
                                      ),
                                      fixedWidth: 50.0,
                                    ),
                                  ],
                                  dataRowBuilder: (workItem, workIndex,
                                          selected, onSelectChanged) =>
                                      DataRow(
                                    color: MaterialStateProperty.all(
                                      workIndex % 2 == 0
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                    ),
                                    cells: [
                                      Text(
                                        valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            formatNumber(
                                              workIndex + 1,
                                              formatType: FormatType.custom,
                                              format: '0. ',
                                              locale: '',
                                            ),
                                            '1. ',
                                          )}${valueOrDefault<String>(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText: workItem.titleEn,
                                              deText: workItem.titleDe,
                                              jaText: workItem.titleJa,
                                            ),
                                            'Fit Fusion',
                                          )}',
                                          '1. Fit Fusion',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: workItem.duration,
                                            deText: workItem.durationDe,
                                            jaText: workItem.durationJa,
                                          ),
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      FutureBuilder<List<ProgressRecord>>(
                                        future: queryProgressRecordOnce(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 14.0,
                                                height: 14.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Colors.transparent,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ProgressRecord>
                                              richTextProgressRecordList =
                                              snapshot.data!;

                                          return RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    formatNumber(
                                                      functions.userWorkoutPassed(
                                                          richTextProgressRecordList
                                                              .toList(),
                                                          widget!.season!
                                                              .reference.id,
                                                          workItem
                                                              .reference.id),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '0 ',
                                                      locale: '',
                                                    ),
                                                    '0 ',
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.07,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        lineHeight: 1.4,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ox50xj9k' /* people passed */,
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.07,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        lineHeight: 1.4,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                )
                                              ],
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
                                                        .gray,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          );
                                        },
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (workItem.free)
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'blbflywh' /* Free */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                          if (!workItem.free)
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'lic07eyj' /* Paid */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                        ],
                                      ),
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ADMIN_WORKOUTS_Container_8lrj25uj_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_alert_dialog');
                                            showAlignedDialog(
                                              context: context,
                                              isGlobal: false,
                                              avoidOverflow: false,
                                              targetAnchor:
                                                  AlignmentDirectional(
                                                          1.0, -1.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  AlignmentDirectional(
                                                          1.0, -1.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child:
                                                        AdminWorkoutDialogWidget(
                                                      work: workItem,
                                                      season: widget!.season!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 4.0,
                                                  height: 4.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  width: 4.0,
                                                  height: 4.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  width: 4.0,
                                                  height: 4.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].map((c) => DataCell(c)).toList(),
                                  ),
                                  emptyBuilder: () => EmptyListWidget(),
                                  paginated: true,
                                  selectable: false,
                                  hidePaginator: false,
                                  showFirstLastButtons: false,
                                  headingRowHeight: 0.0,
                                  dataRowHeight: 50.0,
                                  columnSpacing: 20.0,
                                  headingRowColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(20.0),
                                  addHorizontalDivider: true,
                                  addTopAndBottomDivider: false,
                                  hideDefaultHorizontalDivider: true,
                                  horizontalDividerColor:
                                      FlutterFlowTheme.of(context).primary,
                                  horizontalDividerThickness: 6.0,
                                  addVerticalDivider: false,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 28.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
