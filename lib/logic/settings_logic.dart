
import 'package:on_boarding_exemple/logic/save_load_mixin.dart';

class SettingsLogic with SaveLoadMixin {
  @override
  String get fileName => 'settings.dat';

  bool _hasCompletedOnboarding = false;
  bool get hasCompletedOnboarding => _hasCompletedOnboarding;
  set hasCompletedOnboarding(bool value) {
    _hasCompletedOnboarding = value;
    save();
  }

  @override
  void copyFromJson(Map<String, dynamic> value) {
    _hasCompletedOnboarding = value['hasCompletedOnboarding'] ?? false;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'hasCompletedOnboarding': _hasCompletedOnboarding,
    };
  }
}
