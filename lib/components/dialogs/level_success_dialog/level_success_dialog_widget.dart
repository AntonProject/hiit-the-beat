import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'level_success_dialog_model.dart';
export 'level_success_dialog_model.dart';

class LevelSuccessDialogWidget extends StatefulWidget {
  const LevelSuccessDialogWidget({super.key});

  @override
  State<LevelSuccessDialogWidget> createState() =>
      _LevelSuccessDialogWidgetState();
}

class _LevelSuccessDialogWidgetState extends State<LevelSuccessDialogWidget>
    with TickerProviderStateMixin {
  late LevelSuccessDialogModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LevelSuccessDialogModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: FutureBuilder<List<ProgressRecord>>(
        future: queryProgressRecordOnce(
          queryBuilder: (progressRecord) => progressRecord.where(
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
          List<ProgressRecord> containerProgressRecordList = snapshot.data!;
          final containerProgressRecord = containerProgressRecordList.isNotEmpty
              ? containerProgressRecordList.first
              : null;

          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Frame_1000006825.png',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 36.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF9C244C), Color(0xFF2883AE)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/Frame123123.png',
                                    ).image,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: AutoSizeText(
                              'LEVEL ${functions.levelUser(valueOrDefault<int>(
                                    functions.totalPoints(
                                        containerProgressRecord?.workoutDone
                                            ?.toList()),
                                    0,
                                  ), functions.levels().toList()).levelNumber.toString()} / ${functions.levelUser(valueOrDefault<int>(
                                    functions.totalPoints(
                                        containerProgressRecord?.workoutDone
                                            ?.toList()),
                                    0,
                                  ), functions.levels().toList()).levenName} ACHIEVED!',
                              textAlign: TextAlign.center,
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
                          AutoSizeText(
                            '${valueOrDefault<String>(
                              FFLocalizations.of(context).getVariableText(
                                enText: 'You now have ',
                                deText: 'Sie haben jetzt ',
                                jaText: 'あなたは今 ',
                              ),
                              'You now have ',
                            )}${functions.totalPoints(containerProgressRecord?.workoutDone?.toList()).toString()}${valueOrDefault<String>(
                              FFLocalizations.of(context).getVariableText(
                                enText:
                                    ' points. Keep up the good work Keep up the good work',
                                deText: ' Punkte. Weiter so',
                                jaText: ' ポイント。頑張ってください',
                              ),
                              ' points.',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.07,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.4,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ]
                            .divide(SizedBox(height: 12.0))
                            .addToStart(SizedBox(height: 24.0)),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 32.0, 16.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'LEVEL_SUCCESS_DIALOG_COMP_LetsGo_ON_TAP');
                            logFirebaseEvent('LetsGo_haptic_feedback');
                            HapticFeedback.selectionClick();
                            logFirebaseEvent('LetsGo_bottom_sheet');
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'nbr26oj0' /* Done */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.07,
                                  lineHeight: 1.4,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].addToEnd(SizedBox(height: 34.0)),
            ),
          );
        },
      ),
    );
  }
}
