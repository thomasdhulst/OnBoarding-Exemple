import 'dart:async';
import 'package:on_boarding_exemple/main.dart';
import 'package:on_boarding_exemple/router.dart';

class AppLogic {
  // Indicates if the on boarding has been completed
  bool hasCompletedOnboarding = false;

  /// Initialize the app and all main actors.
  /// Loads settings, sets up services etc.
  Future<void> bootstrap() async {

    // Search for local data settings
    await settingsLogic.load();

    // Load initial view (replace empty initial view which is covered by a native splash screen)
    bool showIntro = settingsLogic.hasCompletedOnboarding == false;
    if (showIntro) {
      appRouter.go(ScreenPaths.intro);
    } else {
      appRouter.go(ScreenPaths.home);
    }
  }
}
