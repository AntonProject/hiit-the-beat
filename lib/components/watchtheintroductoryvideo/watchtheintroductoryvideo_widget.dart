import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/skeleton/skeleton_homezoom/skeleton_homezoom_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'watchtheintroductoryvideo_model.dart';
export 'watchtheintroductoryvideo_model.dart';

class WatchtheintroductoryvideoWidget extends StatefulWidget {
  const WatchtheintroductoryvideoWidget({super.key});

  @override
  State<WatchtheintroductoryvideoWidget> createState() =>
      _WatchtheintroductoryvideoWidgetState();
}

class _WatchtheintroductoryvideoWidgetState
    extends State<WatchtheintroductoryvideoWidget> {
  late WatchtheintroductoryvideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchtheintroductoryvideoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: !FFAppState().hideBanners.contains('watch'),
      child: FutureBuilder<List<VideosRecord>>(
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
          List<VideosRecord> watchtheintroductoryvideoVideosRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final watchtheintroductoryvideoVideosRecord =
              watchtheintroductoryvideoVideosRecordList.isNotEmpty
                  ? watchtheintroductoryvideoVideosRecordList.first
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
                        watchtheintroductoryvideoVideosRecord?.videoUrlEn,
                        ParamType.String,
                      ),
                      'videoDe': serializeParam(
                        watchtheintroductoryvideoVideosRecord?.videoUrlDe,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                }(),
              );

              await watchtheintroductoryvideoVideosRecord!.reference.update({
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
                color: FlutterFlowTheme.of(context).primaryBackground,
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
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).red,
                        ),
                      ),
                      child: Icon(
                        FFIcons.kvideo24,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '6exvv6ta' /* Watch the introductory video */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.07,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                  lineHeight: 1.4,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'yhmws86v' /* We’ll tell you more about the ... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).gray,
                                    fontSize: 12.0,
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
                        ],
                      ),
                    ),
                    if (currentUserEmail != '')
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).middleGray,
                        borderRadius: 12.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).middleGray,
                        icon: Icon(
                          FFIcons.kclose24,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          FFAppState().addToHideBanners('watch');
                          safeSetState(() {});
                        },
                      ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
