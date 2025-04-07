import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_season_dialog_model.dart';
export 'filter_season_dialog_model.dart';

class FilterSeasonDialogWidget extends StatefulWidget {
  const FilterSeasonDialogWidget({super.key});

  @override
  State<FilterSeasonDialogWidget> createState() =>
      _FilterSeasonDialogWidgetState();
}

class _FilterSeasonDialogWidgetState extends State<FilterSeasonDialogWidget> {
  late FilterSeasonDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterSeasonDialogModel());

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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'pc4fuj50' /* Which seasons to show? */,
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
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'mt480vnq' /* Some seasons are only availabl... */,
                ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).gray,
                      letterSpacing: 0.07,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                      lineHeight: 1.4,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().hideCompleted =
                        !(FFAppState().hideCompleted ?? true);
                    FFAppState().update(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).middleGray,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'inhsm2oq' /* Hide completed seasons and wor... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                    lineHeight: 1.4,
                                  ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().hideCompleted =
                                  !(FFAppState().hideCompleted ?? true);
                              safeSetState(() {});
                            },
                            child: Container(
                              width: 28.0,
                              height: 28.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().hideCompleted
                                      ? FlutterFlowTheme.of(context).middleGray
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).middleGray,
                                ),
                              ),
                              child: Visibility(
                                visible: FFAppState().hideCompleted,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    FFIcons.kcheckmark24,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      HapticFeedback.mediumImpact();
                      FFAppState().seasonFilter = 'all';
                      safeSetState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'z2v0b8ui' /* All */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                    lineHeight: 1.4,
                                  ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).middleGray,
                            borderRadius: 60.0,
                            borderWidth: 1.0,
                            buttonSize: 28.0,
                            fillColor: FlutterFlowTheme.of(context).middleGray,
                            icon: Icon(
                              Icons.circle_sharp,
                              color: valueOrDefault<Color>(
                                FFAppState().seasonFilter == 'all'
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).middleGray,
                                FlutterFlowTheme.of(context).middleGray,
                              ),
                              size: 12.0,
                            ),
                            onPressed: () async {
                              HapticFeedback.mediumImpact();
                              FFAppState().seasonFilter = 'all';
                              safeSetState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).middleGray,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      HapticFeedback.mediumImpact();
                      FFAppState().seasonFilter = 'en';
                      safeSetState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'qxe5c348' /* Only EN */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                    lineHeight: 1.4,
                                  ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).middleGray,
                            borderRadius: 60.0,
                            borderWidth: 1.0,
                            buttonSize: 28.0,
                            fillColor: FlutterFlowTheme.of(context).middleGray,
                            icon: Icon(
                              Icons.circle_sharp,
                              color: valueOrDefault<Color>(
                                FFAppState().seasonFilter == 'en'
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).middleGray,
                                FlutterFlowTheme.of(context).middleGray,
                              ),
                              size: 12.0,
                            ),
                            onPressed: () async {
                              HapticFeedback.mediumImpact();
                              FFAppState().seasonFilter = 'en';
                              safeSetState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).middleGray,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      HapticFeedback.mediumImpact();
                      FFAppState().seasonFilter = 'de';
                      safeSetState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '84rjp4gu' /* Only DE */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                    lineHeight: 1.4,
                                  ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).middleGray,
                            borderRadius: 60.0,
                            borderWidth: 1.0,
                            buttonSize: 28.0,
                            fillColor: FlutterFlowTheme.of(context).middleGray,
                            icon: Icon(
                              Icons.circle_sharp,
                              color: valueOrDefault<Color>(
                                FFAppState().seasonFilter == 'de'
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).middleGray,
                                FlutterFlowTheme.of(context).middleGray,
                              ),
                              size: 12.0,
                            ),
                            onPressed: () async {
                              HapticFeedback.mediumImpact();
                              FFAppState().seasonFilter = 'de';
                              safeSetState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 16.0))
                    .addToStart(SizedBox(height: 16.0))
                    .addToEnd(SizedBox(height: 8.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    HapticFeedback.selectionClick();
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'nzropwt1' /* Let’s Go */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
              ),
            ]
                .divide(SizedBox(height: 8.0))
                .addToStart(SizedBox(height: 8.0))
                .addToEnd(SizedBox(height: 34.0)),
          ),
        ),
      ),
    );
  }
}
