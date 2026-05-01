import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_start_model.dart';
export 'onboarding_start_model.dart';

class OnboardingStartWidget extends StatefulWidget {
  const OnboardingStartWidget({super.key});

  @override
  State<OnboardingStartWidget> createState() => _OnboardingStartWidgetState();
}

class _OnboardingStartWidgetState extends State<OnboardingStartWidget> {
  late OnboardingStartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingStartModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 48.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 500.0,
                    child: PageView(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      onPageChanged: (_) async {
                        logFirebaseEvent(
                            'ONBOARDING_START_PageView_zw30rd97_ON_WI');
                        logFirebaseEvent('PageView_rebuild_component');
                        safeSetState(() {});
                      },
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (FFLocalizations.of(context).languageCode ==
                                    'en') {
                                  return RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'nodzlodr' /* 1000+ PEOPLE
 */
                                            ,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w900,
                                                lineHeight: 1.25,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .displayLargeIsCustom,
                                              ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            'ALREADY ACHIEVED THEIR GOALS',
                                            'ALREADY ACHIEVED THEIR GOALS',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w900,
                                                lineHeight: 1.25,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .displayLargeIsCustom,
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
                                  );
                                } else {
                                  return RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            'MEHR ALS ',
                                            'MEHR ALS ',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w900,
                                                lineHeight: 1.25,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .displayLargeIsCustom,
                                              ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            '1000+ MENSCHEN ',
                                            '1000+ MENSCHEN ',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w900,
                                                lineHeight: 1.25,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .displayLargeIsCustom,
                                              ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            'HABEN BEREITS IHRE ZIELE ERREICHT',
                                            'HABEN BEREITS IHRE ZIELE ERREICHT',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w900,
                                                lineHeight: 1.25,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .displayLargeIsCustom,
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
                                  );
                                }
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'q20b4g5y' /* Here are some of the transform... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 28.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(),
                                child: Image.asset(
                                  'assets/images/onboarding1.png',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (FFLocalizations.of(context).languageCode ==
                                    'en') {
                                  return RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            'FEEDBACK FROM PEOPLE THAT ',
                                            'FEEDBACK FROM PEOPLE THAT ',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w900,
                                                lineHeight: 1.25,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .displayLargeIsCustom,
                                              ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            'ALREADY HAVE TRAINED SUCCESSFULLY ',
                                            'ALREADY HAVE TRAINED SUCCESSFULLY ',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w900,
                                                lineHeight: 1.25,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .displayLargeIsCustom,
                                              ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            'WITH THE APP',
                                            'WITH THE APP',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w900,
                                                lineHeight: 1.25,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .displayLargeIsCustom,
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
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              'FEEDBACK VON MENSCHEN, ',
                                              'FEEDBACK VON MENSCHEN, ',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 28.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w900,
                                                  lineHeight: 1.25,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeIsCustom,
                                                ),
                                          ),
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              'DIE BEREITS ERFOLGREICH MIT DER APP TRAINIEREN',
                                              'DIE BEREITS ERFOLGREICH MIT DER APP TRAINIEREN',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontSize: 28.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w900,
                                                  lineHeight: 1.25,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeIsCustom,
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
                                  );
                                }
                              },
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (FFLocalizations.of(context)
                                                .languageCode ==
                                            'en') {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.only(),
                                            child: Image.asset(
                                              'assets/images/onboarding22.png',
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        } else {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.only(),
                                            child: Image.asset(
                                              'assets/images/onboarding2de.png',
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ]
                                      .addToStart(SizedBox(height: 16.0))
                                      .addToEnd(SizedBox(height: 136.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '0hta3ve5' /* EVERY BEAT  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displayLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          lineHeight: 1.25,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .displayLargeIsCustom,
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'ocjkizff' /* PUSHES YOU FORWARD */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displayLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          lineHeight: 1.25,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .displayLargeIsCustom,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 36.0, 0.0, 150.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: FlutterFlowVideoPlayer(
                                    path:
                                        'https://firebasestorage.googleapis.com/v0/b/breakletics-9245d.appspot.com/o/In%20App%20Trailer.mp4?alt=media&token=20ab6ee4-e24e-480f-9b17-1aefc7c4cc63',
                                    videoType: VideoType.network,
                                    width: double.infinity,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.7,
                                    autoPlay: true,
                                    looping: true,
                                    showControls: false,
                                    allowFullScreen: false,
                                    allowPlaybackSpeedMenu: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 24.0,
                    color: Color(0xCB000000),
                    offset: Offset(
                      0.0,
                      -12.0,
                    ),
                    spreadRadius: 0.0,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 34.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  _model.pageViewCurrentIndex == 0
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context).middleGray,
                                  FlutterFlowTheme.of(context).secondary,
                                ),
                                borderRadius: BorderRadius.circular(99.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  _model.pageViewCurrentIndex == 1
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context).middleGray,
                                  FlutterFlowTheme.of(context).middleGray,
                                ),
                                borderRadius: BorderRadius.circular(99.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  _model.pageViewCurrentIndex == 2
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context).middleGray,
                                  FlutterFlowTheme.of(context).middleGray,
                                ),
                                borderRadius: BorderRadius.circular(99.0),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: (_model.pageViewCurrentIndex == 0)
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'ONBOARDING_START_COMP_Back_ON_TAP');
                                      logFirebaseEvent('Back_haptic_feedback');
                                      HapticFeedback.selectionClick();
                                      logFirebaseEvent('Back_page_view');
                                      await _model.pageViewController
                                          ?.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                      logFirebaseEvent(
                                          'Back_rebuild_component');
                                      safeSetState(() {});
                                    },
                              text: valueOrDefault<String>(
                                'Back',
                                'Back',
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).middleGray,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.07,
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).middleGray,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                disabledTextColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ONBOARDING_START_COMP_next_ON_TAP');
                                logFirebaseEvent('next_haptic_feedback');
                                HapticFeedback.selectionClick();
                                if (_model.pageViewCurrentIndex < 2) {
                                  logFirebaseEvent('next_page_view');
                                  await _model.pageViewController?.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  logFirebaseEvent('next_rebuild_component');
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent('next_update_app_state');
                                  FFAppState().firstOpen = false;
                                  logFirebaseEvent('next_bottom_sheet');
                                  Navigator.pop(context);
                                }
                              },
                              text: valueOrDefault<String>(
                                _model.pageViewCurrentIndex < 2
                                    ? 'Next'
                                    : 'Finish',
                                'Next',
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  _model.pageViewCurrentIndex < 2
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context).secondary,
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: valueOrDefault<Color>(
                                        _model.pageViewCurrentIndex < 2
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context)
                                                .primary,
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
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
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
  }
}
