import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/filter_season_dialog/filter_season_dialog_widget.dart';
import '/components/dialogs/god_mode_dialog/god_mode_dialog_widget.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/season_main_comp/season_main_comp_widget.dart';
import '/components/skeleton/skeleton_season_main_list/skeleton_season_main_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'season_workout_page_model.dart';
export 'season_workout_page_model.dart';

class SeasonWorkoutPageWidget extends StatefulWidget {
  const SeasonWorkoutPageWidget({super.key});

  static String routeName = 'SeasonWorkoutPage';
  static String routePath = '/seasonWorkoutPage';

  @override
  State<SeasonWorkoutPageWidget> createState() =>
      _SeasonWorkoutPageWidgetState();
}

class _SeasonWorkoutPageWidgetState extends State<SeasonWorkoutPageWidget> {
  late SeasonWorkoutPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeasonWorkoutPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      _model.tab = valueOrDefault<int>(
        valueOrDefault(currentUserDocument?.currentLevel, 0),
        1,
      );
      unawaited(
        () async {
          await _model.pageViewController?.animateToPage(
            valueOrDefault<int>(
              valueOrDefault<int>(
                    valueOrDefault(currentUserDocument?.currentLevel, 0),
                    1,
                  ) -
                  1,
              1,
            ),
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
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
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: AutoSizeText(
                                FFLocalizations.of(context).getText(
                                  'lmxhteh0' /* Workout collections */,
                                ),
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 24.0,
                                      letterSpacing: 0.07,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                      lineHeight: 1.4,
                                    ),
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).middleGray,
                            borderRadius: 12.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            icon: Icon(
                              FFIcons.kfilter24,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              HapticFeedback.mediumImpact();
                              if (currentUserEmail != '') {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: FilterSeasonDialogWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: GuestDialogWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
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
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).red,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).red,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    FFIcons.kinfo16,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'qw7pnzfy' /* To enjoy the best experience, ... */,
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
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final levels = FFAppState().levels.toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(levels.length, (levelsIndex) {
                                final levelsItem = levels[levelsIndex];
                                return FFButtonWidget(
                                  onPressed: () async {
                                    HapticFeedback.selectionClick();
                                    if (levelsItem.number < 4) {
                                      _model.tab = valueOrDefault<int>(
                                        levelsItem.number,
                                        1,
                                      );
                                      safeSetState(() {});
                                      await _model.pageViewController
                                          ?.animateToPage(
                                        valueOrDefault<int>(
                                          levelsIndex,
                                          0,
                                        ),
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    } else {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
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
                                              child: GodModeDialogWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }
                                  },
                                  text: valueOrDefault<String>(
                                    levelsItem.titleEn,
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
                                          : FlutterFlowTheme.of(context)
                                              .primary,
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          fontSize: 14.0,
                                          letterSpacing: 0.07,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                          lineHeight: 1.4,
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
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  showLoadingIndicator: false,
                                );
                              })
                                      .divide(SizedBox(width: 8.0))
                                      .addToStart(SizedBox(width: 16.0))
                                      .addToEnd(SizedBox(width: 16.0)),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
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
                            return SkeletonSeasonMainListWidget();
                          }
                          List<ProgressRecord> containerProgressRecordList =
                              snapshot.data!;
                          final containerProgressRecord =
                              containerProgressRecordList.isNotEmpty
                                  ? containerProgressRecordList.first
                                  : null;

                          return Container(
                            decoration: BoxDecoration(),
                            child: StreamBuilder<List<SeasonsRecord>>(
                              stream: querySeasonsRecord(
                                queryBuilder: (seasonsRecord) => seasonsRecord
                                    .where(
                                      'level',
                                      isEqualTo: _model.tab,
                                    )
                                    .where(
                                      'released_at',
                                      isLessThanOrEqualTo: getCurrentTimestamp,
                                    ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return SkeletonSeasonMainListWidget();
                                }
                                List<SeasonsRecord> containerSeasonsRecordList =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final level = FFAppState()
                                          .levels
                                          .sortedList(
                                              keyOf: (e) => e.number,
                                              desc: false)
                                          .toList();
                                      if (level.isEmpty) {
                                        return EmptyListWidget();
                                      }

                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: PageView.builder(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: max(
                                                      0,
                                                      min(0,
                                                          level.length - 1))),
                                          onPageChanged: (_) async {
                                            _model.tab = valueOrDefault<int>(
                                              _model.pageViewCurrentIndex + 1,
                                              1,
                                            );
                                            safeSetState(() {});
                                            if ((_model.tab == 4) &&
                                                (containerSeasonsRecordList
                                                        .where(
                                                            (e) => e.level == 4)
                                                        .toList()
                                                        .length ==
                                                    0)) {
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
                                                          GodModeDialogWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              await _model.pageViewController
                                                  ?.animateToPage(
                                                2,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                              _model.tab = 3;
                                              safeSetState(() {});
                                            }
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: level.length,
                                          itemBuilder: (context, levelIndex) {
                                            final levelItem = level[levelIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final containerVar = functions
                                                          .filterSeasons(
                                                              valueOrDefault<
                                                                  int>(
                                                                _model.tab,
                                                                1,
                                                              ),
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState()
                                                                    .seasonFilter,
                                                                'all',
                                                              ),
                                                              containerSeasonsRecordList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .hideCompleted,
                                                              containerProgressRecord
                                                                  ?.seasonDone
                                                                  .toList())
                                                          ?.sortedList(
                                                              keyOf: (e) =>
                                                                  e.number,
                                                              desc: false)
                                                          .toList() ??
                                                      [];
                                                  if (containerVar.isEmpty) {
                                                    return EmptyListWidget();
                                                  }

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      120.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        containerVar.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 12.0),
                                                    itemBuilder: (context,
                                                        containerVarIndex) {
                                                      final containerVarItem =
                                                          containerVar[
                                                              containerVarIndex];
                                                      return wrapWithModel(
                                                        model: _model
                                                            .seasonMainCompModels
                                                            .getModel(
                                                          containerVarItem
                                                              .reference.id,
                                                          containerVarIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            SeasonMainCompWidget(
                                                          key: Key(
                                                            'Key8ou_${containerVarItem.reference.id}',
                                                          ),
                                                          season:
                                                              containerVarItem,
                                                          progress:
                                                              containerProgressRecord!,
                                                          index: valueOrDefault<
                                                              int>(
                                                            containerVarIndex,
                                                            0,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 24.0))
                      .addToStart(SizedBox(height: 64.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(
                    pageNumber: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
