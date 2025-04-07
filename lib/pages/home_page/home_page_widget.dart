import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/becomea_h_i_i_tthe_beat_trainer/becomea_h_i_i_tthe_beat_trainer_widget.dart';
import '/components/dialogs/payment_dialog_start/payment_dialog_start_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/h_i_i_tthe_beat_shop/h_i_i_tthe_beat_shop_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/season_comp/season_comp_widget.dart';
import '/components/skeleton/skeleton_home_points/skeleton_home_points_widget.dart';
import '/components/skeleton/skeleton_season_home_raw/skeleton_season_home_raw_widget.dart';
import '/components/skeleton/skeleton_season_raw/skeleton_season_raw_widget.dart';
import '/components/watchtheintroductoryvideo/watchtheintroductoryvideo_widget.dart';
import '/components/z_o_o_m_live_workout_jam/z_o_o_m_live_workout_jam_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      if (((valueOrDefault<bool>(currentUserDocument?.showTrialDialog, false) !=
                  true) ||
              (valueOrDefault<bool>(
                      currentUserDocument?.showTrialDialog, false) ==
                  null)) &&
          ((valueOrDefault<bool>(currentUserDocument?.plusmember, false) !=
                  true) ||
              (valueOrDefault<bool>(currentUserDocument?.plusmember, false) ==
                  null))) {
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
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: PaymentDialogStartWidget(),
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
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  currentUserPhoto == ''
                                      ? FlutterFlowTheme.of(context).middleGray
                                      : FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).middleGray,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (currentUserPhoto == '') {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kuser20,
                                        color:
                                            FlutterFlowTheme.of(context).gray,
                                        size: 32.0,
                                      ),
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            Duration(milliseconds: 500),
                                        imageUrl: currentUserPhoto,
                                        width: 60.0,
                                        height: 60.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'zyn6613l' /* Ready to HIIT the Beat again!? */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.07,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                      lineHeight: 1.4,
                                    ),
                              ),
                              Builder(
                                builder: (context) {
                                  if ((currentUserDisplayName == '') &&
                                      (currentUserEmail != '')) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        HapticFeedback.selectionClick();

                                        context.pushNamed(
                                            ProfileEditPageWidget.routeName);
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'jpj2h32k' /* Specify the name */,
                                        ),
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
                                              decoration:
                                                  TextDecoration.underline,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    );
                                  } else {
                                    return AuthUserStreamWidget(
                                      builder: (context) => AutoSizeText(
                                        valueOrDefault<String>(
                                          currentUserDisplayName != ''
                                              ? currentUserDisplayName
                                              : valueOrDefault<String>(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText: 'Guest',
                                                    deText: 'Gast',
                                                  ),
                                                  'Guest',
                                                ),
                                          'Guest',
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
                                                      .primaryText,
                                              fontSize: 20.0,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ]
                            .divide(SizedBox(width: 16.0))
                            .addToStart(SizedBox(width: 16.0))
                            .addToEnd(SizedBox(width: 16.0)),
                      ),
                      if (!valueOrDefault<bool>(
                          currentUserDocument?.plusmember, false))
                        AuthUserStreamWidget(
                          builder: (context) =>
                              FutureBuilder<List<PromoRecord>>(
                            future: queryPromoRecordOnce(
                              queryBuilder: (promoRecord) => promoRecord
                                  .where(
                                    'show',
                                    isEqualTo: true,
                                  )
                                  .orderBy('created_at', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.transparent,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<PromoRecord> columnPromoRecordList =
                                  snapshot.data!;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(columnPromoRecordList.length,
                                        (columnIndex) {
                                  final columnPromoRecord =
                                      columnPromoRecordList[columnIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .darkGreen,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .darkGreen,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 4.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText:
                                                    columnPromoRecord.textEn,
                                                deText:
                                                    columnPromoRecord.textDe,
                                              ),
                                              'Become a Plusmember with a 30% discount until February 12',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.07,
                                                  fontWeight: FontWeight.w500,
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
                                      ),
                                    ),
                                  );
                                }).divide(SizedBox(height: 8.0)),
                              );
                            },
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: FutureBuilder<List<ProgressRecord>>(
                          future: queryProgressRecordOnce(
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
                              return SkeletonHomePointsWidget();
                            }
                            List<ProgressRecord> totalpointsProgressRecordList =
                                snapshot.data!;
                            final totalpointsProgressRecord =
                                totalpointsProgressRecordList.isNotEmpty
                                    ? totalpointsProgressRecordList.first
                                    : null;

                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF9C244C),
                                    Color(0xFF2883AE)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: FutureBuilder<List<WorkoutsRecord>>(
                                future: _model.workouts(
                                  requestFn: () => queryWorkoutsRecordOnce(),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return SkeletonHomePointsWidget();
                                  }
                                  List<WorkoutsRecord>
                                      containerWorkoutsRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 20.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '3ajxrnu5' /* Total points */,
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
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.07,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  width: 33.0,
                                                  height: 28.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          functions.totalPoints(
                                                              totalpointsProgressRecord
                                                                  ?.workoutDone
                                                                  .toList()),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '0',
                                                          locale: '',
                                                        ),
                                                        '0',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.07,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                                lineHeight: 1.4,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                          LinearPercentIndicator(
                                            percent: valueOrDefault<double>(
                                              functions.totalPointsProgress(
                                                  totalpointsProgressRecord
                                                      ?.workoutDone
                                                      .toList(),
                                                  containerWorkoutsRecordList
                                                      .map((e) =>
                                                          valueOrDefault<int>(
                                                            e.points,
                                                            0,
                                                          ))
                                                      .toList()),
                                              0.0,
                                            ),
                                            lineHeight: 8.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .black30,
                                            barRadius: Radius.circular(8.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.zOOMLiveWorkoutJamModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ZOOMLiveWorkoutJamWidget(),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.becomeaHIITtheBeatTrainerModel,
                                updateCallback: () => safeSetState(() {}),
                                child: BecomeaHIITtheBeatTrainerWidget(),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.hIITtheBeatShopModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: HIITtheBeatShopWidget(),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.watchtheintroductoryvideoModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: WatchtheintroductoryvideoWidget(),
                              ),
                            ),
                          ].addToStart(SizedBox(height: 12.0)),
                        ),
                      ),
                      FutureBuilder<List<VideosRecord>>(
                        future: queryVideosRecordOnce(
                          queryBuilder: (videosRecord) => videosRecord
                              .where(
                                'type',
                                isEqualTo: 'Home',
                              )
                              .orderBy('index'),
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
                          List<VideosRecord> containerVideosRecordList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: containerVideosRecordList.isNotEmpty,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 600.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Visibility(
                                    visible:
                                        containerVideosRecordList.length > 0,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Builder(
                                        builder: (context) {
                                          final videos =
                                              containerVideosRecordList
                                                  .where((e) =>
                                                      e.cover != '')
                                                  .toList();

                                          return Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.25,
                                            child: Stack(
                                              children: [
                                                PageView.builder(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: max(
                                                              0,
                                                              min(
                                                                  0,
                                                                  videos.length -
                                                                      1))),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: videos.length,
                                                  itemBuilder:
                                                      (context, videosIndex) {
                                                    final videosItem =
                                                        videos[videosIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.25,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 600.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                CachedNetworkImageProvider(
                                                              (videosItem.coverDe !=
                                                                              '') &&
                                                                      (FFLocalizations.of(context)
                                                                              .languageCode !=
                                                                          'en')
                                                                  ? videosItem
                                                                      .coverDe
                                                                  : videosItem
                                                                      .cover,
                                                            ),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Container(
                                                                    width: 32.0,
                                                                    height:
                                                                        32.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Visibility(
                                                                      visible: ((videosItem.videoUrlEn != '') &&
                                                                              (FFLocalizations.of(context).languageCode ==
                                                                                  'en')) ||
                                                                          ((videosItem.videoUrlDe != '') &&
                                                                              (FFLocalizations.of(context).languageCode != 'en')),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                12.0,
                                                                            sigmaY:
                                                                                12.0,
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                VideoPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'videoEn': serializeParam(
                                                                                    videosItem.videoUrlEn,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'videoDe': serializeParam(
                                                                                    videosItem.videoUrlDe,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).black30,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Icon(
                                                                                FFIcons.kplay24,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 16.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child:
                                                                        BackdropFilter(
                                                                      filter: ImageFilter
                                                                          .blur(
                                                                        sigmaX:
                                                                            12.0,
                                                                        sigmaY:
                                                                            12.0,
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width: valueOrDefault<
                                                                            double>(
                                                                          valueOrDefault<int>(
                                                                                containerVideosRecordList.length,
                                                                                0,
                                                                              ) *
                                                                              20,
                                                                          80.0,
                                                                        ),
                                                                        height:
                                                                            32.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).black30,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Container(
                                                                    width: 32.0,
                                                                    height:
                                                                        32.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Visibility(
                                                                      visible: ((videosItem.urlEn != '') &&
                                                                              (FFLocalizations.of(context).languageCode ==
                                                                                  'en')) ||
                                                                          ((videosItem.urlDe != '') &&
                                                                              (FFLocalizations.of(context).languageCode != 'en')),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                12.0,
                                                                            sigmaY:
                                                                                12.0,
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              unawaited(
                                                                                () async {
                                                                                  await launchURL(FFLocalizations.of(context).getVariableText(
                                                                                    enText: videosItem.urlEn,
                                                                                    deText: videosItem.urlDe,
                                                                                  ));
                                                                                }(),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).black30,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Icon(
                                                                                FFIcons.klinkNew,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 10.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 16.0),
                                                    child: smooth_page_indicator
                                                        .SmoothPageIndicator(
                                                      controller: _model
                                                              .pageViewController ??=
                                                          PageController(
                                                              initialPage: max(
                                                                  0,
                                                                  min(
                                                                      0,
                                                                      videos.length -
                                                                          1))),
                                                      count: videos.length,
                                                      axisDirection:
                                                          Axis.horizontal,
                                                      onDotClicked: (i) async {
                                                        await _model
                                                            .pageViewController!
                                                            .animateToPage(
                                                          i,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve: Curves.ease,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      effect:
                                                          smooth_page_indicator
                                                              .SlideEffect(
                                                        spacing: 8.0,
                                                        radius: 8.0,
                                                        dotWidth: 8.0,
                                                        dotHeight: 8.0,
                                                        dotColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        activeDotColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        paintStyle:
                                                            PaintingStyle.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      if (currentUserEmail != '')
                        FutureBuilder<List<ProgressRecord>>(
                          future: queryProgressRecordOnce(
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
                              return SkeletonSeasonHomeRawWidget();
                            }
                            List<ProgressRecord> columnProgressRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnProgressRecord =
                                columnProgressRecordList.isNotEmpty
                                    ? columnProgressRecordList.first
                                    : null;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        'c31rrmc2' /* New Seasons you can be interes... */,
                                      ),
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 20.0,
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
                                AuthUserStreamWidget(
                                  builder: (context) =>
                                      StreamBuilder<List<SeasonsRecord>>(
                                    stream: querySeasonsRecord(
                                      queryBuilder: (seasonsRecord) =>
                                          seasonsRecord
                                              .where(
                                                'level',
                                                isEqualTo: valueOrDefault<int>(
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.currentLevel,
                                                      0),
                                                  1,
                                                ),
                                              )
                                              .where(
                                                'released_at',
                                                isLessThanOrEqualTo:
                                                    getCurrentTimestamp,
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return SkeletonSeasonRawWidget();
                                      }
                                      List<SeasonsRecord>
                                          containerSeasonsRecordList =
                                          snapshot.data!;

                                      return Container(
                                        height: 72.0,
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final containerVar = functions
                                                    .seasonsNotDone(
                                                        valueOrDefault<int>(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.currentLevel,
                                                              0),
                                                          1,
                                                        ),
                                                        containerSeasonsRecordList
                                                            .toList(),
                                                        columnProgressRecord
                                                            ?.seasonDone
                                                            .toList(),
                                                        columnProgressRecord
                                                            ?.workoutDone
                                                            .toList())
                                                    ?.sortedList(
                                                        keyOf: (e) => e.number,
                                                        desc: false)
                                                    .toList() ??
                                                [];
                                            if (containerVar.isEmpty) {
                                              return EmptyListWidget();
                                            }

                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                16.0,
                                                0,
                                                16.0,
                                                0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: containerVar.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, containerVarIndex) {
                                                final containerVarItem =
                                                    containerVar[
                                                        containerVarIndex];
                                                return wrapWithModel(
                                                  model: _model.seasonCompModels
                                                      .getModel(
                                                    containerVarItem
                                                        .reference.id,
                                                    containerVarIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: SeasonCompWidget(
                                                    key: Key(
                                                      'Keyt62_${containerVarItem.reference.id}',
                                                    ),
                                                    season: containerVarItem,
                                                    index: valueOrDefault<int>(
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
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      HapticFeedback.selectionClick();

                                      context.goNamed(
                                        SeasonWorkoutPageWidget.routeName,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '6i91y6f5' /* See all */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.07,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                            lineHeight: 1.4,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 16.0))
                                  .addToStart(SizedBox(height: 12.0)),
                            );
                          },
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (false)
                            Expanded(
                              flex: 3,
                              child: Opacity(
                                opacity: 0.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Logo_white_2.png',
                                    width: 200.0,
                                    height: 100.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Logo_white_1.png',
                                width: 200.0,
                                height: 100.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(width: 16.0))
                            .addToEnd(SizedBox(width: 16.0)),
                      ),
                    ]
                        .divide(SizedBox(height: 12.0))
                        .addToStart(SizedBox(height: 64.0))
                        .addToEnd(SizedBox(height: 120.0)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(
                    pageNumber: 1,
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
