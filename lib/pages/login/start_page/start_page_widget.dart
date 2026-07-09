import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog/dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'start_page_model.dart';
export 'start_page_model.dart';

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({super.key});

  static String routeName = 'StartPage';
  static String routePath = '/startPage';

  @override
  State<StartPageWidget> createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget>
    with TickerProviderStateMixin {
  late StartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'StartPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      logFirebaseEvent('START_PAGE_PAGE_StartPage_ON_INIT_STATE');
      await authManager.refreshUser();
      await Future.wait([
        Future(() async {
          if (valueOrDefault(currentUserDocument?.language, '') == null ||
              valueOrDefault(currentUserDocument?.language, '') == '') {
            if (FFLocalizations.of(context).languageCode == 'de') {
              logFirebaseEvent('StartPage_backend_call');

              await currentUserReference!.update(createUsersRecordData(
                language: 'de',
              ));
            } else {
              logFirebaseEvent('StartPage_backend_call');

              await currentUserReference!.update(createUsersRecordData(
                language: 'en',
              ));
            }

            logFirebaseEvent('StartPage_action_block');
            unawaited(
              () async {
                await action_blocks.recheckUserDeviceLanguage(context);
              }(),
            );
          }
        }),
        Future(() async {
          logFirebaseEvent('StartPage_custom_action');
          unawaited(
            () async {
              await actions.lockLandscapeMode();
            }(),
          );
        }),
        Future(() async {
          logFirebaseEvent('StartPage_custom_action');
          unawaited(
            () async {
              await actions.setStatusBarColor();
            }(),
          );
        }),
        Future(() async {
          logFirebaseEvent('StartPage_custom_action');
          unawaited(
            () async {
              _model.subsStatusUpdate = await actions.checkSubsStatus(
                currentUserUid,
              );
            }(),
          );
        }),
      ]);
      if (loggedIn) {
        if (valueOrDefault<bool>(currentUserDocument?.deleted, false)) {
          logFirebaseEvent('StartPage_auth');
          await authManager.deleteUser(context);
          logFirebaseEvent('StartPage_auth');
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          logFirebaseEvent('StartPage_navigate_to');

          context.goNamedAuth(
            AuthPageWidget.routeName,
            context.mounted,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          logFirebaseEvent('StartPage_bottom_sheet');
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible: false,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: DialogWidget(
                    text: FFLocalizations.of(context).getText(
                      'q8fakecu' /* Account deleted */,
                    ),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          return;
        } else {
          if (currentUserEmailVerified ||
              (currentUserEmail == null || currentUserEmail == '')) {
            if (FFLocalizations.of(context).languageCode == 'de') {
              logFirebaseEvent('StartPage_update_app_state');
              FFAppState().seasonFilter = 'de';
              FFAppState().update(() {});
            } else {
              logFirebaseEvent('StartPage_update_app_state');
              FFAppState().seasonFilter = 'en';
              FFAppState().update(() {});
            }

            if (!kDebugMode) {
              if (isWeb) {
                logFirebaseEvent('StartPage_navigate_to');

                context.goNamedAuth(
                  AdminAuthWidget.routeName,
                  context.mounted,
                  extra: <String, dynamic>{
                    '__transition_info__': TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );

                return;
              }
            }
            logFirebaseEvent('StartPage_navigate_to');

            context.goNamedAuth(
              HomePageWidget.routeName,
              context.mounted,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            logFirebaseEvent('StartPage_custom_action');
            unawaited(
              () async {
                await actions.checkSubscriptionById(
                  currentUserReference!.id,
                );
              }(),
            );
          } else {
            logFirebaseEvent('StartPage_navigate_to');

            context.goNamedAuth(
              EmailVerificationPageWidget.routeName,
              context.mounted,
              queryParameters: {
                'email': serializeParam(
                  currentUserEmail,
                  ParamType.String,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            return;
          }
        }
      } else {
        if (!kDebugMode) {
          if (isWeb) {
            logFirebaseEvent('StartPage_navigate_to');

            context.goNamedAuth(
              AdminAuthWidget.routeName,
              context.mounted,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            return;
          }
        }
        logFirebaseEvent('StartPage_navigate_to');

        context.goNamedAuth(
          AuthPageWidget.routeName,
          context.mounted,
          extra: <String, dynamic>{
            '__transition_info__': TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );

        return;
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/newLogo.png',
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    fit: BoxFit.contain,
                  ),
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
