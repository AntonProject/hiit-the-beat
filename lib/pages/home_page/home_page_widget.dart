import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/h_i_i_tthe_beat_shop/h_i_i_tthe_beat_shop_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/season_comp/season_comp_widget.dart';
import '/components/skeleton/skeleton_season_home_raw/skeleton_season_home_raw_widget.dart';
import '/components/skeleton/skeleton_season_raw/skeleton_season_raw_widget.dart';
import '/components/watchtheintroductoryvideo/watchtheintroductoryvideo_widget.dart';
import '/components/z_o_o_m_live_workout_jam_list/z_o_o_m_live_workout_jam_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      if (FFAppState().pendingDeepLinkPage == 'SeasonWorkoutPage') {
        logFirebaseEvent('HomePage_navigate_to');

        context.pushNamed(
          SeasonWorkoutPageWidget.routeName,
          queryParameters: {
            'level': serializeParam(
              valueOrDefault<int>(
                valueOrDefault(currentUserDocument?.currentLevel, 0),
                1,
              ),
              ParamType.int,
            ),
          }.withoutNulls,
        );

        logFirebaseEvent('HomePage_update_app_state');
        FFAppState().pendingDeepLinkPage = '';
        FFAppState().update(() {});
      } else if (FFAppState().pendingDeepLinkPage == 'SubscriptionPage') {
        logFirebaseEvent('HomePage_navigate_to');

        context.pushNamed(SubscriptionPageWidget.routeName);

        logFirebaseEvent('HomePage_update_app_state');
        FFAppState().pendingDeepLinkPage = '';
        FFAppState().update(() {});
      }

      await Future.wait([
        Future(() async {
          logFirebaseEvent('HomePage_custom_action');
          unawaited(
            () async {
              await actions.lockLandscapeMode();
            }(),
          );
        }),
        Future(() async {
          logFirebaseEvent('HomePage_custom_action');
          unawaited(
            () async {
              await actions.setStatusBarColor();
            }(),
          );
        }),
        Future(() async {
          logFirebaseEvent('HomePage_action_block');
          unawaited(
            () async {
              await action_blocks.activeCampaignInit(context);
            }(),
          );
        }),
        Future(() async {
          if (FFAppState().requestFBpermission && isiOS) {
            logFirebaseEvent('HomePage_custom_action');
            unawaited(
              () async {
                await actions.requestTrackingPermission(
                  context,
                );
              }(),
            );
            logFirebaseEvent('HomePage_update_app_state');
            FFAppState().requestFBpermission = false;
            safeSetState(() {});
          }
        }),
        Future(() async {}),
      ]);
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
                                  currentUserPhoto == null ||
                                          currentUserPhoto == ''
                                      ? FlutterFlowTheme.of(context).middleGray
                                      : FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).middleGray,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (currentUserPhoto == null ||
                                      currentUserPhoto == '') {
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
                                  'zyn6613l' /* Ready to HIIT the Beat!? */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.07,
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              Builder(
                                builder: (context) {
                                  if ((currentUserDisplayName == null ||
                                          currentUserDisplayName == '') &&
                                      (currentUserEmail != null &&
                                          currentUserEmail != '')) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Text_3ob6mg5q_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_haptic_feedback');
                                            HapticFeedback.selectionClick();
                                            logFirebaseEvent(
                                                'Text_navigate_to');

                                            context.pushNamed(
                                                ProfileEditPageWidget
                                                    .routeName);
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'jpj2h32k' /* Specify the name */,
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
                                                  letterSpacing: 0.07,
                                                  fontWeight: FontWeight.w600,
                                                  lineHeight: 1.4,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: () {
                                            if (FFLocalizations.of(context)
                                                    .languageCode ==
                                                'en') {
                                              return 112.0;
                                            } else if (FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'de') {
                                              return 70.0;
                                            } else {
                                              return 130.0;
                                            }
                                          }(),
                                          child: Divider(
                                            height: 0.8,
                                            thickness: 2.0,
                                            indent: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return AuthUserStreamWidget(
                                      builder: (context) => AutoSizeText(
                                        valueOrDefault<String>(
                                          currentUserDisplayName != null &&
                                                  currentUserDisplayName != ''
                                              ? currentUserDisplayName
                                              : valueOrDefault<String>(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText: 'Guest',
                                                    deText: 'Gast',
                                                    jaText: 'ゲスト',
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
                                              lineHeight: 1.4,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
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
                                                jaText:
                                                    columnPromoRecord.textJa,
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
                                                  lineHeight: 1.4,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
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
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerProgressRecord =
                              containerProgressRecordList.isNotEmpty
                                  ? containerProgressRecordList.first
                                  : null;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: Container(
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
                                    child: Container(
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
                                                    'Level ${valueOrDefault<String>(
                                                      functions
                                                          .levelUser(
                                                              functions.totalPoints(
                                                                  containerProgressRecord
                                                                      ?.workoutDone
                                                                      ?.toList()),
                                                              functions
                                                                  .levels()
                                                                  .toList())
                                                          .levelNumber
                                                          .toString(),
                                                      '1',
                                                    )} / ${valueOrDefault<String>(
                                                      functions
                                                          .levelUser(
                                                              functions.totalPoints(
                                                                  containerProgressRecord
                                                                      ?.workoutDone
                                                                      ?.toList()),
                                                              functions
                                                                  .levels()
                                                                  .toList())
                                                          .levenName,
                                                      '1',
                                                    )}',
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
                                                          lineHeight: 1.4,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
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
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                                containerProgressRecord
                                                                    ?.workoutDone
                                                                    ?.toList()),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
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
                                                                  lineHeight:
                                                                      1.4,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                            LinearPercentIndicator(
                                              percent: valueOrDefault<double>(
                                                functions
                                                    .totalPointsProgressLevel(
                                                        containerProgressRecord
                                                            ?.workoutDone
                                                            ?.toList(),
                                                        functions
                                                            .levels()
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
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/level.png',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  functions.totalPoints(
                                                              containerProgressRecord
                                                                  ?.workoutDone
                                                                  ?.toList()) ==
                                                          0
                                                      ? valueOrDefault<String>(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                            enText:
                                                                'Train everything that matters',
                                                            deText:
                                                                'Trainiere alles, was wichtig ist',
                                                            jaText:
                                                                '重要なことはすべて練習しよう',
                                                          ),
                                                          'Train everything that matters',
                                                        )
                                                      : 'The next level is one workout away',
                                                  'Ready to transform?!',
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.25,
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
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 6.0,
                                                  sigmaY: 6.0,
                                                ),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'HOME_PAGE_PAGE_Button_4kjqsv3j_ON_TAP');
                                                    if (functions.totalPoints(
                                                            containerProgressRecord
                                                                ?.workoutDone
                                                                ?.toList()) ==
                                                        0) {
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                        SeasonWorkoutPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'level':
                                                              serializeParam(
                                                            1,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_custom_action');
                                                      _model.allSeasonDone =
                                                          await actions
                                                              .allSeasonDoneByLevel(
                                                        valueOrDefault<int>(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.currentLevel,
                                                              0),
                                                          1,
                                                        ),
                                                        containerProgressRecord
                                                            ?.seasonDone
                                                            ?.toList(),
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .seasonFilter,
                                                          'de',
                                                        ),
                                                        valueOrDefault<bool>(
                                                          FFAppState()
                                                              .hideCompleted,
                                                          false,
                                                        ),
                                                      );
                                                      if (_model
                                                              .allSeasonDone! ||
                                                          (containerProgressRecord
                                                                  ?.workoutDone
                                                                  ?.where((e) =>
                                                                      e.level ==
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.currentLevel,
                                                                          0))
                                                                  .toList()
                                                                  ?.length ==
                                                              0)) {
                                                        logFirebaseEvent(
                                                            'Button_navigate_to');

                                                        context.pushNamed(
                                                          SeasonWorkoutPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'level':
                                                                serializeParam(
                                                              valueOrDefault<
                                                                  int>(
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.currentLevel,
                                                                    0),
                                                                1,
                                                              ),
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        if (functions.seasonDoneExist(
                                                            containerProgressRecord
                                                                ?.seasonDone
                                                                ?.toList(),
                                                            containerProgressRecord!
                                                                .workoutDone
                                                                .lastOrNull!
                                                                .seasonId)) {
                                                          logFirebaseEvent(
                                                              'Button_custom_action');
                                                          _model.nextSeason =
                                                              await actions
                                                                  .seasonIdNext(
                                                            containerProgressRecord
                                                                ?.workoutDone
                                                                ?.toList(),
                                                            valueOrDefault<int>(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.currentLevel,
                                                                  0),
                                                              1,
                                                            ),
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .seasonFilter,
                                                              'de',
                                                            ),
                                                            valueOrDefault<
                                                                bool>(
                                                              FFAppState()
                                                                  .hideCompleted,
                                                              false,
                                                            ),
                                                            containerProgressRecord
                                                                ?.seasonDone
                                                                ?.toList(),
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_firestore_query');
                                                          _model.countNext =
                                                              await queryWorkoutsRecordCount(
                                                            queryBuilder:
                                                                (workoutsRecord) =>
                                                                    workoutsRecord
                                                                        .where(
                                                              'season_id',
                                                              isEqualTo: _model
                                                                  .nextSeason
                                                                  ?.reference
                                                                  .id,
                                                            ),
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.pushNamed(
                                                            SeasonPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'season':
                                                                  serializeParam(
                                                                _model
                                                                    .nextSeason,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'workoutCount':
                                                                  serializeParam(
                                                                _model
                                                                    .countNext,
                                                                ParamType.int,
                                                              ),
                                                              'seasonIndex':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    int>(
                                                                  _model
                                                                      .nextSeason
                                                                      ?.number,
                                                                  0,
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                              'selectedLvl':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    int>(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.currentLevel,
                                                                      0),
                                                                  1,
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'season': _model
                                                                  .nextSeason,
                                                              '__transition_info__':
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_custom_action');
                                                          _model.seasonLvl =
                                                              await actions
                                                                  .seasonId(
                                                            containerProgressRecord
                                                                ?.workoutDone
                                                                ?.toList(),
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_firestore_query');
                                                          _model.count =
                                                              await queryWorkoutsRecordCount(
                                                            queryBuilder:
                                                                (workoutsRecord) =>
                                                                    workoutsRecord
                                                                        .where(
                                                              'season_id',
                                                              isEqualTo: _model
                                                                  .seasonLvl
                                                                  ?.reference
                                                                  .id,
                                                            ),
                                                          );
                                                          if (functions.workoutSeasonDone(
                                                              containerProgressRecord
                                                                  ?.workoutDone
                                                                  ?.toList(),
                                                              containerProgressRecord!
                                                                  .workoutDone
                                                                  .lastOrNull!
                                                                  .seasonId,
                                                              _model.count)) {
                                                            logFirebaseEvent(
                                                                'Button_navigate_to');

                                                            context.pushNamed(
                                                              SeasonPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'season':
                                                                    serializeParam(
                                                                  _model
                                                                      .seasonLvl,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                                'workoutCount':
                                                                    serializeParam(
                                                                  _model.count,
                                                                  ParamType.int,
                                                                ),
                                                                'seasonIndex':
                                                                    serializeParam(
                                                                  valueOrDefault<
                                                                      int>(
                                                                    _model
                                                                        .seasonLvl
                                                                        ?.number,
                                                                    0,
                                                                  ),
                                                                  ParamType.int,
                                                                ),
                                                                'selectedLvl':
                                                                    serializeParam(
                                                                  valueOrDefault<
                                                                      int>(
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.currentLevel,
                                                                        0),
                                                                    1,
                                                                  ),
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'season': _model
                                                                    .seasonLvl,
                                                                '__transition_info__':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Button_custom_action');
                                                            _model.workDoc =
                                                                await actions
                                                                    .workoutById(
                                                              containerProgressRecord!
                                                                  .workoutDone
                                                                  .lastOrNull!
                                                                  .workoutId,
                                                              containerProgressRecord
                                                                  ?.workoutDone
                                                                  ?.toList(),
                                                            );
                                                            logFirebaseEvent(
                                                                'Button_navigate_to');

                                                            context.pushNamed(
                                                              WorkoutPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'season':
                                                                    serializeParam(
                                                                  _model
                                                                      .seasonLvl,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                                'workout':
                                                                    serializeParam(
                                                                  _model
                                                                      .workDoc,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                                'workoutCount':
                                                                    serializeParam(
                                                                  valueOrDefault<
                                                                      int>(
                                                                    _model
                                                                        .count,
                                                                    1,
                                                                  ),
                                                                  ParamType.int,
                                                                ),
                                                                'indexInList':
                                                                    serializeParam(
                                                                  valueOrDefault<
                                                                      int>(
                                                                    valueOrDefault<
                                                                                int>(
                                                                              _model.workDoc!.index - 1,
                                                                              1,
                                                                            ) <
                                                                            1
                                                                        ? 0
                                                                        : valueOrDefault<
                                                                            int>(
                                                                            _model.workDoc!.index -
                                                                                1,
                                                                            1,
                                                                          ),
                                                                    0,
                                                                  ),
                                                                  ParamType.int,
                                                                ),
                                                                'progress':
                                                                    serializeParam(
                                                                  containerProgressRecord
                                                                      ?.reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'seasonIndex':
                                                                    serializeParam(
                                                                  valueOrDefault<
                                                                      int>(
                                                                    _model
                                                                        .seasonLvl
                                                                        ?.number,
                                                                    0,
                                                                  ),
                                                                  ParamType.int,
                                                                ),
                                                                'selectedLvl':
                                                                    serializeParam(
                                                                  valueOrDefault<
                                                                      int>(
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.currentLevel,
                                                                        0),
                                                                    1,
                                                                  ),
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'season': _model
                                                                    .seasonLvl,
                                                                'workout': _model
                                                                    .workDoc,
                                                              },
                                                            );
                                                          }
                                                        }
                                                      }
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  text: valueOrDefault<String>(
                                                    functions.totalPoints(
                                                                containerProgressRecord
                                                                    ?.workoutDone
                                                                    ?.toList()) ==
                                                            0
                                                        ? valueOrDefault<
                                                            String>(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              enText:
                                                                  'Start first workout',
                                                              deText:
                                                                  'Beginnen Sie mit dem ersten Training',
                                                              jaText:
                                                                  '最初のトレーニングを開始する',
                                                            ),
                                                            'Start first workout',
                                                          )
                                                        : 'Start next workout',
                                                    'Let’s go!',
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .black30,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (getRemoteConfigBool('showVideoIntro'))
                              wrapWithModel(
                                model: _model.watchtheintroductoryvideoModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: WatchtheintroductoryvideoWidget(),
                              ),
                            wrapWithModel(
                              model: _model.zOOMLiveWorkoutJamListModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ZOOMLiveWorkoutJamListWidget(),
                            ),
                            if (getRemoteConfigBool('showShopBanner'))
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
                          ].addToStart(SizedBox(height: 0.0)),
                        ),
                      ),
                      if (getRemoteConfigBool('showBanner'))
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
                                visible: containerVideosRecordList
                                        .where((e) =>
                                            e.cover != null && e.cover != '')
                                        .toList()
                                        .length >
                                    0,
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
                                      visible: containerVideosRecordList
                                              .where((e) =>
                                                  e.cover != null &&
                                                  e.cover != '')
                                              .toList()
                                              .length >
                                          0,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Builder(
                                          builder: (context) {
                                            final videos =
                                                containerVideosRecordList
                                                    .where((e) =>
                                                        e.cover != null &&
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
                                                          width:
                                                              double.infinity,
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
                                                                                null &&
                                                                            videosItem.coverDe !=
                                                                                '') &&
                                                                        (FFLocalizations.of(context).languageCode !=
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
                                                                      width:
                                                                          32.0,
                                                                      height:
                                                                          32.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            ((videosItem.videoUrlEn != null && videosItem.videoUrlEn != '') && (FFLocalizations.of(context).languageCode == 'en')) ||
                                                                                ((videosItem.videoUrlDe != null && videosItem.videoUrlDe != '') && (FFLocalizations.of(context).languageCode != 'en')),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              BackdropFilter(
                                                                            filter:
                                                                                ImageFilter.blur(
                                                                              sigmaX: 12.0,
                                                                              sigmaY: 12.0,
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_PAGE_Container_tm04lbts_ON_TAP');
                                                                                logFirebaseEvent('Container_navigate_to');

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
                                                                                    'videoJa': serializeParam(
                                                                                      videosItem.videoUrlJa,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Container(
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
                                                                        filter:
                                                                            ImageFilter.blur(
                                                                          sigmaX:
                                                                              12.0,
                                                                          sigmaY:
                                                                              12.0,
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              valueOrDefault<double>(
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
                                                                      width:
                                                                          32.0,
                                                                      height:
                                                                          32.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            ((videosItem.urlEn != null && videosItem.urlEn != '') && (FFLocalizations.of(context).languageCode == 'en')) ||
                                                                                ((videosItem.urlDe != null && videosItem.urlDe != '') && (FFLocalizations.of(context).languageCode != 'en')),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              BackdropFilter(
                                                                            filter:
                                                                                ImageFilter.blur(
                                                                              sigmaX: 12.0,
                                                                              sigmaY: 12.0,
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('HOME_PAGE_PAGE_Container_8f7ecgxa_ON_TAP');
                                                                                logFirebaseEvent('Container_launch_u_r_l');
                                                                                unawaited(
                                                                                  () async {
                                                                                    await launchURL(FFLocalizations.of(context).getVariableText(
                                                                                      enText: videosItem.urlEn,
                                                                                      deText: videosItem.urlDe,
                                                                                      jaText: videosItem.urlJa,
                                                                                    ));
                                                                                  }(),
                                                                                );
                                                                              },
                                                                              child: Container(
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
                                                                    width:
                                                                        8.0)),
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
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
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
                                                        onDotClicked:
                                                            (i) async {
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
                                                              PaintingStyle
                                                                  .fill,
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
                      if (getRemoteConfigBool('newSeasonShow'))
                        Container(
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: currentUserEmail != null &&
                                currentUserEmail != '',
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
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
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
                                                lineHeight: 1.4,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) =>
                                          StreamBuilder<List<SeasonsRecord>>(
                                        stream: querySeasonsRecord(
                                          queryBuilder: (seasonsRecord) =>
                                              seasonsRecord.where(
                                            'level',
                                            isEqualTo: valueOrDefault<int>(
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.currentLevel,
                                                  0),
                                              1,
                                            ),
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
                                                                ?.toList(),
                                                            columnProgressRecord
                                                                ?.workoutDone
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
                                                  padding: EdgeInsets.fromLTRB(
                                                    16.0,
                                                    0,
                                                    16.0,
                                                    0,
                                                  ),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      containerVar.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(width: 8.0),
                                                  itemBuilder: (context,
                                                      containerVarIndex) {
                                                    final containerVarItem =
                                                        containerVar[
                                                            containerVarIndex];
                                                    return wrapWithModel(
                                                      model: _model
                                                          .seasonCompModels
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
                                                        season:
                                                            containerVarItem,
                                                        index:
                                                            valueOrDefault<int>(
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
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_SEE_ALL_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_haptic_feedback');
                                          HapticFeedback.selectionClick();
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.goNamed(
                                            SeasonWorkoutPageWidget.routeName,
                                            queryParameters: {
                                              'level': serializeParam(
                                                valueOrDefault<int>(
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.currentLevel,
                                                      0),
                                                  1,
                                                ),
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
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
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '6i91y6f5' /* See all */,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.07,
                                                lineHeight: 1.4,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 16.0))
                                      .addToStart(SizedBox(height: 12.0)),
                                );
                              },
                            ),
                          ),
                        ),
                    ]
                        .divide(SizedBox(height: 8.0))
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
