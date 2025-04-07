import '/backend/backend.dart';
import '/components/additional_comp_dialog/additional_comp_dialog_widget.dart';
import '/components/skeleton/skeleton_add_comp_list/skeleton_add_comp_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_warm_up_cool_down_dialog_model.dart';
export 'select_warm_up_cool_down_dialog_model.dart';

class SelectWarmUpCoolDownDialogWidget extends StatefulWidget {
  const SelectWarmUpCoolDownDialogWidget({
    super.key,
    int? type,
    required this.workout,
  }) : this.type = type ?? 1;

  final int type;
  final WorkoutsRecord? workout;

  @override
  State<SelectWarmUpCoolDownDialogWidget> createState() =>
      _SelectWarmUpCoolDownDialogWidgetState();
}

class _SelectWarmUpCoolDownDialogWidgetState
    extends State<SelectWarmUpCoolDownDialogWidget> {
  late SelectWarmUpCoolDownDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectWarmUpCoolDownDialogModel());

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
              if (widget.type == 1)
                Text(
                  FFLocalizations.of(context).getText(
                    'mm1w2qr0' /* Select Warm Up */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.07,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                        lineHeight: 1.4,
                      ),
                ),
              if (widget.type == 2)
                Text(
                  FFLocalizations.of(context).getText(
                    '5dn60aaw' /* Select Cool Down */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.07,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                        lineHeight: 1.4,
                      ),
                ),
              StreamBuilder<List<AdditionalsRecord>>(
                stream: queryAdditionalsRecord(
                  queryBuilder: (additionalsRecord) => additionalsRecord
                      .where(
                        'type_index',
                        isEqualTo: widget.type,
                      )
                      .orderBy('index'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return SkeletonAddCompListWidget();
                  }
                  List<AdditionalsRecord> containerAdditionalsRecordList =
                      snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final containerVar = containerAdditionalsRecordList
                            .where((e) =>
                                FFLocalizations.of(context).languageCode == 'en'
                                    ? (e.en || (e.en && e.de))
                                    : (e.de || (e.en && e.de)))
                            .toList();

                        return ListView.separated(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            8.0,
                            0,
                            8.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: containerVar.length,
                          separatorBuilder: (_, __) => SizedBox(height: 8.0),
                          itemBuilder: (context, containerVarIndex) {
                            final containerVarItem =
                                containerVar[containerVarIndex];
                            return wrapWithModel(
                              model: _model.additionalCompDialogModels.getModel(
                                containerVarItem.reference.id,
                                containerVarIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: AdditionalCompDialogWidget(
                                key: Key(
                                  'Keyzyy_${containerVarItem.reference.id}',
                                ),
                                addit: containerVarItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              FFButtonWidget(
                onPressed: () async {
                  HapticFeedback.selectionClick();
                  Navigator.pop(context);
                },
                text: FFLocalizations.of(context).getText(
                  '2avtfd0j' /* Close */,
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
