import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/log_out_dialog/log_out_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_nav_bar_model.dart';
export 'admin_nav_bar_model.dart';

class AdminNavBarWidget extends StatefulWidget {
  const AdminNavBarWidget({
    super.key,
    int? pageNum,
  }) : this.pageNum = pageNum ?? 1;

  final int pageNum;

  @override
  State<AdminNavBarWidget> createState() => _AdminNavBarWidgetState();
}

class _AdminNavBarWidgetState extends State<AdminNavBarWidget> {
  late AdminNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminNavBarModel());

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

    return Container(
      width: 200.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'ADMIN_NAV_BAR_COMP_Usermanagement_ON_TAP');
                      logFirebaseEvent('Usermanagement_navigate_to');

                      context.pushNamed(
                        AdminUserManagementWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'tick9btn' /* User management */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 70.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: valueOrDefault<Color>(
                              widget!.pageNum == 1
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context).gray,
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ADMIN_NAV_BAR_Seasonsworkouts_ON_TAP');
                      logFirebaseEvent('Seasonsworkouts_navigate_to');

                      context.pushNamed(
                        AdminSeasonsWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'drznubl9' /* Seasons & Workouts */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 60.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: valueOrDefault<Color>(
                              widget!.pageNum == 2
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context).gray,
                              FlutterFlowTheme.of(context).gray,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ADMIN_NAV_BAR_Warmupscooldowns_ON_TAP');
                      logFirebaseEvent('Warmupscooldowns_navigate_to');

                      context.pushNamed(
                        AdminAdditionalWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'm3gsbeo5' /* Warm Ups & Cool Downs */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 40.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: valueOrDefault<Color>(
                              widget!.pageNum == 3
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context).gray,
                              FlutterFlowTheme.of(context).gray,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  FutureBuilder<List<AdditionalsRecord>>(
                    future: FFAppState().zoom(
                      uniqueQueryKey: valueOrDefault<String>(
                        FFAppState().refreshDate?.toString(),
                        '0',
                      ),
                      requestFn: () => queryAdditionalsRecordOnce(
                        queryBuilder: (additionalsRecord) =>
                            additionalsRecord.where(Filter.or(
                          Filter(
                            'type_index',
                            isEqualTo: 3,
                          ),
                          Filter(
                            'type_index',
                            isEqualTo: 4,
                          ),
                        )),
                        limit: 2,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.transparent,
                              ),
                            ),
                          ),
                        );
                      }
                      List<AdditionalsRecord> zoomjamAdditionalsRecordList =
                          snapshot.data!;

                      return FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('ADMIN_NAV_BAR_COMP_Zoomjam_ON_TAP');
                          if (!(zoomjamAdditionalsRecordList
                              .where((e) => e.typeIndex == 3)
                              .toList()
                              .isNotEmpty)) {
                            logFirebaseEvent('Zoomjam_backend_call');

                            var additionalsRecordReference1 =
                                AdditionalsRecord.collection.doc();
                            await additionalsRecordReference1
                                .set(createAdditionalsRecordData(
                              typeIndex: 3,
                              index: 1,
                            ));
                            _model.zoomCreate =
                                AdditionalsRecord.getDocumentFromData(
                                    createAdditionalsRecordData(
                                      typeIndex: 3,
                                      index: 1,
                                    ),
                                    additionalsRecordReference1);
                          }
                          if (!(zoomjamAdditionalsRecordList
                              .where((e) => e.typeIndex == 4)
                              .toList()
                              .isNotEmpty)) {
                            logFirebaseEvent('Zoomjam_backend_call');

                            var additionalsRecordReference2 =
                                AdditionalsRecord.collection.doc();
                            await additionalsRecordReference2
                                .set(createAdditionalsRecordData(
                              typeIndex: 4,
                              index: 2,
                            ));
                            _model.zoomCreate2 =
                                AdditionalsRecord.getDocumentFromData(
                                    createAdditionalsRecordData(
                                      typeIndex: 4,
                                      index: 2,
                                    ),
                                    additionalsRecordReference2);
                          }
                          logFirebaseEvent('Zoomjam_firestore_query');
                          _model.queryAdditionals =
                              await queryAdditionalsRecordOnce(
                            queryBuilder: (additionalsRecord) =>
                                additionalsRecord.where(Filter.or(
                              Filter(
                                'type_index',
                                isEqualTo: 3,
                              ),
                              Filter(
                                'type_index',
                                isEqualTo: 4,
                              ),
                            )),
                            limit: 2,
                          );
                          logFirebaseEvent('Zoomjam_navigate_to');

                          context.pushNamed(
                            AdminZoomWidget.routeName,
                            queryParameters: {
                              'zoom': serializeParam(
                                _model.queryAdditionals
                                    ?.where((e) => e.typeIndex == 3)
                                    .toList()
                                    ?.firstOrNull,
                                ParamType.Document,
                              ),
                              'zoom2': serializeParam(
                                _model.queryAdditionals
                                    ?.where((e) => e.typeIndex == 4)
                                    .toList()
                                    ?.firstOrNull,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'zoom': _model.queryAdditionals
                                  ?.where((e) => e.typeIndex == 3)
                                  .toList()
                                  ?.firstOrNull,
                              'zoom2': _model.queryAdditionals
                                  ?.where((e) => e.typeIndex == 4)
                                  .toList()
                                  ?.firstOrNull,
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          logFirebaseEvent('Zoomjam_update_app_state');
                          FFAppState().refreshDate = getCurrentTimestamp;
                          safeSetState(() {});
                          logFirebaseEvent('Zoomjam_clear_query_cache');
                          FFAppState().clearZoomCache();

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'zzsj42bs' /* Zoom jam */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 120.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: valueOrDefault<Color>(
                                  widget!.pageNum == 4
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).gray,
                                  FlutterFlowTheme.of(context).gray,
                                ),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleSmallIsCustom,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      );
                    },
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ADMIN_NAV_BAR_COMP_Promocodes_ON_TAP');
                      logFirebaseEvent('Promocodes_navigate_to');

                      context.pushNamed(
                        AdminPromoWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'pri1d38w' /* Promocodes */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 100.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: valueOrDefault<Color>(
                              widget!.pageNum == 5
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context).gray,
                              FlutterFlowTheme.of(context).gray,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ADMIN_NAV_BAR_COMP_videos_ON_TAP');
                      logFirebaseEvent('videos_navigate_to');

                      context.pushNamed(
                        AdminBannersWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'nxkzh44m' /* Home page banner */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 55.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: valueOrDefault<Color>(
                              widget!.pageNum == 6
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context).gray,
                              FlutterFlowTheme.of(context).gray,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADMIN_NAV_BAR_COMP_Settings_ON_TAP');
                    logFirebaseEvent('Settings_navigate_to');

                    context.pushNamed(
                      AdminSettingsWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    '4dqayonk' /* Settings */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 125.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: valueOrDefault<Color>(
                            widget!.pageNum == 7
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context).gray,
                            FlutterFlowTheme.of(context).gray,
                          ),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADMIN_NAV_BAR_COMP_Logout_ON_TAP');
                    logFirebaseEvent('Logout_bottom_sheet');
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: LogOutDialogWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  text: FFLocalizations.of(context).getText(
                    '4uzwmty6' /* Log out */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 130.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: valueOrDefault<Color>(
                            widget!.pageNum == 8
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context).gray,
                            FlutterFlowTheme.of(context).gray,
                          ),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
