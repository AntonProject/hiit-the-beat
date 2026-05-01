import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/payment_dialog/payment_dialog_widget.dart';
import '/components/dialogs/payment_dialog_start/payment_dialog_start_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'season_comp_model.dart';
export 'season_comp_model.dart';

class SeasonCompWidget extends StatefulWidget {
  const SeasonCompWidget({
    super.key,
    required this.season,
    int? index,
  }) : this.index = index ?? 0;

  final SeasonsRecord? season;
  final int index;

  @override
  State<SeasonCompWidget> createState() => _SeasonCompWidgetState();
}

class _SeasonCompWidgetState extends State<SeasonCompWidget> {
  late SeasonCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeasonCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: queryWorkoutsRecordCount(
        queryBuilder: (workoutsRecord) => workoutsRecord.where(
          'season_id',
          isEqualTo: widget!.season?.reference.id,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).green,
                size: 20.0,
              ),
            ),
          );
        }
        int containerCount = snapshot.data!;

        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('SEASON_Container_ogdf2y0x_ON_TAP');
            logFirebaseEvent('Container_haptic_feedback');
            HapticFeedback.mediumImpact();
            if (currentUserEmail != null && currentUserEmail != '') {
              if (widget!.season!.free) {
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed(
                  SeasonPageWidget.routeName,
                  queryParameters: {
                    'season': serializeParam(
                      widget!.season,
                      ParamType.Document,
                    ),
                    'workoutCount': serializeParam(
                      containerCount,
                      ParamType.int,
                    ),
                    'seasonIndex': serializeParam(
                      valueOrDefault<int>(
                        widget!.index,
                        0,
                      ),
                      ParamType.int,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'season': widget!.season,
                  },
                );
              } else {
                if (valueOrDefault<bool>(
                        currentUserDocument?.plusmember, false) ==
                    false) {
                  logFirebaseEvent('Container_bottom_sheet');
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: PaymentDialogWidget(),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                } else {
                  logFirebaseEvent('Container_bottom_sheet');
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: PaymentDialogStartWidget(),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                }
              }
            } else {
              logFirebaseEvent('Container_haptic_feedback');
              HapticFeedback.vibrate();
              logFirebaseEvent('Container_bottom_sheet');
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: GuestDialogWidget(),
                  );
                },
              ).then((value) => safeSetState(() {}));
            }
          },
          child: Container(
            width: 179.0,
            height: 72.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 16.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 32.0,
                    child: VerticalDivider(
                      width: 2.0,
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    FFLocalizations.of(context).getVariableText(
                                      enText: valueOrDefault<String>(
                                        widget!.season?.titleEn,
                                        '-',
                                      ),
                                      deText: valueOrDefault<String>(
                                        widget!.season?.titleDe,
                                        '-',
                                      ),
                                      jaText: widget!.season?.titleJa,
                                    ),
                                    '-',
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
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      formatNumber(
                                        containerCount,
                                        formatType: FormatType.custom,
                                        format: '0 ',
                                        locale: '',
                                      ),
                                      '1 ',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                          fontSize: 12.0,
                                          letterSpacing: 0.07,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.4,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'ku2u1aem' /* Workouts */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                          fontSize: 12.0,
                                          letterSpacing: 0.07,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.4,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'bcbfylss' /*  ~  */,
                                    ),
                                    style: GoogleFonts.urbanist(
                                      color: FlutterFlowTheme.of(context).gray,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.0,
                                      height: 1.4,
                                    ),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: widget!.season?.duration,
                                        deText: widget!.season?.durationDe,
                                        jaText: widget!.season?.durationJa,
                                      ),
                                      '-',
                                    ),
                                    style: GoogleFonts.urbanist(
                                      color: FlutterFlowTheme.of(context).gray,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.0,
                                      height: 1.4,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
