import '/admin/admin_components/admin_addit_delete/admin_addit_delete_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_additional_dialog_model.dart';
export 'admin_additional_dialog_model.dart';

class AdminAdditionalDialogWidget extends StatefulWidget {
  const AdminAdditionalDialogWidget({
    super.key,
    required this.addit,
  });

  final AdditionalsRecord? addit;

  @override
  State<AdminAdditionalDialogWidget> createState() =>
      _AdminAdditionalDialogWidgetState();
}

class _AdminAdditionalDialogWidgetState
    extends State<AdminAdditionalDialogWidget> {
  late AdminAdditionalDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminAdditionalDialogModel());

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
      width: 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FFButtonWidget(
            onPressed: () async {
              Navigator.pop(context);

              context.pushNamed(
                AdminEditAdditWidget.routeName,
                queryParameters: {
                  'addit': serializeParam(
                    widget.addit,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'addit': widget.addit,
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
            text: FFLocalizations.of(context).getText(
              '3t18wf8v' /* Edit */,
            ),
            options: FFButtonOptions(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 50.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              Navigator.pop(context);
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: AdminAdditDeleteWidget(
                      add: widget.addit!,
                      type: valueOrDefault<int>(
                        widget.addit?.typeIndex,
                        1,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            text: FFLocalizations.of(context).getText(
              'yxv1s5km' /* Delete */,
            ),
            options: FFButtonOptions(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 35.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ].addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
      ),
    );
  }
}
