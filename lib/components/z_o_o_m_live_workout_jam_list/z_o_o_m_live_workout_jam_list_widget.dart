import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/payment_dialog/payment_dialog_widget.dart';
import '/components/dialogs/zoom_no_premium_dialog/zoom_no_premium_dialog_widget.dart';
import '/components/skeleton/skeleton_homezoom/skeleton_homezoom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'z_o_o_m_live_workout_jam_list_model.dart';
export 'z_o_o_m_live_workout_jam_list_model.dart';

class ZOOMLiveWorkoutJamListWidget extends StatefulWidget {
  const ZOOMLiveWorkoutJamListWidget({super.key});

  @override
  State<ZOOMLiveWorkoutJamListWidget> createState() =>
      _ZOOMLiveWorkoutJamListWidgetState();
}

class _ZOOMLiveWorkoutJamListWidgetState
    extends State<ZOOMLiveWorkoutJamListWidget> {
  late ZOOMLiveWorkoutJamListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZOOMLiveWorkoutJamListModel());

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
            .where(Filter.or(
              Filter(
                'type_index',
                isEqualTo: 3,
              ),
              Filter(
                'type_index',
                isEqualTo: 4,
              ),
            ))
            .orderBy('datetime'),
        limit: 2,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return SkeletonHomezoomWidget();
        }
        List<AdditionalsRecord> zOOMLiveWorkoutJamAdditionalsRecordList =
            snapshot.data!;

        return Container(
          decoration: BoxDecoration(),
          child: Builder(
            builder: (context) {
              final zoomJam = zOOMLiveWorkoutJamAdditionalsRecordList.toList();

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(zoomJam.length, (zoomJamIndex) {
                  final zoomJamItem = zoomJam[zoomJamIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'Z_O_O_M_LIVE_WORKOUT_JAM_LIST_Container_');
                      logFirebaseEvent('Container_haptic_feedback');
                      HapticFeedback.selectionClick();
                      if (!zoomJamItem.free) {
                        if (!valueOrDefault<bool>(
                            currentUserDocument?.plusmember, false)) {
                          logFirebaseEvent('Container_bottom_sheet');
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ZoomNoPremiumDialogWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          return;
                        }
                      }
                      logFirebaseEvent('Container_launch_u_r_l');
                      unawaited(
                        () async {
                          await launchURL(zoomJamItem.linkURL);
                        }(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).darkGray,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 7.5, 16.0, 7.5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.5, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .middleGray,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 4.0, 8.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (!zoomJamItem.free)
                                              SvgPicture.asset(
                                                'assets/images/zoom_plusmember_badge.svg',
                                                width: 14.0,
                                                height: 14.0,
                                                fit: BoxFit.cover,
                                              ),
                                            Text(
                                              zoomJamItem.free
                                                  ? valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: 'Free',
                                                        deText: 'Free',
                                                        jaText: '無料',
                                                      ),
                                                      'Free',
                                                    )
                                                  : valueOrDefault<String>(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText:
                                                            'Plusmembers Only',
                                                        deText:
                                                            'Plusmembers Only',
                                                        jaText: 'プラス会員限定',
                                                      ),
                                                      'Plusmembers Only',
                                                    ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily,
                                                    color: !zoomJamItem.free
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    letterSpacing: 0.07,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.3,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallIsCustom,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText: 'Coach',
                                              deText: 'Coach',
                                              jaText: 'コーチ',
                                            ),
                                            'Coach',
                                          )} ${zoomJamItem.trainerNameAndSurname}',
                                          'Coach PETAIR',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.07,
                                              lineHeight: 1.25,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .displaySmallIsCustom,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        functions.getDayMonthTimeDateString(
                                            zoomJamItem.datetime!),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.07,
                                              lineHeight: 1.43,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .headlineMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 0.0),
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          height: 40.0,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ewznu98z' /* Workout */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.anton(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '32g8y489' /* Jam */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.anton(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 23.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .middleGray,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'Join live',
                                                deText: 'Join live',
                                                jaText: 'ライブに参加',
                                              ),
                                              'Join live',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.3,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLargeIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                            ),
                            if (false)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 14.0, 16.0, 14.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 42.0,
                                          height: 42.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/zoom_jam.png',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Visibility(
                                            visible: !zoomJamItem.free,
                                            child: Container(
                                              width: 42.0,
                                              height: 42.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.7),
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/zoom_plusmember_badge.svg',
                                                    width: 17.0,
                                                    height: 17.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                () {
                                                  if (FFLocalizations.of(
                                                              context)
                                                          .languageCode ==
                                                      'en') {
                                                    return zoomJamItem.titleEn;
                                                  } else if (FFLocalizations.of(
                                                              context)
                                                          .languageCode ==
                                                      'de') {
                                                    return zoomJamItem.titleDe;
                                                  } else {
                                                    return zoomJamItem.titleJa;
                                                  }
                                                }(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .displaySmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.07,
                                                      lineHeight: 1.25,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmallIsCustom,
                                                    ),
                                              ),
                                              Text(
                                                '${functions.getDayMonthTimeDateString(zoomJamItem.datetime!)} · ${zoomJamItem.free ? valueOrDefault<String>(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: 'Free',
                                                      deText: 'Kostenlos',
                                                      jaText: '無料',
                                                    ),
                                                    'Free',
                                                  ) : valueOrDefault<String>(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText:
                                                          'Plusmembers Only',
                                                      deText:
                                                          'Nur für Plusmembers',
                                                      jaText: 'プラス会員限定',
                                                    ),
                                                    'Plusmembers Only',
                                                  )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.07,
                                                          lineHeight: 1.43,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMediumIsCustom,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    if (() {
                                              if (FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en') {
                                                return zoomJamItem.descEn;
                                              } else if (FFLocalizations.of(
                                                          context)
                                                      .languageCode ==
                                                  'de') {
                                                return zoomJamItem.descDe;
                                              } else {
                                                return zoomJamItem.descJa;
                                              }
                                            }() !=
                                            null &&
                                        () {
                                              if (FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en') {
                                                return zoomJamItem.descEn;
                                              } else if (FFLocalizations.of(
                                                          context)
                                                      .languageCode ==
                                                  'de') {
                                                return zoomJamItem.descDe;
                                              } else {
                                                return zoomJamItem.descJa;
                                              }
                                            }() !=
                                            '')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          () {
                                            if (FFLocalizations.of(context)
                                                    .languageCode ==
                                                'en') {
                                              return zoomJamItem.descEn;
                                            } else if (FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'de') {
                                              return zoomJamItem.descDe;
                                            } else {
                                              return zoomJamItem.descJa;
                                            }
                                          }(),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray,
                                                letterSpacing: 0.07,
                                                lineHeight: 1.43,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 36.0,
                                          height: 36.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(36.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl:
                                                  zoomJamItem.trainerAvatar,
                                              width: 36.0,
                                              height: 36.0,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, 0.0),
                                              errorWidget: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: 36.0,
                                                height: 36.0,
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            zoomJamItem.trainerNameAndSurname,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.07,
                                                  lineHeight: 1.3,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallIsCustom,
                                                ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'Z_O_O_M_LIVE_WORKOUT_JAM_LIST_Go_ON_TAP');
                                            logFirebaseEvent(
                                                'Go_haptic_feedback');
                                            HapticFeedback.selectionClick();
                                            if (!zoomJamItem.free) {
                                              if (!valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.plusmember,
                                                  false)) {
                                                logFirebaseEvent(
                                                    'Go_bottom_sheet');
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          PaymentDialogWidget(),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                return;
                                              }
                                            }
                                            logFirebaseEvent('Go_launch_u_r_l');
                                            unawaited(
                                              () async {
                                                await launchURL(
                                                    zoomJamItem.linkURL);
                                              }(),
                                            );
                                          },
                                          text: valueOrDefault<String>(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText: 'Join live',
                                              deText: 'Live dabei sein',
                                              jaText: 'ライブに参加',
                                            ),
                                            'Join live',
                                          ),
                                          options: FFButtonOptions(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 8.0, 25.0, 8.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .middleGray,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.07,
                                                      lineHeight: 1.43,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLargeIsCustom,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  );
                }).divide(SizedBox(height: 8.0)),
              );
            },
          ),
        );
      },
    );
  }
}
