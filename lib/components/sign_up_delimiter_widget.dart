import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_delimiter_model.dart';
export 'sign_up_delimiter_model.dart';

class SignUpDelimiterWidget extends StatefulWidget {
  const SignUpDelimiterWidget({super.key});

  @override
  State<SignUpDelimiterWidget> createState() => _SignUpDelimiterWidgetState();
}

class _SignUpDelimiterWidgetState extends State<SignUpDelimiterWidget> {
  late SignUpDelimiterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpDelimiterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: Color(0xFF2E2E2E),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '0arxbgom' /* Or with email */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: Color(0xFF777777),
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
          ),
          Flexible(
            child: Container(
              width: double.infinity,
              height: 1.0,
              decoration: BoxDecoration(
                color: Color(0xFF2E2E2E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
