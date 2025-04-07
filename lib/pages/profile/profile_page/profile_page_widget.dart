import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/becomea_h_i_i_tthe_beat_trainer/becomea_h_i_i_tthe_beat_trainer_widget.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/language_select_dialog/language_select_dialog_widget.dart';
import '/components/dialogs/log_out_dialog/log_out_dialog_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/profile_menu_option/profile_menu_option_widget.dart';
import '/components/skeleton/skeleton_homezoom/skeleton_homezoom_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  static String routeName = 'ProfilePage';
  static String routePath = '/profilePage';

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget>
    with TickerProviderStateMixin {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 3000.0.ms,
            duration: 1000.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 24.0, 16.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: 128.0,
                                  height: 128.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      currentUserPhoto == ''
                                          ? FlutterFlowTheme.of(context)
                                              .middleGray
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      FlutterFlowTheme.of(context).middleGray,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      if (currentUserPhoto == '') {
                                        return Icon(
                                          FFIcons.kuser20,
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                          size: 40.0,
                                        );
                                      } else {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: currentUserPhoto,
                                            width: 128.0,
                                            height: 128.0,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.plusmember, false))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: 128.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF9C244C),
                                            Color(0xFF2883AE)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FFIcons.kplusmember24,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 14.0,
                                          ),
                                          AutoSizeText(
                                            FFLocalizations.of(context).getText(
                                              'auupik7r' /* Plusmember */,
                                            ),
                                            maxLines: 1,
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
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 4.0))
                                            .addToStart(SizedBox(width: 12.0))
                                            .addToEnd(SizedBox(width: 12.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
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
                              if (currentUserEmail != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: AutoSizeText(
                                    currentUserEmail,
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 14.0,
                                          letterSpacing: 0.07,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ),
                              if (currentUserEmail != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      HapticFeedback.selectionClick();

                                      context.pushNamed(
                                          ProfileEditPageWidget.routeName);
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'tc938d2b' /* Edit profile */,
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
                                          .middleGray,
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
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .middleGray,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              if (currentUserEmail == '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      HapticFeedback.selectionClick();
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
                                              child: GuestDialogWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'upquf72x' /* Sign Up */,
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
                                          .middleGray,
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
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              if (!valueOrDefault<bool>(
                                      currentUserDocument?.plusmember, false) &&
                                  (currentUserEmail != ''))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF9C244C),
                                            Color(0xFF2883AE)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          HapticFeedback.selectionClick();
                                          unawaited(
                                            () async {
                                              context.pushNamed(
                                                  SubscriptionPageWidget
                                                      .routeName);
                                            }(),
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'g0sl24xg' /* Become a Plusmember */,
                                        ),
                                        icon: Icon(
                                          FFIcons.kplusmember24,
                                          size: 24.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
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
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                                lineHeight: 1.4,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if ((currentUserEmail != '') &&
                                  valueOrDefault<bool>(
                                      currentUserDocument?.plusmember, false))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF9C244C),
                                            Color(0xFF2883AE)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            HapticFeedback.selectionClick();

                                            context.pushNamed(
                                                SubscriptionPageWidget
                                                    .routeName);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'j5hob92h' /* Manage subscription */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.07,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                      lineHeight: 1.4,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                      wrapWithModel(
                        model: _model.becomeaHIITtheBeatTrainerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BecomeaHIITtheBeatTrainerWidget(),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.mediumImpact();
                          unawaited(
                            () async {
                              await launchURL(FFAppConstants.shopURL);
                            }(),
                          );
                        },
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
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      FFIcons.ktShirt24,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
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
                                        FFLocalizations.of(context).getText(
                                          'kauy94q7' /* HIIT the Beat Shop */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.07,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'gcafpkr2' /* Style yourself for the most en... */,
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
                      FutureBuilder<List<VideosRecord>>(
                        future: queryVideosRecordOnce(
                          queryBuilder: (videosRecord) => videosRecord
                              .where(
                                'type',
                                isEqualTo: 'Introductory',
                              )
                              .orderBy('index'),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return SkeletonHomezoomWidget();
                          }
                          List<VideosRecord>
                              watchtheintroductoryvideoVideosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final watchtheintroductoryvideoVideosRecord =
                              watchtheintroductoryvideoVideosRecordList
                                      .isNotEmpty
                                  ? watchtheintroductoryvideoVideosRecordList
                                      .first
                                  : null;

                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              HapticFeedback.mediumImpact();
                              unawaited(
                                () async {
                                  context.pushNamed(
                                    VideoPageWidget.routeName,
                                    queryParameters: {
                                      'videoEn': serializeParam(
                                        watchtheintroductoryvideoVideosRecord
                                            ?.videoUrlEn,
                                        ParamType.String,
                                      ),
                                      'videoDe': serializeParam(
                                        watchtheintroductoryvideoVideosRecord
                                            ?.videoUrlDe,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }(),
                              );

                              await watchtheintroductoryvideoVideosRecord!
                                  .reference
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'views': FieldValue.increment(1),
                                  },
                                ),
                              });
                            },
                            child: Container(
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
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).red,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).red,
                                        ),
                                      ),
                                      child: Icon(
                                        FFIcons.kvideo24,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'xhmag6ub' /* Watch the introductory video */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.07,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'v600m13f' /* We’ll tell you more about the ... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                          );
                        },
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (currentUserEmail != '')
                                wrapWithModel(
                                  model: _model.profileMenuOptionModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ProfileMenuOptionWidget(
                                    icon: Icon(
                                      FFIcons.kmail24,
                                      color: FlutterFlowTheme.of(context).gray,
                                      size: 24.0,
                                    ),
                                    text: FFLocalizations.of(context).getText(
                                      'hy77uyxj' /* Change email */,
                                    ),
                                    action: () async {
                                      HapticFeedback.selectionClick();

                                      context.pushNamed(
                                          ChangeEmailPageWidget.routeName);
                                    },
                                  ),
                                ),
                              if (currentUserEmail != '')
                                Divider(
                                  height: 32.0,
                                  thickness: 1.0,
                                  color:
                                      FlutterFlowTheme.of(context).middleGray,
                                ),
                              if (currentUserEmail != '')
                                wrapWithModel(
                                  model: _model.profileMenuOptionModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ProfileMenuOptionWidget(
                                    icon: Icon(
                                      FFIcons.kkey24,
                                      color: FlutterFlowTheme.of(context).gray,
                                      size: 24.0,
                                    ),
                                    text: FFLocalizations.of(context).getText(
                                      'o52su2z8' /* Change password */,
                                    ),
                                    action: () async {
                                      HapticFeedback.selectionClick();

                                      context.pushNamed(
                                        PasswordChangePageWidget.routeName,
                                        queryParameters: {
                                          'email': serializeParam(
                                            currentUserEmail,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                ),
                              if (currentUserEmail != '')
                                Divider(
                                  height: 32.0,
                                  thickness: 1.0,
                                  color:
                                      FlutterFlowTheme.of(context).middleGray,
                                ),
                              if (currentUserEmail != '')
                                wrapWithModel(
                                  model: _model.profileMenuOptionModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ProfileMenuOptionWidget(
                                    icon: Icon(
                                      FFIcons.kphone24,
                                      color: FlutterFlowTheme.of(context).gray,
                                      size: 24.0,
                                    ),
                                    text: FFLocalizations.of(context).getText(
                                      'nh8ptgtb' /* Add phone number */,
                                    ),
                                    action: () async {
                                      HapticFeedback.selectionClick();

                                      context.pushNamed(
                                          PhoneEditPageWidget.routeName);
                                    },
                                  ),
                                ),
                              if (currentUserEmail != '')
                                Divider(
                                  height: 32.0,
                                  thickness: 1.0,
                                  color:
                                      FlutterFlowTheme.of(context).middleGray,
                                ),
                              wrapWithModel(
                                model: _model.profileMenuOptionModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: ProfileMenuOptionWidget(
                                  icon: Icon(
                                    FFIcons.klanguage24,
                                    color: FlutterFlowTheme.of(context).gray,
                                    size: 24.0,
                                  ),
                                  text: FFLocalizations.of(context).getText(
                                    'q23yvtm6' /* Language */,
                                  ),
                                  action: () async {
                                    HapticFeedback.selectionClick();
                                    await showModalBottomSheet(
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
                                            child: LanguageSelectDialogWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ),
                            ]
                                .addToStart(SizedBox(height: 20.0))
                                .addToEnd(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.profileMenuOptionModel5,
                                updateCallback: () => safeSetState(() {}),
                                child: ProfileMenuOptionWidget(
                                  icon: Icon(
                                    FFIcons.kdoc24,
                                    color: FlutterFlowTheme.of(context).gray,
                                    size: 24.0,
                                  ),
                                  text: FFLocalizations.of(context).getText(
                                    'hnmc6b5n' /* Terms & conditions */,
                                  ),
                                  action: () async {
                                    HapticFeedback.selectionClick();

                                    context
                                        .pushNamed(TermsPageWidget.routeName);
                                  },
                                ),
                              ),
                              Divider(
                                height: 32.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).middleGray,
                              ),
                              wrapWithModel(
                                model: _model.profileMenuOptionModel6,
                                updateCallback: () => safeSetState(() {}),
                                child: ProfileMenuOptionWidget(
                                  icon: Icon(
                                    FFIcons.kdoc24,
                                    color: FlutterFlowTheme.of(context).gray,
                                    size: 24.0,
                                  ),
                                  text: FFLocalizations.of(context).getText(
                                    'qopf0y37' /* Privacy policy */,
                                  ),
                                  action: () async {
                                    HapticFeedback.selectionClick();

                                    context
                                        .pushNamed(PolicyPageWidget.routeName);
                                  },
                                ),
                              ),
                              Divider(
                                height: 32.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).middleGray,
                              ),
                              wrapWithModel(
                                model: _model.profileMenuOptionModel7,
                                updateCallback: () => safeSetState(() {}),
                                child: ProfileMenuOptionWidget(
                                  icon: Icon(
                                    FFIcons.kcopyright24,
                                    color: FlutterFlowTheme.of(context).gray,
                                    size: 24.0,
                                  ),
                                  text: FFLocalizations.of(context).getText(
                                    '1rpkcydr' /* Imprint */,
                                  ),
                                  action: () async {
                                    HapticFeedback.selectionClick();

                                    context
                                        .pushNamed(ImprintPageWidget.routeName);
                                  },
                                ),
                              ),
                              Divider(
                                height: 32.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).middleGray,
                              ),
                              if (valueOrDefault(
                                      currentUserDocument?.role, '') ==
                                  'admin')
                                AuthUserStreamWidget(
                                  builder: (context) => wrapWithModel(
                                    model: _model.profileMenuOptionModel8,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ProfileMenuOptionWidget(
                                      icon: Icon(
                                        FFIcons.kuser20,
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        size: 24.0,
                                      ),
                                      text: FFLocalizations.of(context).getText(
                                        'i1kbaueb' /* Admin Panel */,
                                      ),
                                      action: () async {
                                        HapticFeedback.selectionClick();

                                        context.pushNamed(
                                            ImprintPageWidget.routeName);
                                      },
                                    ),
                                  ),
                                ),
                              if (valueOrDefault(
                                      currentUserDocument?.role, '') ==
                                  'admin')
                                AuthUserStreamWidget(
                                  builder: (context) => Divider(
                                    height: 32.0,
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).middleGray,
                                  ),
                                ),
                              if (currentUserEmail != '')
                                wrapWithModel(
                                  model: _model.profileMenuOptionModel9,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ProfileMenuOptionWidget(
                                    icon: Icon(
                                      FFIcons.klogOut24,
                                      color: FlutterFlowTheme.of(context).gray,
                                      size: 24.0,
                                    ),
                                    text: FFLocalizations.of(context).getText(
                                      'cjp0056j' /* Log out */,
                                    ),
                                    action: () async {
                                      HapticFeedback.selectionClick();
                                      await showModalBottomSheet(
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
                                              child: LogOutDialogWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                            ]
                                .addToStart(SizedBox(height: 20.0))
                                .addToEnd(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'eqj9yd67' /* Follow us to dive deeper into ... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 12.0,
                                        letterSpacing: 0.07,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                        lineHeight: 1.4,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    HapticFeedback.mediumImpact();
                                    await launchURL(FFAppConstants.youtubeURL);
                                  },
                                  child: Container(
                                    width: 32.0,
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).white,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/youtube.png',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(7.0),
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
                                  HapticFeedback.mediumImpact();
                                  await launchURL(FFAppConstants.facebookURL);
                                },
                                child: Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/Facebook_logo.png',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.mediumImpact();
                                  await launchURL(FFAppConstants.instagramURL);
                                },
                                child: Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/Instagram_logo.png',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(7.0),
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
                          HapticFeedback.mediumImpact();
                          unawaited(
                            () async {
                              await launchURL(FFAppConstants.xmethodURL);
                            }(),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'k60uavkn' /* Designed and developed by */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).gray,
                                    letterSpacing: 0.07,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                    lineHeight: 1.4,
                                  ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                              child: Image.asset(
                                'assets/images/Frame_1000006863.png',
                                width: 101.0,
                                height: 16.0,
                                fit: BoxFit.cover,
                              ),
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 16.0))
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
                    pageNumber: 4,
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
