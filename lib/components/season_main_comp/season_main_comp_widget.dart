import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/skeleton/skeleton_season_main/skeleton_season_main_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'season_main_comp_model.dart';
export 'season_main_comp_model.dart';

class SeasonMainCompWidget extends StatefulWidget {
  const SeasonMainCompWidget({
    super.key,
    required this.season,
    required this.progress,
    int? index,
    int? selectedLvl,
  })  : this.index = index ?? 0,
        this.selectedLvl = selectedLvl ?? 1;

  final SeasonsRecord? season;
  final ProgressRecord? progress;
  final int index;
  final int selectedLvl;

  @override
  State<SeasonMainCompWidget> createState() => _SeasonMainCompWidgetState();
}

class _SeasonMainCompWidgetState extends State<SeasonMainCompWidget> {
  late SeasonMainCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeasonMainCompModel());

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
          return SkeletonSeasonMainWidget();
        }
        int containerCount = snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF952D4F),
                Color(0xFF8F396A),
                Color(0xFF814781),
                Color(0xFF6C5592),
                Color(0xFF53629C),
                Color(0xFF396D9F),
                Color(0xFF24759B)
              ],
              stops: [0.0, 0.2, 0.3, 0.5, 0.6, 0.8, 1.0],
              begin: AlignmentDirectional(-1.0, -0.87),
              end: AlignmentDirectional(1.0, 0.87),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(valueOrDefault<double>(
              functions.workoutSeasonExistOrNotDone(
                      widget!.progress?.workoutDone?.toList(),
                      widget!.season!.reference.id,
                      valueOrDefault<int>(
                        containerCount,
                        0,
                      ))
                  ? 1.0
                  : 0.0,
              0.0,
            )),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('SEASON_MAIN_Container_2tfr66q8_ON_TAP');
                logFirebaseEvent('Container_haptic_feedback');
                HapticFeedback.selectionClick();
                if (currentUserEmail != null && currentUserEmail != '') {
                  logFirebaseEvent('Container_navigate_to');

                  context.pushNamed(
                    SeasonPageWidget.routeName,
                    queryParameters: {
                      'season': serializeParam(
                        widget!.season,
                        ParamType.Document,
                      ),
                      'workoutCount': serializeParam(
                        valueOrDefault<int>(
                          containerCount,
                          0,
                        ),
                        ParamType.int,
                      ),
                      'seasonIndex': serializeParam(
                        valueOrDefault<int>(
                          widget!.index,
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
                    },
                  );

                  return;
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
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: valueOrDefault<String>(
                            widget!.season?.cover,
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/breakletics-owe5sa/assets/a7j5isfp3ab2/234234.webp',
                          ),
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.png',
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 32.0,
                              child: VerticalDivider(
                                width: 2.0,
                                thickness: 2.0,
                                color: valueOrDefault<Color>(
                                  () {
                                    if (functions.workoutSeasonExistOrNotDone(
                                        widget!.progress?.workoutDone?.toList(),
                                        widget!.season!.reference.id,
                                        containerCount)) {
                                      return FlutterFlowTheme.of(context).red;
                                    } else if (functions.workoutSeasonDone(
                                        widget!.progress?.workoutDone?.toList(),
                                        widget!.season!.reference.id,
                                        containerCount)) {
                                      return FlutterFlowTheme.of(context)
                                          .secondary;
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .primaryText;
                                    }
                                  }(),
                                  FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: valueOrDefault<String>(
                                            widget!.season?.titleEn,
                                            '--',
                                          ),
                                          deText: valueOrDefault<String>(
                                            widget!.season?.titleDe,
                                            '-',
                                          ),
                                          jaText: valueOrDefault<String>(
                                            widget!.season?.titleJa,
                                            '--',
                                          ),
                                        ),
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 16.0,
                                            letterSpacing: 0.07,
                                            fontWeight: FontWeight.bold,
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
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).middleGray,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (widget!.season!.en &&
                                          widget!.season!.de &&
                                          widget!.season!.ja)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2o32k5nl' /* EN | DE | JA */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (widget!.season!.de &&
                                          widget!.season!.en &&
                                          !widget!.season!.ja)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1dm8vm05' /* EN | DE */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (widget!.season!.de &&
                                          widget!.season!.ja)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'rbso5ry6' /* DE | JA */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (widget!.season!.en &&
                                          widget!.season!.ja)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'fnvbtz86' /* EN  | JA */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (widget!.season!.en &&
                                          !widget!.season!.de &&
                                          !widget!.season!.ja)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yjnekpi7' /* EN */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (!widget!.season!.en &&
                                          widget!.season!.de &&
                                          !widget!.season!.ja)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'th5ys52a' /* DE */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (!widget!.season!.en &&
                                          !widget!.season!.de &&
                                          widget!.season!.ja)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ypz1naad' /* JA */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).middleGray,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
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
                                                '0 ',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '67l2ulqn' /* Workouts */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                      StyledDivider(
                        height: 4.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).middleGray,
                        lineStyle: DividerLineStyle.dotted,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'f6jing3j' /* Last activity */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context).gray,
                                      fontSize: 12.0,
                                      letterSpacing: 0.07,
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                            AutoSizeText(
                              valueOrDefault<String>(
                                () {
                                  if (widget!.progress?.workoutDone
                                          ?.where((e) =>
                                              e.seasonId ==
                                              widget!.season?.reference.id)
                                          .toList()
                                          ?.length ==
                                      0) {
                                    return valueOrDefault<String>(
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'No activity yet',
                                        deText: 'Noch keine Aktivität',
                                        jaText: 'まだ活動はありません',
                                      ),
                                      'No activity yet',
                                    );
                                  } else if (functions
                                          .workoutSeasonExistOrNotDone(
                                              widget!.progress?.workoutDone
                                                  ?.toList(),
                                              widget!.season!.reference.id,
                                              containerCount) ||
                                      functions.workoutSeasonDone(
                                          widget!.progress?.workoutDone
                                              ?.toList(),
                                          widget!.season!.reference.id,
                                          containerCount)) {
                                    return valueOrDefault<String>(
                                      dateTimeFormat(
                                        "dd MMMM yyyy",
                                        functions.lastActivitySeason(
                                            widget!.progress?.workoutDone
                                                ?.toList(),
                                            widget!.season!.reference.id),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      '-',
                                    );
                                  } else {
                                    return valueOrDefault<String>(
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'No activity yet',
                                        deText: 'Noch keine Aktivität',
                                        jaText: 'まだ活動はありません',
                                      ),
                                      'No activity yet',
                                    );
                                  }
                                }(),
                                'No activity yet',
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 12.0,
                                    letterSpacing: 0.07,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.4,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      StyledDivider(
                        height: 4.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).middleGray,
                        lineStyle: DividerLineStyle.dotted,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ulmgxwkw' /* Progress */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 12.0,
                                        letterSpacing: 0.07,
                                        lineHeight: 1.4,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  () {
                                    if (widget!.progress?.workoutDone
                                            ?.where((e) =>
                                                e.seasonId ==
                                                widget!.season?.reference.id)
                                            .toList()
                                            ?.length ==
                                        0) {
                                      return valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'No activity yet',
                                          deText: 'Noch keine Aktivität',
                                          jaText: 'まだ活動はありません',
                                        ),
                                        'No activity yet',
                                      );
                                    } else if (functions.workoutSeasonDone(
                                        widget!.progress?.workoutDone?.toList(),
                                        widget!.season!.reference.id,
                                        containerCount)) {
                                      return 'Done';
                                    } else {
                                      return valueOrDefault<String>(
                                        formatNumber(
                                          functions.workoutSeasonProgress(
                                              widget!.progress?.workoutDone
                                                  ?.toList(),
                                              widget!.season!.reference.id,
                                              containerCount),
                                          formatType: FormatType.percent,
                                        ),
                                        '0%',
                                      );
                                    }
                                  }(),
                                  'No activity yet',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: valueOrDefault<Color>(
                                        () {
                                          if (widget!.progress?.workoutDone
                                                  ?.where((e) =>
                                                      e.seasonId ==
                                                      widget!
                                                          .season?.reference.id)
                                                  .toList()
                                                  ?.length ==
                                              0) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryText;
                                          } else if (functions
                                                  .workoutSeasonDone(
                                                      widget!
                                                          .progress?.workoutDone
                                                          ?.toList(),
                                                      widget!
                                                          .season!.reference.id,
                                                      containerCount) ||
                                              functions.seasonDoneExist(
                                                  widget!.progress?.seasonDone
                                                      ?.toList(),
                                                  widget!
                                                      .season!.reference.id)) {
                                            return FlutterFlowTheme.of(context)
                                                .secondary;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .red;
                                          }
                                        }(),
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      fontSize: 12.0,
                                      letterSpacing: 0.07,
                                      fontWeight: FontWeight.w500,
                                      lineHeight: 1.4,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ],
                          ),
                          LinearPercentIndicator(
                            percent: valueOrDefault<double>(
                              functions.workoutSeasonProgress(
                                  widget!.progress?.workoutDone?.toList(),
                                  widget!.season!.reference.id,
                                  containerCount),
                              0.0,
                            ),
                            lineHeight: 8.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: valueOrDefault<Color>(
                              () {
                                if (widget!.progress?.workoutDone
                                        ?.where((e) =>
                                            e.seasonId ==
                                            widget!.season?.reference.id)
                                        .toList()
                                        ?.length ==
                                    0) {
                                  return FlutterFlowTheme.of(context).primary;
                                } else if (functions.workoutSeasonDone(
                                    widget!.progress?.workoutDone?.toList(),
                                    widget!.season!.reference.id,
                                    containerCount)) {
                                  return FlutterFlowTheme.of(context).secondary;
                                } else {
                                  return FlutterFlowTheme.of(context).red;
                                }
                              }(),
                              FlutterFlowTheme.of(context).primary,
                            ),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            barRadius: Radius.circular(8.0),
                            padding: EdgeInsets.zero,
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
