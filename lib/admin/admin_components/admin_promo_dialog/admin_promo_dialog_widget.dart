import '/admin/admin_components/admin_promo_delete/admin_promo_delete_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_promo_dialog_model.dart';
export 'admin_promo_dialog_model.dart';

class AdminPromoDialogWidget extends StatefulWidget {
  const AdminPromoDialogWidget({
    super.key,
    required this.promo,
  });

  final PromoRecord? promo;

  @override
  State<AdminPromoDialogWidget> createState() => _AdminPromoDialogWidgetState();
}

class _AdminPromoDialogWidgetState extends State<AdminPromoDialogWidget> {
  late AdminPromoDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminPromoDialogModel());

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
              logFirebaseEvent('ADMIN_PROMO_DIALOG_COMP_Edit_ON_TAP');
              logFirebaseEvent('Edit_dismiss_dialog');
              Navigator.pop(context);
              logFirebaseEvent('Edit_navigate_to');

              context.pushNamed(
                AdminEditPromoWidget.routeName,
                queryParameters: {
                  'promo': serializeParam(
                    widget!.promo,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'promo': widget!.promo,
                  '__transition_info__': TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
            text: FFLocalizations.of(context).getText(
              'nl8ado3z' /* Edit */,
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
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).titleSmallIsCustom,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          Builder(
            builder: (context) => FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('ADMIN_PROMO_DIALOG_COMP_Delete_ON_TAP');
                logFirebaseEvent('Delete_dismiss_dialog');
                Navigator.pop(context);
                logFirebaseEvent('Delete_alert_dialog');
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: AdminPromoDeleteWidget(
                        promo: widget!.promo!,
                      ),
                    );
                  },
                );
              },
              text: FFLocalizations.of(context).getText(
                'zu58z2ce' /* Delete */,
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
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).titleSmallIsCustom,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
        ].addToStart(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
      ),
    );
  }
}
