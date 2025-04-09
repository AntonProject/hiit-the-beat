import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog/dialog_widget.dart';
import '/components/dialogs/payment_dialog_start/payment_dialog_start_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await authManager.refreshUser();
      unawaited(
        () async {
          await actions.lockLandscapeMode();
        }(),
      );
      if (loggedIn) {
        if (valueOrDefault<bool>(currentUserDocument?.deleted, false)) {
          await authManager.deleteUser(context);
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          context.goNamedAuth(
            AuthPageWidget.routeName,
            context.mounted,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

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
              (currentUserEmail == '')) {
            if ((valueOrDefault(currentUserDocument?.currentLevel, 0) ==
                    null) ||
                (valueOrDefault(currentUserDocument?.currentLevel, 0) <= 0)) {
              _model.progress = await queryProgressRecordOnce(
                queryBuilder: (progressRecord) => progressRecord.where(
                  'user',
                  isEqualTo: currentUserReference,
                ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              if (!(_model.progress != null)) {
                unawaited(
                  () async {
                    await ProgressRecord.collection
                        .doc()
                        .set(createProgressRecordData(
                          user: currentUserReference,
                        ));
                  }(),
                );

                await currentUserReference!.update(createUsersRecordData(
                  currentLevel: 1,
                ));
              }
            }
            unawaited(
              () async {
                await actions.checkSubscriptionById(
                  currentUserReference!.id,
                );
              }(),
            );
            if (valueOrDefault(currentUserDocument?.language, '') == '') {
              unawaited(
                () async {
                  await currentUserReference!.update(createUsersRecordData(
                    language: FFLocalizations.of(context).languageCode,
                  ));
                }(),
              );
            }
            if (!kDebugMode) {
              if (isWeb) {
                context.goNamedAuth(
                  AdminAuthWidget.routeName,
                  context.mounted,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );

                return;
              }
            }

            await currentUserReference!.update(createUsersRecordData(
              language: FFLocalizations.of(context).languageCode,
            ));
            await action_blocks.checkSignupActiveCampaign(context);

            context.goNamedAuth(
              HomePageWidget.routeName,
              context.mounted,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            if (((valueOrDefault<bool>(
                            currentUserDocument?.showTrialDialog, false) !=
                        true) ||
                    (valueOrDefault<bool>(
                            currentUserDocument?.showTrialDialog, false) ==
                        null)) &&
                ((valueOrDefault<bool>(
                            currentUserDocument?.plusmember, false) !=
                        true) ||
                    (valueOrDefault<bool>(
                            currentUserDocument?.plusmember, false) ==
                        null))) {
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
                      child: PaymentDialogStartWidget(),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            }
          } else {
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
                kTransitionInfoKey: TransitionInfo(
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
            context.goNamedAuth(
              AdminAuthWidget.routeName,
              context.mounted,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            return;
          }
        }

        context.goNamedAuth(
          AuthPageWidget.routeName,
          context.mounted,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
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
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
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
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.none,
                      image: Image.asset(
                        'assets/images/Logo_white_1.png',
                      ).image,
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
