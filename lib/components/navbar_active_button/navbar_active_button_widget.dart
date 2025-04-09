import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar_active_button_model.dart';
export 'navbar_active_button_model.dart';

class NavbarActiveButtonWidget extends StatefulWidget {
  const NavbarActiveButtonWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final Widget? icon;
  final String? text;

  @override
  State<NavbarActiveButtonWidget> createState() =>
      _NavbarActiveButtonWidgetState();
}

class _NavbarActiveButtonWidgetState extends State<NavbarActiveButtonWidget> {
  late NavbarActiveButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarActiveButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('homeButton pressed ...');
      },
      text: widget.text!,
      icon: widget.icon,
      options: FFButtonOptions(
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color: Colors.white,
              fontSize: 12.0,
              letterSpacing: 0.07,
              fontWeight: FontWeight.w500,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
              lineHeight: 1.4,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
