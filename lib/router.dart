import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:on_boarding_exemple/ui/screens/home_page.dart';
import 'package:on_boarding_exemple/ui/screens/on_boarding_page.dart';

/// Shared paths / urls used across the app
class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String home = '/home';
}

/// Routing table, matches string paths to UI Screens, optionally parses params from the paths
final appRouter = GoRouter(
  redirect: (_, state) =>
      state.uri.path == ScreenPaths.splash ? ScreenPaths.home : null,
  routes: [
    ShellRoute(
      builder: (context, state, child) => child,
      routes: [
        // This will be hidden
        AppRoute(ScreenPaths.splash, Container(color: Colors.purple)),
        AppRoute(ScreenPaths.intro, const OnBoardingPage()),
        AppRoute(ScreenPaths.home, const HomePage()),
      ],
    ),
  ],
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(
    String path,
    Widget content,
  ) : super(
          path: path,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: content,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          },
        );
}
