import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/dialogs/filter_season_dialog/filter_season_dialog_widget.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/onboarding_home_step2/onboarding_home_step2_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/season_main_comp/season_main_comp_widget.dart';
import '/components/skeleton/skeleton_season_main_list/skeleton_season_main_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'season_workout_page_model.dart';
export 'season_workout_page_model.dart';

class SeasonWorkoutPageWidget extends StatefulWidget {
  const SeasonWorkoutPageWidget({
    super.key,
    int? level,
  }) : this.level = level ?? 1;

  final int level;

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

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SeasonWorkoutPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEASON_WORKOUT_SeasonWorkoutPage_ON_INIT');
      logFirebaseEvent('SeasonWorkoutPage_update_page_state');
      _model.tab = valueOrDefault<int>(
        widget!.level,
        1,
      );
      safeSetState(() {});
      logFirebaseEvent('SeasonWorkoutPage_action_block');
      unawaited(
        () async {
          await action_blocks.checkProgressDoc(context);
          safeSetState(() {});
        }(),
      );
      logFirebaseEvent('SeasonWorkoutPage_custom_action');
      unawaited(
        () async {
          await actions.setStatusBarColor();
        }(),
      );
      logFirebaseEvent('SeasonWorkoutPage_custom_action');
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      logFirebaseEvent('SeasonWorkoutPage_page_view');
      unawaited(
        () async {
          await _model.pageViewController?.animateToPage(
            valueOrDefault<int>(
              valueOrDefault<int>(
                    widget!.level,
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
      if (FFAppState().onboardingHome) {
        logFirebaseEvent('SeasonWorkoutPage_bottom_sheet');
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
                child: OnboardingHomeStep2Widget(),
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
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                          ),
                          if (FFLocalizations.of(context).languageCode != 'en')
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).middleGray,
                              borderRadius: 12.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                FFIcons.kfilter24,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SEASON_WORKOUT_filter24_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_haptic_feedback');
                                HapticFeedback.mediumImpact();
                                if (currentUserEmail != null &&
                                    currentUserEmail != '') {
                                  logFirebaseEvent('IconButton_bottom_sheet');
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
                                  logFirebaseEvent('IconButton_bottom_sheet');
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
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
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
                                    logFirebaseEvent(
                                        'SEASON_WORKOUT_PAGE_PAGE_Beginner_ON_TAP');
                                    logFirebaseEvent(
                                        'Beginner_haptic_feedback');
                                    HapticFeedback.selectionClick();
                                    logFirebaseEvent(
                                        'Beginner_update_page_state');
                                    _model.tab = valueOrDefault<int>(
                                      levelsItem.number,
                                      1,
                                    );
                                    safeSetState(() {});
                                    logFirebaseEvent('Beginner_page_view');
                                    await _model.pageViewController
                                        ?.animateToPage(
                                      valueOrDefault<int>(
                                        levelsIndex,
                                        0,
                                      ),
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
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
                                queryBuilder: (seasonsRecord) =>
                                    seasonsRecord.where(
                                  'level',
                                  isEqualTo: _model.tab,
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
                                            logFirebaseEvent(
                                                'SEASON_WORKOUT_PageView_jneigtkk_ON_WIDG');
                                            logFirebaseEvent(
                                                'PageView_update_page_state');
                                            _model.tab = valueOrDefault<int>(
                                              _model.pageViewCurrentIndex + 1,
                                              1,
                                            );
                                            safeSetState(() {});
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
                                                                'de',
                                                              ),
                                                              containerSeasonsRecordList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .hideCompleted,
                                                              containerProgressRecord
                                                                  ?.seasonDone
                                                                  ?.toList())
                                                          ?.sortedList(
                                                              keyOf: (e) =>
                                                                  e.number,
                                                              desc: false)
                                                          ?.toList() ??
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
