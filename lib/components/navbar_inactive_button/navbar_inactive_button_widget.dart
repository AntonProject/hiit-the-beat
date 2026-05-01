import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_inactive_button_model.dart';
export 'navbar_inactive_button_model.dart';

class NavbarInactiveButtonWidget extends StatefulWidget {
  const NavbarInactiveButtonWidget({
    super.key,
    required this.icon,
    required this.action,
  });

  final Widget? icon;
  final Future Function()? action;

  @override
  State<NavbarInactiveButtonWidget> createState() =>
      _NavbarInactiveButtonWidgetState();
}

class _NavbarInactiveButtonWidgetState
    extends State<NavbarInactiveButtonWidget> {
  late NavbarInactiveButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarInactiveButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 16.0,
      buttonSize: 44.0,
      fillColor: FlutterFlowTheme.of(context).alternate,
      icon: widget!.icon!,
      onPressed: () async {
        logFirebaseEvent('NAVBAR_INACTIVE_BUTTON_homeIconButton_ON');
        logFirebaseEvent('homeIconButton_execute_callback');
        await widget.action?.call();
      },
    );
  }
}
