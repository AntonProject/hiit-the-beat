import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'language_select_dialog_model.dart';
export 'language_select_dialog_model.dart';

class LanguageSelectDialogWidget extends StatefulWidget {
  const LanguageSelectDialogWidget({super.key});

  @override
  State<LanguageSelectDialogWidget> createState() =>
      _LanguageSelectDialogWidgetState();
}

class _LanguageSelectDialogWidgetState
    extends State<LanguageSelectDialogWidget> {
  late LanguageSelectDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguageSelectDialogModel());

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
        logFirebaseEvent('LANGUAGE_SELECT_DIALOG_Column_qf8h6njs_O');
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
                              'LANGUAGE_SELECT_DIALOG_Container_3brmelu');
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          't7llkirb' /* Select language */,
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
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'LANGUAGE_SELECT_DIALOG_English_ON_TAP');
                          logFirebaseEvent('English_haptic_feedback');
                          HapticFeedback.selectionClick();
                          logFirebaseEvent('English_set_app_language');
                          setAppLanguage(context, 'en');
                          logFirebaseEvent('English_update_app_state');
                          FFAppState().seasonFilter = 'en';
                          FFAppState().update(() {});
                          logFirebaseEvent('English_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            language: 'en',
                          ));
                          logFirebaseEvent('English_bottom_sheet');
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'wacxmizm' /* English */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.07,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.4,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                              Container(
                                width: 32.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).ukFlag,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/Element.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 32.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).middleGray,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'LANGUAGE_SELECT_DIALOG_Deutsch_ON_TAP');
                        logFirebaseEvent('Deutsch_haptic_feedback');
                        HapticFeedback.selectionClick();
                        logFirebaseEvent('Deutsch_set_app_language');
                        setAppLanguage(context, 'de');
                        logFirebaseEvent('Deutsch_update_app_state');
                        FFAppState().seasonFilter = 'de';
                        FFAppState().update(() {});
                        logFirebaseEvent('Deutsch_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          language: 'de',
                        ));
                        logFirebaseEvent('Deutsch_bottom_sheet');
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'yv7searm' /* Deutsch */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.07,
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                            Container(
                              width: 32.0,
                              height: 26.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Rounded.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (getRemoteConfigBool('showJapan'))
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).middleGray,
                      ),
                    if (getRemoteConfigBool('showJapan'))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'LANGUAGE_SELECT_DIALOG_Japanese_ON_TAP');
                          logFirebaseEvent('Japanese_haptic_feedback');
                          HapticFeedback.selectionClick();
                          logFirebaseEvent('Japanese_set_app_language');
                          setAppLanguage(context, 'ja');
                          logFirebaseEvent('Japanese_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            language: 'ja',
                          ));
                          logFirebaseEvent('Japanese_bottom_sheet');
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'bvm5p0h8' /* Japanese */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.07,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.4,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                              Container(
                                width: 32.0,
                                height: 26.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/Flag_of_Japan.svg.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ]
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
