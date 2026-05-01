import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => RootPageContext.wrap(
        appStateNotifier.loggedIn ? StartPageWidget() : AuthPageWidget(),
        errorRoute: state.uri.toString(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? StartPageWidget() : AuthPageWidget(),
          ),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: AuthPageWidget.routeName,
          path: AuthPageWidget.routePath,
          builder: (context, params) => AuthPageWidget(),
        ),
        FFRoute(
          name: LoginPageWidget.routeName,
          path: LoginPageWidget.routePath,
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: RestorePasswordPageWidget.routeName,
          path: RestorePasswordPageWidget.routePath,
          builder: (context, params) => RestorePasswordPageWidget(),
        ),
        FFRoute(
          name: SignupPageWidget.routeName,
          path: SignupPageWidget.routePath,
          builder: (context, params) => SignupPageWidget(),
        ),
        FFRoute(
          name: EmailVerificationPageWidget.routeName,
          path: EmailVerificationPageWidget.routePath,
          builder: (context, params) => EmailVerificationPageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChangeEmailPageWidget.routeName,
          path: ChangeEmailPageWidget.routePath,
          builder: (context, params) => ChangeEmailPageWidget(),
        ),
        FFRoute(
          name: EmailChangeSendLinkPageWidget.routeName,
          path: EmailChangeSendLinkPageWidget.routePath,
          builder: (context, params) => EmailChangeSendLinkPageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PhoneEditPageWidget.routeName,
          path: PhoneEditPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PhoneEditPageWidget(),
        ),
        FFRoute(
          name: TermsPageWidget.routeName,
          path: TermsPageWidget.routePath,
          builder: (context, params) => TermsPageWidget(),
        ),
        FFRoute(
          name: PolicyPageWidget.routeName,
          path: PolicyPageWidget.routePath,
          builder: (context, params) => PolicyPageWidget(),
        ),
        FFRoute(
          name: ImprintPageWidget.routeName,
          path: ImprintPageWidget.routePath,
          builder: (context, params) => ImprintPageWidget(),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: PasswordChangePageWidget.routeName,
          path: PasswordChangePageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PasswordChangePageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PasswordChangePage2Widget.routeName,
          path: PasswordChangePage2Widget.routePath,
          requireAuth: true,
          builder: (context, params) => PasswordChangePage2Widget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ProfileEditPageWidget.routeName,
          path: ProfileEditPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfileEditPageWidget(),
        ),
        FFRoute(
          name: StartPageWidget.routeName,
          path: StartPageWidget.routePath,
          builder: (context, params) => StartPageWidget(),
        ),
        FFRoute(
          name: AdditionalsPageWidget.routeName,
          path: AdditionalsPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdditionalsPageWidget(),
        ),
        FFRoute(
          name: SeasonWorkoutPageWidget.routeName,
          path: SeasonWorkoutPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SeasonWorkoutPageWidget(
            level: params.getParam(
              'level',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: SeasonPageWidget.routeName,
          path: SeasonPageWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'season': getDoc(['seasons'], SeasonsRecord.fromSnapshot),
          },
          builder: (context, params) => SeasonPageWidget(
            season: params.getParam(
              'season',
              ParamType.Document,
            ),
            workoutCount: params.getParam(
              'workoutCount',
              ParamType.int,
            ),
            seasonIndex: params.getParam(
              'seasonIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: WorkoutPageWidget.routeName,
          path: WorkoutPageWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'season': getDoc(['seasons'], SeasonsRecord.fromSnapshot),
            'workout': getDoc(['workouts'], WorkoutsRecord.fromSnapshot),
          },
          builder: (context, params) => WorkoutPageWidget(
            season: params.getParam(
              'season',
              ParamType.Document,
            ),
            workout: params.getParam(
              'workout',
              ParamType.Document,
            ),
            workoutCount: params.getParam(
              'workoutCount',
              ParamType.int,
            ),
            indexInList: params.getParam(
              'indexInList',
              ParamType.int,
            ),
            progress: params.getParam(
              'progress',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['progress'],
            ),
            seasonIndex: params.getParam(
              'seasonIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AdminAuthWidget.routeName,
          path: AdminAuthWidget.routePath,
          builder: (context, params) => AdminAuthWidget(),
        ),
        FFRoute(
          name: AdminUserManagementWidget.routeName,
          path: AdminUserManagementWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminUserManagementWidget(),
        ),
        FFRoute(
          name: AdminSettingsWidget.routeName,
          path: AdminSettingsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminSettingsWidget(),
        ),
        FFRoute(
          name: AdminEditPromoWidget.routeName,
          path: AdminEditPromoWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'promo': getDoc(['promo'], PromoRecord.fromSnapshot),
          },
          builder: (context, params) => AdminEditPromoWidget(
            promo: params.getParam(
              'promo',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminPromoWidget.routeName,
          path: AdminPromoWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminPromoWidget(),
        ),
        FFRoute(
          name: AdminAddPromoWidget.routeName,
          path: AdminAddPromoWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminAddPromoWidget(),
        ),
        FFRoute(
          name: AdminAdditionalWidget.routeName,
          path: AdminAdditionalWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminAdditionalWidget(),
        ),
        FFRoute(
          name: AdminEditAdditWidget.routeName,
          path: AdminEditAdditWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'addit': getDoc(['additionals'], AdditionalsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminEditAdditWidget(
            addit: params.getParam(
              'addit',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminAddAdditWidget.routeName,
          path: AdminAddAdditWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminAddAdditWidget(
            type: params.getParam(
              'type',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AdminEditUserWidget.routeName,
          path: AdminEditUserWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'user': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => AdminEditUserWidget(
            user: params.getParam(
              'user',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminZoomWidget.routeName,
          path: AdminZoomWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'zoom': getDoc(['additionals'], AdditionalsRecord.fromSnapshot),
            'zoom2': getDoc(['additionals'], AdditionalsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminZoomWidget(
            zoom: params.getParam(
              'zoom',
              ParamType.Document,
            ),
            zoom2: params.getParam(
              'zoom2',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminSeasonsWidget.routeName,
          path: AdminSeasonsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminSeasonsWidget(),
        ),
        FFRoute(
          name: AdminWorkoutsWidget.routeName,
          path: AdminWorkoutsWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'season': getDoc(['seasons'], SeasonsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminWorkoutsWidget(
            season: params.getParam(
              'season',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminEditSeasonWidget.routeName,
          path: AdminEditSeasonWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'season': getDoc(['seasons'], SeasonsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminEditSeasonWidget(
            season: params.getParam(
              'season',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminAddSeasonWidget.routeName,
          path: AdminAddSeasonWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminAddSeasonWidget(),
        ),
        FFRoute(
          name: AdminEditWorkoutWidget.routeName,
          path: AdminEditWorkoutWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'work': getDoc(['workouts'], WorkoutsRecord.fromSnapshot),
            'season': getDoc(['seasons'], SeasonsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminEditWorkoutWidget(
            work: params.getParam(
              'work',
              ParamType.Document,
            ),
            season: params.getParam(
              'season',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminAddWorkoutWidget.routeName,
          path: AdminAddWorkoutWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'season': getDoc(['seasons'], SeasonsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminAddWorkoutWidget(
            season: params.getParam(
              'season',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SubscriptionPageWidget.routeName,
          path: SubscriptionPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SubscriptionPageWidget(),
        ),
        FFRoute(
          name: VideoPageWidget.routeName,
          path: VideoPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => VideoPageWidget(
            videoEn: params.getParam(
              'videoEn',
              ParamType.String,
            ),
            videoDe: params.getParam(
              'videoDe',
              ParamType.String,
            ),
            videoJa: params.getParam(
              'videoJa',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AdminBannersWidget.routeName,
          path: AdminBannersWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminBannersWidget(),
        ),
        FFRoute(
          name: AdminAddBannerWidget.routeName,
          path: AdminAddBannerWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminAddBannerWidget(),
        ),
        FFRoute(
          name: AdminEditBannerWidget.routeName,
          path: AdminEditBannerWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'banner': getDoc(['videos'], VideosRecord.fromSnapshot),
          },
          builder: (context, params) => AdminEditBannerWidget(
            banner: params.getParam(
              'banner',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/authPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFF161616),
                  child: Center(
                    child: Image.asset(
                      'assets/images/newLogo.png',
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
