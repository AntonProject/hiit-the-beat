import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_goal_dialog_model.dart';
export 'select_goal_dialog_model.dart';

class SelectGoalDialogWidget extends StatefulWidget {
  const SelectGoalDialogWidget({
    super.key,
    this.update,
    this.goalDe,
    this.goalEn,
    this.goalJa,
  });

  final Future Function(String? de, String? en, String? ja)? update;
  final String? goalDe;
  final String? goalEn;
  final String? goalJa;

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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SELECT_GOAL_DIALOG_SelectGoalDialog_ON_I');
      logFirebaseEvent('SelectGoalDialog_update_component_state');
      _model.goalJaState = widget!.goalJa;
      _model.goalDeState = widget!.goalDe;
      _model.goalEnState = widget!.goalEn;
      safeSetState(() {});
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
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('SELECT_GOAL_DIALOG_Column_5o1m8uww_ON_TA');
        logFirebaseEvent('Column_bottom_sheet');
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
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
                          logFirebaseEvent(
                              'SELECT_GOAL_DIALOG_Container_7ly32dnm_ON');
                          logFirebaseEvent('Container_bottom_sheet');
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
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 20.0,
                            letterSpacing: 0.07,
                            fontWeight: FontWeight.bold,
                            lineHeight: 1.4,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                    Builder(
                      builder: (context) {
                        final goals =
                            FFAppState().goalsList.map((e) => e).toList();

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
                                    color:
                                        FlutterFlowTheme.of(context).middleGray,
                                  ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SELECT_GOAL_DIALOG_Row_p86xv3mm_ON_TAP');
                                      logFirebaseEvent('Row_haptic_feedback');
                                      HapticFeedback.mediumImpact();
                                      logFirebaseEvent('Row_execute_callback');
                                      unawaited(
                                        () async {}(),
                                      );
                                      logFirebaseEvent(
                                          'Row_update_component_state');
                                      _model.goalJaState = goalsItem.titleJa;
                                      _model.goalDeState = goalsItem.titleDe;
                                      _model.goalEnState = goalsItem.titleEn;
                                      safeSetState(() {});
                                    },
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
                                                jaText: goalsItem.titleJa,
                                              ),
                                              'Get more fit',
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
                                                  lineHeight: 1.4,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.circle_sharp,
                                          color: valueOrDefault<Color>(
                                            (_model.goalEnState ==
                                                        goalsItem.titleEn) &&
                                                    (_model.goalDeState ==
                                                        goalsItem.titleDe) &&
                                                    (_model.goalJaState ==
                                                        goalsItem.titleJa)
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .middleGray,
                                            FlutterFlowTheme.of(context)
                                                .middleGray,
                                          ),
                                          size: 28.0,
                                        ),
                                      ],
                                    ),
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
                        logFirebaseEvent(
                            'SELECT_GOAL_DIALOG_COMP_Confirm_ON_TAP');
                        logFirebaseEvent('Confirm_haptic_feedback');
                        HapticFeedback.selectionClick();
                        logFirebaseEvent('Confirm_execute_callback');
                        unawaited(
                          () async {
                            await widget.update?.call(
                              _model.goalDeState,
                              _model.goalEnState,
                              _model.goalJaState,
                            );
                          }(),
                        );
                        logFirebaseEvent('Confirm_bottom_sheet');
                        Navigator.pop(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        'ahjzuukq' /* Confirm */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
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
                  ]
                      .divide(SizedBox(height: 16.0))
                      .addToStart(SizedBox(height: 8.0))
                      .addToEnd(SizedBox(height: 34.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
