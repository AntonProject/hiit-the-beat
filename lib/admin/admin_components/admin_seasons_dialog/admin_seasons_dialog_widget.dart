import '/admin/admin_components/admin_season_delete/admin_season_delete_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_seasons_dialog_model.dart';
export 'admin_seasons_dialog_model.dart';

class AdminSeasonsDialogWidget extends StatefulWidget {
  const AdminSeasonsDialogWidget({
    super.key,
    required this.season,
  });

  final SeasonsRecord? season;

  @override
  State<AdminSeasonsDialogWidget> createState() =>
      _AdminSeasonsDialogWidgetState();
}

class _AdminSeasonsDialogWidgetState extends State<AdminSeasonsDialogWidget> {
  late AdminSeasonsDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminSeasonsDialogModel());

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
                AdminEditSeasonWidget.routeName,
                queryParameters: {
                  'season': serializeParam(
                    widget.season,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'season': widget.season,
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
            text: FFLocalizations.of(context).getText(
              'znof1dn9' /* Edit */,
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
                    child: AdminSeasonDeleteWidget(
                      season: widget.season!,
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            text: FFLocalizations.of(context).getText(
              '5sfhq8hv' /* Delete */,
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
