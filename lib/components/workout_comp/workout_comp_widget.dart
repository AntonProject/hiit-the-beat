import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/payment_dialog/payment_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workout_comp_model.dart';
export 'workout_comp_model.dart';

class WorkoutCompWidget extends StatefulWidget {
  const WorkoutCompWidget({
    super.key,
    required this.workout,
    required this.season,
    required this.progress,
    int? workoutCount,
    int? indexWork,
    int? seasonIndex,
    int? selectedLvl,
  })  : this.workoutCount = workoutCount ?? 0,
        this.indexWork = indexWork ?? 0,
        this.seasonIndex = seasonIndex ?? 0,
        this.selectedLvl = selectedLvl ?? 1;

  final WorkoutsRecord? workout;
  final SeasonsRecord? season;
  final ProgressRecord? progress;
  final int workoutCount;
  final int indexWork;
  final int seasonIndex;
  final int selectedLvl;

  @override
  State<WorkoutCompWidget> createState() => _WorkoutCompWidgetState();
}

class _WorkoutCompWidgetState extends State<WorkoutCompWidget> {
  late WorkoutCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('WORKOUT_Container_v676g55u_ON_TAP');
            logFirebaseEvent('Container_haptic_feedback');
            HapticFeedback.mediumImpact();
            if (!valueOrDefault<bool>(currentUserDocument?.plusmember, false)) {
              if (currentUserEmail != null && currentUserEmail != '') {
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

                return;
              } else {
                if (widget!.progress!.workoutDone.length >= 2) {
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

                  return;
                }
              }
            }
            logFirebaseEvent('Container_navigate_to');
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed(
              WorkoutPageWidget.routeName,
              queryParameters: {
                'season': serializeParam(
                  widget!.season,
                  ParamType.Document,
                ),
                'workout': serializeParam(
                  widget!.workout,
                  ParamType.Document,
                ),
                'workoutCount': serializeParam(
                  widget!.workoutCount,
                  ParamType.int,
                ),
                'indexInList': serializeParam(
                  valueOrDefault<int>(
                    widget!.indexWork,
                    0,
                  ),
                  ParamType.int,
                ),
                'progress': serializeParam(
                  widget!.progress?.reference,
                  ParamType.DocumentReference,
                ),
                'seasonIndex': serializeParam(
                  valueOrDefault<int>(
                    widget!.seasonIndex,
                    0,
                  ),
                  ParamType.int,
                ),
                'selectedLvl': serializeParam(
                  valueOrDefault<int>(
                    widget!.selectedLvl,
                    1,
                  ),
                  ParamType.int,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'season': widget!.season,
                'workout': widget!.workout,
              },
            );
          },
          child: Material(
            color: Colors.transparent,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.25,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).darkGray,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    valueOrDefault<String>(
                      widget!.workout?.cover,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/breakletics-owe5sa/assets/o1n536747tpd/image555.webp',
                    ),
                  ),
                ),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).darkGray,
                  width: 0.0,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          FlutterFlowTheme.of(context).primary
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    '${valueOrDefault<String>(
                                      formatNumber(
                                        widget!.indexWork + 1,
                                        formatType: FormatType.custom,
                                        format: '0. ',
                                        locale: '',
                                      ),
                                      '1. ',
                                    )}${valueOrDefault<String>(
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: widget!.workout?.titleEn,
                                        deText: widget!.workout?.titleDe,
                                        jaText: widget!.workout?.titleJa,
                                      ),
                                      'Fit Fusion',
                                    )}',
                                    '1. Fit Fusion',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 16.0,
                                        letterSpacing: 0.07,
                                        fontWeight: FontWeight.bold,
                                        lineHeight: 1.4,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                              if ((widget!.workout?.duration != null &&
                                      widget!.workout?.duration != '') ||
                                  (widget!.workout?.durationDe != null &&
                                      widget!.workout?.durationDe != '') ||
                                  (widget!.workout?.durationJa != null &&
                                      widget!.workout?.durationJa != ''))
                                Text(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: widget!.workout?.duration,
                                    deText: widget!.workout?.durationDe,
                                    jaText: widget!.workout?.durationJa,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.07,
                                        lineHeight: 1.4,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                            ].divide(SizedBox(width: 7.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          widget!.progress!.workoutDone
                                                      .where((e) =>
                                                          e.workoutId ==
                                                          widget!.workout
                                                              ?.reference.id)
                                                      .toList()
                                                      .length >=
                                                  1
                                              ? FlutterFlowTheme.of(context)
                                                  .darkGreen
                                              : Colors.transparent,
                                          FlutterFlowTheme.of(context)
                                              .darkGreen,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                        ),
                                      ),
                                      child: Visibility(
                                        visible: widget!.progress!.workoutDone
                                                .where((e) =>
                                                    e.workoutId ==
                                                    widget!
                                                        .workout?.reference.id)
                                                .toList()
                                                .length >=
                                            1,
                                        child: Icon(
                                          FFIcons.kplusmember24,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          widget!.progress!.workoutDone
                                                      .where((e) =>
                                                          e.workoutId ==
                                                          widget!.workout
                                                              ?.reference.id)
                                                      .toList()
                                                      .length >=
                                                  2
                                              ? FlutterFlowTheme.of(context)
                                                  .darkGreen
                                              : Colors.transparent,
                                          FlutterFlowTheme.of(context)
                                              .darkGreen,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                        ),
                                      ),
                                      child: Visibility(
                                        visible: widget!.progress!.workoutDone
                                                .where((e) =>
                                                    e.workoutId ==
                                                    widget!
                                                        .workout?.reference.id)
                                                .toList()
                                                .length >=
                                            2,
                                        child: Icon(
                                          FFIcons.kplusmember24,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          widget!.progress!.workoutDone
                                                      .where((e) =>
                                                          e.workoutId ==
                                                          widget!.workout
                                                              ?.reference.id)
                                                      .toList()
                                                      .length >=
                                                  3
                                              ? FlutterFlowTheme.of(context)
                                                  .darkGreen
                                              : Colors.transparent,
                                          Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).gray,
                                        ),
                                      ),
                                      child: Visibility(
                                        visible: widget!.progress!.workoutDone
                                                .where((e) =>
                                                    e.workoutId ==
                                                    widget!
                                                        .workout?.reference.id)
                                                .toList()
                                                .length >=
                                            3,
                                        child: Icon(
                                          FFIcons.kplusmember24,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (widget!.progress!.workoutDone
                                                    .where((e) =>
                                                        e.workoutId ==
                                                        widget!.workout
                                                            ?.reference.id)
                                                    .toList()
                                                    .length >=
                                                1) {
                                              return RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '66rk1jnv' /* Completed */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray,
                                                                letterSpacing:
                                                                    0.07,
                                                                lineHeight: 1.4,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        formatNumber(
                                                          widget!.progress
                                                              ?.workoutDone
                                                              ?.where((e) =>
                                                                  e.workoutId ==
                                                                  widget!
                                                                      .workout
                                                                      ?.reference
                                                                      .id)
                                                              .toList()
                                                              ?.length,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: ' 0 ',
                                                          locale: '',
                                                        ),
                                                        ' 0 ',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                letterSpacing:
                                                                    0.07,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                lineHeight: 1.4,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '337qu9pr' /* times */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray,
                                                                letterSpacing:
                                                                    0.07,
                                                                lineHeight: 1.4,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    )
                                                  ],
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              );
                                            } else {
                                              return Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'tro9fl3b' /* Not completed */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.07,
                                                          lineHeight: 1.4,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ),
                              if (!valueOrDefault<bool>(
                                  currentUserDocument?.plusmember, false))
                                AuthUserStreamWidget(
                                  builder: (context) => Builder(
                                    builder: (context) {
                                      if (widget!.workout?.free ?? false) {
                                        return Container(
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .blue,
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'exk17ls5' /* Free */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.07,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          width: 24.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .red,
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Icon(
                                            FFIcons.klock12,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 14.0,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
