import 'package:template_app/core/helpers/custom_dialogs.dart';
import 'package:template_app/presentation/base/base_screen.dart';
import 'package:template_app/presentation/screens/auth/login_screen.dart';
import 'package:template_app/presentation/screens/dialog/dialog_page.dart';
import 'package:template_app/presentation/screens/main/notifications/notifications.dart';
import 'package:template_app/presentation/screens/main/overview/overview_screen.dart';
import 'package:template_app/presentation/screens/main/settings/settings_screen.dart';
import 'package:template_app/presentation/screens/main/wallet/wallet_screen.dart';
import 'package:template_app/presentation/viewmodel/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_app/core/core_provider.dart';
import 'package:template_app/presentation/screens/main/home/home_screen.dart';
import 'package:template_app/presentation/screens/startup/landing_screen.dart';
import 'package:template_app/presentation/screens/startup/splash_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');
final _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigator');

enum TransitionType { fade, slide }

extension TransitionTypeExtension on TransitionType {
  getTransition(Animation<double> animation, Widget child) {
    return {
          TransitionType.fade: FadeTransition(
            opacity: animation,
            child: child,
          ),
          TransitionType.slide: SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeIn)),
              ),
              child: child),
        }[this] ??
        FadeTransition(
          opacity: animation,
          child: child,
        );
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final authViewModel = ref.watch(AuthViewModel.provider);
  return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: HomeScreen.id,
      refreshListenable: authViewModel,
      redirect: (context, state) {
        final isAuthenticated = authViewModel.authUser != null;
        final hasUserCompletedLandingPage = authViewModel.landingPageState;

        if (state.fullPath == LandingScreen.id) {
          if (isAuthenticated) {
            return null;
          } else {
            return hasUserCompletedLandingPage
                ? LoginScreen.id
                : LandingScreen.id;
          }
        } else {
          if (isAuthenticated) {
            return null;
          } else {
            return hasUserCompletedLandingPage
                ? LoginScreen.id
                : SplashScreen.id;
          }
        }
      },
      routes: [
        goRoutePageTransition(
            LandingScreen.id, (extras) => const LandingScreen(),
            transitionType: TransitionType.slide, key: rootNavigatorKey),
        goRoutePageTransition(SplashScreen.id, (extras) => const SplashScreen(),
            key: rootNavigatorKey),
        goRoutePageTransition(LoginScreen.id, (extras) => const LoginScreen(),
            key: rootNavigatorKey, transitionType: TransitionType.slide),
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return BaseScreen(child: child);
            },
            routes: [
              goRoutePageTransition(
                HomeScreen.id,
                key: _shellNavigatorKey,
                (extras) => const HomeScreen(),
              ),
              goRoutePageTransition(
                  OverViewScreen.id,
                  key: _shellNavigatorKey,
                  (extras) => const OverViewScreen()),
              goRoutePageTransition(
                  WalletScreen.id,
                  key: _shellNavigatorKey,
                  (extras) => const WalletScreen()),
              goRoutePageTransition(
                  SettingsScreen.id,
                  key: _shellNavigatorKey,
                  (extras) => const SettingsScreen()),
            ]),
        goRoutePageTransition(
            NotificationScreen.id, (extras) => const NotificationScreen(),
            transitionType: TransitionType.slide),
        goRouteDialog(
            dialog: (context, extras) =>
                CustomDialog.successDialog(context, extras),
            path: '/success'),
        goRouteDialog(
            dialog: (context, extras) =>
                CustomDialog.successDialog(context, extras),
            path: '/failure'),
      ]);
});

GoRoute goRouteDialog(
    {required String path,
    required Function(BuildContext context, Extras extras) dialog}) {
  return GoRoute(
    path: path,
    name: path,
    pageBuilder: (context, state) {
      printWarning('Dialogue:>> $path');
      return DialogPage<void>(
        builder: (context) => dialog(context, state.extra as Extras),
      );
    },
  );
}

GoRoute goRoutePageTransition(
    String path, Widget Function(Map<String, dynamic>? extras) pageBuilder,
    {GlobalKey<NavigatorState>? key,
    List<RouteBase>? routes,
    TransitionType transitionType = TransitionType.fade}) {
  return GoRoute(
    parentNavigatorKey: key,
    path: path,
    name: path,
    routes: routes ?? [],
    pageBuilder: (context, state) {
      printInfo("Go Route:>> ${state.fullPath}");
      final page = pageBuilder(state.extra as Map<String, dynamic>?);
      return CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              transitionType.getTransition(animation, child),
          child: page);
    },
  );
}
