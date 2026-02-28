import 'package:task/core/core.dart';
import 'package:task/features/contact/views/screen/contact_screen.dart';
import 'package:task/features/splash/views/screen/splash_screen.dart';
import 'package:task/features/welcome/views/screen/welcome_screen.dart';

class Routes {
  Routes._();

  static const splash = '/splash';
  static const welcome = '/welcome';
  static const home = '/home';
}

class AppRouter {
  AppRouter._();

  static final routeObserver = RouteObserver<ModalRoute<void>>();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splash,
    observers: [routeObserver],
    routes: [
      GoRoute(
        path: Routes.splash,
        pageBuilder: (context, state) =>
            _slidePage(state: state, child: const SplashScreen()),
      ),
      GoRoute(
        path: Routes.welcome,
        pageBuilder: (context, state) =>
            _bottomToTopSlidePage(state: state, child: const WelcomeScreen()),
      ),
      GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) =>
            _slidePage(state: state, child: const ContactScreen()),
      ),
    ],
  );

  static CustomTransitionPage _slidePage({
    required GoRouterState state,
    required Widget child,
  }) => CustomTransitionPage(
    key: ValueKey<String>(state.matchedLocation),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeInOut));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );

  static CustomTransitionPage _bottomToTopSlidePage({
    required GoRouterState state,
    required Widget child,
  }) => CustomTransitionPage(
    key: state.pageKey,
    // key: ValueKey<String>(state.matchedLocation),
    child: child,
    transitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Slide from bottom
      final slideAnimation = Tween<Offset>(
        begin: const Offset(0, 0.25), // small offset, not full screen
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOutCubic)).animate(animation);

      // Slight scale
      final scaleAnimation = Tween<double>(
        begin: 0.97,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.easeOutBack)).animate(animation);

      // Fade
      final fadeAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));

      return SlideTransition(
        position: slideAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: FadeTransition(opacity: fadeAnimation, child: child),
        ),
      );
    },
  );
}
