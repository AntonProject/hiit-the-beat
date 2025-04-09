import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_goal_dialog_model.dart';
export 'select_goal_dialog_model.dart';

class SelectGoalDialogWidget extends StatefulWidget {
  const SelectGoalDialogWidget({super.key});

  @override
  State<SelectGoalDialogWidget> createState() => _SelectGoalDialogWidgetState();
}

class _SelectGoalDialogWidgetState extends State<SelectGoalDialogWidget> {
  late SelectGoalDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectGoalDialogModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).middleGray,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'jz6n8pkd' /* Select goal */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 20.0,
                      letterSpacing: 0.07,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                      lineHeight: 1.4,
                    ),
              ),
              Builder(
                builder: (context) {
                  final goals = FFAppState().goalsList.map((e) => e).toList();

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(goals.length, (goalsIndex) {
                      final goalsItem = goals[goalsIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (goalsIndex > 0)
                            Divider(
                              height: 0.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).middleGray,
                            ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    valueOrDefault<String>(
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: goalsItem.titleEn,
                                        deText: goalsItem.titleDe,
                                      ),
                                      'Get more fit',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.07,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).middleGray,
                                  borderRadius: 60.0,
                                  borderWidth: 1.0,
                                  buttonSize: 28.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).middleGray,
                                  icon: Icon(
                                    Icons.circle_sharp,
                                    color: valueOrDefault<Color>(
                                      (FFAppState().goalEn ==
                                                  goalsItem.titleEn) ||
                                              (FFAppState().goalDe ==
                                                  goalsItem.titleDe)
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : FlutterFlowTheme.of(context)
                                              .middleGray,
                                      FlutterFlowTheme.of(context).middleGray,
                                    ),
                                    size: 12.0,
                                  ),
                                  onPressed: () async {
                                    HapticFeedback.mediumImpact();
                                    FFAppState().goalEn = goalsItem.titleEn;
                                    FFAppState().goalDe = goalsItem.titleDe;
                                    safeSetState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      );
                    })
                        .divide(SizedBox(height: 16.0))
                        .addToStart(SizedBox(height: 8.0))
                        .addToEnd(SizedBox(height: 8.0)),
                  );
                },
              ),
              FFButtonWidget(
                onPressed: () async {
                  HapticFeedback.selectionClick();
                  Navigator.pop(context);
                },
                text: FFLocalizations.of(context).getText(
                  'ahjzuukq' /* Confirm */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 14.0,
                        letterSpacing: 0.07,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                        lineHeight: 1.4,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).secondary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ]
                .divide(SizedBox(height: 16.0))
                .addToStart(SizedBox(height: 8.0))
                .addToEnd(SizedBox(height: 34.0)),
          ),
        ),
      ),
    );
  }
}
