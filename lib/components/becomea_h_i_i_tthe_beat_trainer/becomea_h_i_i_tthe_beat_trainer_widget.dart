import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'becomea_h_i_i_tthe_beat_trainer_model.dart';
export 'becomea_h_i_i_tthe_beat_trainer_model.dart';

class BecomeaHIITtheBeatTrainerWidget extends StatefulWidget {
  const BecomeaHIITtheBeatTrainerWidget({super.key});

  @override
  State<BecomeaHIITtheBeatTrainerWidget> createState() =>
      _BecomeaHIITtheBeatTrainerWidgetState();
}

class _BecomeaHIITtheBeatTrainerWidgetState
    extends State<BecomeaHIITtheBeatTrainerWidget> {
  late BecomeaHIITtheBeatTrainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BecomeaHIITtheBeatTrainerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('BECOMEA_H_I_I_TTHE_BEAT_TRAINER_BecomeaH');
        logFirebaseEvent('BecomeaHIITtheBeatTrainer_haptic_feedbac');
        HapticFeedback.mediumImpact();
        logFirebaseEvent('BecomeaHIITtheBeatTrainer_launch_u_r_l');
        unawaited(
          () async {
            await launchURL(valueOrDefault<String>(
              FFLocalizations.of(context).getVariableText(
                enText: FFAppConstants.becometrainerURL,
                deText: FFAppConstants.becometrainerURLde,
                jaText: FFAppConstants.becometrainerJA,
              ),
              'https://trainer.hiit-the-beat.com/en-trainer',
            ));
          }(),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent1,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).accent1,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 17.0, 16.0, 17.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    FFIcons.krocket24,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'kbwea8f2' /* HIIT the Beat Pro Trainer */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.07,
                            fontWeight: FontWeight.w600,
                            lineHeight: 1.4,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'zh5yw60e' /* Click to learn more and start ... */,
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.07,
                              fontWeight: FontWeight.normal,
                              lineHeight: 1.4,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
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
    );
  }
}
