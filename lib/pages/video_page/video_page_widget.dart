import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_page_model.dart';
export 'video_page_model.dart';

class VideoPageWidget extends StatefulWidget {
  const VideoPageWidget({
    super.key,
    this.videoEn,
    this.videoDe,
    this.videoJa,
  });

  final String? videoEn;
  final String? videoDe;
  final String? videoJa;

  static String routeName = 'videoPage';
  static String routePath = '/videoPage';

  @override
  State<VideoPageWidget> createState() => _VideoPageWidgetState();
}

class _VideoPageWidgetState extends State<VideoPageWidget> {
  late VideoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'videoPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VIDEO_PAGE_PAGE_videoPage_ON_INIT_STATE');
      logFirebaseEvent('videoPage_custom_action');
      unawaited(
        () async {
          await actions.setStatusBarColor();
        }(),
      );
      logFirebaseEvent('videoPage_update_page_state');
      _model.lang = FFLocalizations.of(context).languageCode;
      safeSetState(() {});
      logFirebaseEvent('videoPage_custom_action');
      unawaited(
        () async {
          await actions.setLandscapeMode();
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).middleGray,
                        borderRadius: 12.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: Colors.black,
                        icon: Icon(
                          FFIcons.kclose24,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'VIDEO_PAGE_PAGE_close24_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_custom_action');
                          unawaited(
                            () async {
                              await actions.lockLandscapeMode();
                            }(),
                          );
                          logFirebaseEvent('IconButton_navigate_back');
                          context.safePop();
                        },
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget!.videoEn != null &&
                                  widget!.videoEn != '')
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: (_model.lang == 'en')
                                        ? null
                                        : () async {
                                            logFirebaseEvent(
                                                'VIDEO_PAGE_PAGE_EN_ON_TAP');
                                            if (_model.lang != 'en') {
                                              logFirebaseEvent(
                                                  'EN_update_page_state');
                                              _model.lang = 'en';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'EN_update_app_state');

                                              FFAppState().update(() {});
                                            }
                                          },
                                    text: FFLocalizations.of(context).getText(
                                      'kyhh86y5' /* EN */,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.black,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: valueOrDefault<Color>(
                                              _model.lang == 'en'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .gray,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
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
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              if (widget!.videoDe != null &&
                                  widget!.videoDe != '')
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: (_model.lang != 'en')
                                        ? null
                                        : () async {
                                            logFirebaseEvent(
                                                'VIDEO_PAGE_PAGE_DE_ON_TAP');
                                            if (_model.lang != 'de') {
                                              logFirebaseEvent(
                                                  'DE_update_page_state');
                                              _model.lang = 'de';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'DE_update_app_state');

                                              FFAppState().update(() {});
                                            }
                                          },
                                    text: FFLocalizations.of(context).getText(
                                      'vx0s9zbp' /* DE */,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.black,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: valueOrDefault<Color>(
                                              _model.lang != 'en'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .gray,
                                              FlutterFlowTheme.of(context).gray,
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
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              if (getRemoteConfigBool('showJapan'))
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: widget!.videoJa != null &&
                                          widget!.videoJa != '',
                                      child: FFButtonWidget(
                                        onPressed: (_model.lang != 'en')
                                            ? null
                                            : () async {
                                                logFirebaseEvent(
                                                    'VIDEO_PAGE_PAGE_JA_ON_TAP');
                                                if (_model.lang != 'ja') {
                                                  logFirebaseEvent(
                                                      'JA_update_page_state');
                                                  _model.lang = 'ja';
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'JA_update_app_state');

                                                  FFAppState().update(() {});
                                                }
                                              },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'n316oec6' /* JA */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.black,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: valueOrDefault<Color>(
                                                  _model.lang != 'en'
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
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
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
                    ],
                  ),
                ),
              ],
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: FlutterFlowVideoPlayer(
                path: _model.lang == 'en'
                    ? (widget!.videoEn != null && widget!.videoEn != ''
                        ? widget!.videoEn!
                        : widget!.videoDe!)
                    : (widget!.videoDe != null && widget!.videoDe != ''
                        ? widget!.videoDe!
                        : widget!.videoEn!),
                videoType: VideoType.network,
                width: MediaQuery.sizeOf(context).width * 0.85,
                height: MediaQuery.sizeOf(context).height * 0.7,
                autoPlay: false,
                looping: false,
                showControls: true,
                allowFullScreen: true,
                allowPlaybackSpeedMenu: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
