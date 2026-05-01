import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_menu_option_model.dart';
export 'profile_menu_option_model.dart';

class ProfileMenuOptionWidget extends StatefulWidget {
  const ProfileMenuOptionWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.action,
  });

  final Widget? icon;
  final String? text;
  final Future Function()? action;

  @override
  State<ProfileMenuOptionWidget> createState() =>
      _ProfileMenuOptionWidgetState();
}

class _ProfileMenuOptionWidgetState extends State<ProfileMenuOptionWidget> {
  late ProfileMenuOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileMenuOptionModel());

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
        logFirebaseEvent('PROFILE_MENU_OPTION_Container_5ucpcspn_O');
        logFirebaseEvent('Container_execute_callback');
        await widget.action?.call();
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            widget!.icon!,
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  widget!.text,
                  '-',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.07,
                      lineHeight: 1.4,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
