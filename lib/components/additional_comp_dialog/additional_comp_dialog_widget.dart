import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialogs/guest_dialog/guest_dialog_widget.dart';
import '/components/dialogs/payment_dialog/payment_dialog_widget.dart';
import '/components/dialogs/payment_dialog_start/payment_dialog_start_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'additional_comp_dialog_model.dart';
export 'additional_comp_dialog_model.dart';

class AdditionalCompDialogWidget extends StatefulWidget {
  const AdditionalCompDialogWidget({
    super.key,
    required this.addit,
  });

  final AdditionalsRecord? addit;

  @override
  State<AdditionalCompDialogWidget> createState() =>
      _AdditionalCompDialogWidgetState();
}

class _AdditionalCompDialogWidgetState
    extends State<AdditionalCompDialogWidget> {
  late AdditionalCompDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdditionalCompDialogModel());

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
        logFirebaseEvent('ADDITIONAL_DIALOG_Container_rw8y9a6t_ON_');
        logFirebaseEvent('Container_haptic_feedback');
        HapticFeedback.mediumImpact();
        if (!valueOrDefault<bool>(currentUserDocument?.plusmember, false)) {
          if (widget!.addit!.free) {
            if (currentUserEmail != null && currentUserEmail != '') {
            } else {
              if ((currentUserDocument?.additionalsIdViews?.toList() ?? [])
                      .length >
                  0) {
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
          } else {
            if (valueOrDefault<bool>(currentUserDocument?.plusmember, false) ==
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

            return;
          }
        }
        logFirebaseEvent('Container_navigate_to');

        context.pushNamed(
          VideoPageWidget.routeName,
          queryParameters: {
            'videoEn': serializeParam(
              widget!.addit?.videoUrlEn,
              ParamType.String,
            ),
            'videoDe': serializeParam(
              widget!.addit?.videoUrlDe,
              ParamType.String,
            ),
            'videoJa': serializeParam(
              widget!.addit?.videoUrlJa,
              ParamType.String,
            ),
          }.withoutNulls,
        );

        if (!(currentUserDocument?.additionalsIdViews?.toList() ?? [])
            .contains(widget!.addit?.reference.id)) {
          logFirebaseEvent('Container_backend_call');
          unawaited(
            () async {
              await currentUserReference!.update({
                ...mapToFirestore(
                  {
                    'additionals_id_views':
                        FieldValue.arrayUnion([widget!.addit?.reference.id]),
                  },
                ),
              });
            }(),
          );
          logFirebaseEvent('Container_update_app_state');

          safeSetState(() {});
        }
        logFirebaseEvent('Container_backend_call');

        await widget!.addit!.reference.update({
          ...mapToFirestore(
            {
              'views': FieldValue.increment(1),
            },
          ),
        });
        if (widget!.addit!.points > 0) {
          if (widget!.addit?.typeIndex == 1) {
            logFirebaseEvent('Container_update_app_state');
            FFAppState().warmupPoints = valueOrDefault<int>(
              widget!.addit?.points,
              2,
            );
            safeSetState(() {});
          } else {
            logFirebaseEvent('Container_update_app_state');
            FFAppState().cooldownPoints = valueOrDefault<int>(
              widget!.addit?.points,
              2,
            );
            safeSetState(() {});
          }
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).middleGray,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                  imageUrl: valueOrDefault<String>(
                    widget!.addit?.cover,
                    'https://firebasestorage.googleapis.com/v0/b/breakletics-9245d.appspot.com/o/4234124.webp?alt=media&token=c013795d-5b3f-4bb1-a3e9-1305303d869a',
                  ),
                  width: 64.0,
                  height: 36.0,
                  fit: BoxFit.cover,
                  errorWidget: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    width: 64.0,
                    height: 36.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            FFLocalizations.of(context).getVariableText(
                              enText: valueOrDefault<String>(
                                widget!.addit?.titleEn,
                                '-',
                              ),
                              deText: valueOrDefault<String>(
                                widget!.addit?.titleDe,
                                '-',
                              ),
                              jaText: valueOrDefault<String>(
                                widget!.addit?.titleJa,
                                '-',
                              ),
                            ),
                            '-',
                          ),
                          maxLines: 2,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 14.0,
                                letterSpacing: 0.07,
                                fontWeight: FontWeight.w600,
                                lineHeight: 1.4,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            FFLocalizations.of(context).getVariableText(
                              enText: widget!.addit?.duration,
                              deText: widget!.addit?.durationDe,
                              jaText: widget!.addit?.durationJa,
                            ),
                            '-',
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
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if ((currentUserDocument?.additionalsIdViews?.toList() ?? [])
                      .contains(widget!.addit?.reference.id))
                    AuthUserStreamWidget(
                      builder: (context) => Icon(
                        FFIcons.keye24,
                        color: FlutterFlowTheme.of(context).gray,
                        size: 24.0,
                      ),
                    ),
                  if (!valueOrDefault<bool>(
                      currentUserDocument?.plusmember, false))
                    AuthUserStreamWidget(
                      builder: (context) => Builder(
                        builder: (context) {
                          if (widget!.addit?.free ?? false) {
                            return Container(
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).blue,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '7fx80jza' /* Free */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 12.0,
                                          letterSpacing: 0.07,
                                          lineHeight: 1.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).red,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Icon(
                                FFIcons.klock12,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 12.0,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                ],
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}
