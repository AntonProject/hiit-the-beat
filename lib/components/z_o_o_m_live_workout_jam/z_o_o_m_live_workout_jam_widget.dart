import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/payment_dialog/payment_dialog_widget.dart';
import '/components/skeleton/skeleton_homezoom/skeleton_homezoom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'z_o_o_m_live_workout_jam_model.dart';
export 'z_o_o_m_live_workout_jam_model.dart';

class ZOOMLiveWorkoutJamWidget extends StatefulWidget {
  const ZOOMLiveWorkoutJamWidget({super.key});

  @override
  State<ZOOMLiveWorkoutJamWidget> createState() =>
      _ZOOMLiveWorkoutJamWidgetState();
}

class _ZOOMLiveWorkoutJamWidgetState extends State<ZOOMLiveWorkoutJamWidget> {
  late ZOOMLiveWorkoutJamModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZOOMLiveWorkoutJamModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AdditionalsRecord>>(
      future: queryAdditionalsRecordOnce(
        queryBuilder: (additionalsRecord) => additionalsRecord
            .where(
              'type_index',
              isEqualTo: 3,
            )
            .orderBy('index'),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return SkeletonHomezoomWidget();
        }
        List<AdditionalsRecord> zOOMLiveWorkoutJamAdditionalsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final zOOMLiveWorkoutJamAdditionalsRecord =
            zOOMLiveWorkoutJamAdditionalsRecordList.isNotEmpty
                ? zOOMLiveWorkoutJamAdditionalsRecordList.first
                : null;

        return Container(
          width: double.infinity,
          height: 74.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).darkGray,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).darkGray,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent1,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent1,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Icon(
                      FFIcons.kcamera24,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'b7u7xmtu' /* ZOOM Live Workout Jam */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.07,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                              lineHeight: 1.4,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            dateTimeFormat(
                              "dd MMMM yyyy, h:mm a СЕТ",
                              functions.formatDateInCET(
                                  zOOMLiveWorkoutJamAdditionalsRecord!
                                      .datetime!),
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            '-',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.07,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                                lineHeight: 1.4,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    HapticFeedback.selectionClick();
                    if (!zOOMLiveWorkoutJamAdditionalsRecord.free) {
                      if (!valueOrDefault<bool>(
                          currentUserDocument?.plusmember, false)) {
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

                        return;
                      }
                    }
                    unawaited(
                      () async {
                        await launchURL(
                            zOOMLiveWorkoutJamAdditionalsRecord.linkURL);
                      }(),
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    'ff8izshk' /* Go! */,
                  ),
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).middleGray,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.07,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                          lineHeight: 1.4,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).middleGray,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        );
      },
    );
  }
}
