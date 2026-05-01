import '/admin/admin_components/admin_nav_bar/admin_nav_bar_widget.dart';
import '/admin/admin_components/admin_seasons_dialog/admin_seasons_dialog_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
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
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_seasons_model.dart';
export 'admin_seasons_model.dart';

class AdminSeasonsWidget extends StatefulWidget {
  const AdminSeasonsWidget({super.key});

  static String routeName = 'AdminSeasons';
  static String routePath = '/adminSeasons';

  @override
  State<AdminSeasonsWidget> createState() => _AdminSeasonsWidgetState();
}

class _AdminSeasonsWidgetState extends State<AdminSeasonsWidget> {
  late AdminSeasonsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminSeasonsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AdminSeasons'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADMIN_SEASONS_AdminSeasons_ON_INIT_STATE');
      logFirebaseEvent('AdminSeasons_set_dark_mode_settings');
      setDarkModeSetting(context, ThemeMode.dark);
      logFirebaseEvent('AdminSeasons_custom_action');
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'oig7j28e' /* Seasons & workouts */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ADMIN_SEASONS_PAGE_Newseason_ON_TAP');
                            logFirebaseEvent('Newseason_navigate_to');

                            context.pushNamed(
                              AdminAddSeasonWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            'qux2atbf' /* New season */,
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                  letterSpacing: 0.07,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.4,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
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
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final levels = FFAppState().levels.toList();

                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(levels.length, (levelsIndex) {
                              final levelsItem = levels[levelsIndex];
                              return FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADMIN_SEASONS_PAGE_Beginner_ON_TAP');
                                  logFirebaseEvent('Beginner_haptic_feedback');
                                  HapticFeedback.selectionClick();
                                  logFirebaseEvent(
                                      'Beginner_update_page_state');
                                  _model.tab = levelsItem.number;
                                  safeSetState(() {});
                                },
                                text: valueOrDefault<String>(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: levelsItem.titleEn,
                                    deText: levelsItem.titleDe,
                                    jaText: levelsItem.titleJa,
                                  ),
                                  'Beginner',
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    _model.tab ==
                                            valueOrDefault<int>(
                                              levelsItem.number,
                                              1,
                                            )
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: valueOrDefault<Color>(
                                          _model.tab ==
                                                  valueOrDefault<int>(
                                                    levelsItem.number,
                                                    1,
                                                  )
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          FlutterFlowTheme.of(context).primary,
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
                                      _model.tab ==
                                              valueOrDefault<int>(
                                                levelsItem.number,
                                                1,
                                              )
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .middleGray,
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                showLoadingIndicator: false,
                              );
                            })
                                    .divide(SizedBox(width: 8.0))
                                    .addToEnd(SizedBox(width: 16.0)),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<SeasonsRecord>>(
                        future: FFAppState().seasons(
                          uniqueQueryKey: valueOrDefault<String>(
                            FFAppState().refreshDate?.toString(),
                            '0',
                          ),
                          requestFn: () => querySeasonsRecordOnce(
                            queryBuilder: (seasonsRecord) =>
                                seasonsRecord.orderBy('number'),
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
                          List<SeasonsRecord> containerSeasonsRecordList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final seasons = containerSeasonsRecordList
                                    .where((e) => e.level == _model.tab)
                                    .toList();
                                if (seasons.isEmpty) {
                                  return EmptyListWidget();
                                }

                                return FlutterFlowDataTable<SeasonsRecord>(
                                  controller:
                                      _model.paginatedDataTableController,
                                  data: seasons,
                                  columnsBuilder: (onSortChanged) => [
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
                                      fixedWidth: 100.0,
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Container(),
                                      ),
                                      fixedWidth: 150.0,
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
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'svfbnltw' /*   */,
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
                                  dataRowBuilder: (seasonsItem, seasonsIndex,
                                          selected, onSelectChanged) =>
                                      DataRow(
                                    color: MaterialStateProperty.all(
                                      seasonsIndex % 2 == 0
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                    ),
                                    cells: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ADMIN_SEASONS_RichText_wlare30f_ON_TAP');
                                            logFirebaseEvent(
                                                'RichText_navigate_to');

                                            context.pushNamed(
                                              AdminWorkoutsWidget.routeName,
                                              queryParameters: {
                                                'season': serializeParam(
                                                  seasonsItem,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'season': seasonsItem,
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    formatNumber(
                                                      seasonsItem.number,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '0. ',
                                                      locale: '',
                                                    ),
                                                    '1. ',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.07,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            lineHeight: 1.4,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: valueOrDefault<
                                                          String>(
                                                        seasonsItem.titleEn,
                                                        '-',
                                                      ),
                                                      deText: valueOrDefault<
                                                          String>(
                                                        seasonsItem.titleDe,
                                                        '-',
                                                      ),
                                                      jaText: valueOrDefault<
                                                          String>(
                                                        seasonsItem.titleJa,
                                                        '-',
                                                      ),
                                                    ),
                                                    '-',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.07,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            lineHeight: 1.4,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
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
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ADMIN_SEASONS_Container_1or0es6w_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                    AdminWorkoutsWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'season': serializeParam(
                                                        seasonsItem,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'season': seasonsItem,
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .middleGray,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (seasonsItem.en &&
                                                          seasonsItem.de &&
                                                          seasonsItem.ja)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '3hh3whgq' /* EN | DE | JA */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
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
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (seasonsItem.de &&
                                                          seasonsItem.ja)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'm70gaz01' /* DE | JA */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
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
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (seasonsItem.en &&
                                                          seasonsItem.ja)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'o9jhutuh' /* EN  | JA */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
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
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (seasonsItem.en &&
                                                          !seasonsItem.de &&
                                                          !seasonsItem.ja)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'a9lixe3f' /* EN */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
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
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (!seasonsItem.en &&
                                                          seasonsItem.de &&
                                                          !seasonsItem.ja)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'qgcmpmal' /* DE */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
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
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (!seasonsItem.en &&
                                                          !seasonsItem.de &&
                                                          seasonsItem.ja)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'mkyg9u4r' /* JA */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
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
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      FutureBuilder<int>(
                                        future: queryWorkoutsRecordCount(
                                          queryBuilder: (workoutsRecord) =>
                                              workoutsRecord.where(
                                            'season_id',
                                            isEqualTo: seasonsItem.reference.id,
                                          ),
                                        ),
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
                                          int richTextCount = snapshot.data!;

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ADMIN_SEASONS_RichText_ya90vkwc_ON_TAP');
                                              logFirebaseEvent(
                                                  'RichText_navigate_to');

                                              context.pushNamed(
                                                AdminWorkoutsWidget.routeName,
                                                queryParameters: {
                                                  'season': serializeParam(
                                                    seasonsItem,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'season': seasonsItem,
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      formatNumber(
                                                        richTextCount,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                      'uq0p7izl' /* workouts */,
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
                                                      'y0oz02a2' /*  ~  */,
                                                    ),
                                                    style: GoogleFonts.urbanist(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12.0,
                                                      height: 1.4,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: seasonsItem
                                                            .duration,
                                                        deText: seasonsItem
                                                            .durationDe,
                                                        jaText: seasonsItem
                                                            .durationJa,
                                                      ),
                                                      '-',
                                                    ),
                                                    style: GoogleFonts.urbanist(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12.0,
                                                      height: 1.4,
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
                                                      color:
                                                          FlutterFlowTheme.of(
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

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ADMIN_SEASONS_RichText_rsmnfg7h_ON_TAP');
                                              logFirebaseEvent(
                                                  'RichText_navigate_to');

                                              context.pushNamed(
                                                AdminWorkoutsWidget.routeName,
                                                queryParameters: {
                                                  'season': serializeParam(
                                                    seasonsItem,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'season': seasonsItem,
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      formatNumber(
                                                        functions.userSeasonPassed(
                                                            richTextProgressRecordList
                                                                .toList(),
                                                            seasonsItem
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                      'gm62aabq' /* people passed */,
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
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                            ),
                                          );
                                        },
                                      ),
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ADMIN_SEASONS_Container_mlatn00l_ON_TAP');
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
                                                        AdminSeasonsDialogWidget(
                                                      season: seasonsItem,
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
                                  dataRowHeight: 64.0,
                                  columnSpacing: 20.0,
                                  headingRowColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  addHorizontalDivider: true,
                                  addTopAndBottomDivider: false,
                                  hideDefaultHorizontalDivider: true,
                                  horizontalDividerColor:
                                      FlutterFlowTheme.of(context).primary,
                                  horizontalDividerThickness: 8.0,
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
