
import 'package:on_boarding_exemple/logic/json_prefs_file.dart';

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

mixin SaveLoadMixin {
  late final _file = JsonPrefsFile(fileName);

  Future<void> load() async {
    final results = await _file.load();
    try {
      copyFromJson(results);
    } on Exception catch (_) {
      // Exception caught
    }
  }

  Future<void> save() async {
    try {
      await _file.save(toJson());
    } on Exception catch (_) {
      // Exception caught
    }
  }

  /// Serialization
  String get fileName;
  Map<String, dynamic> toJson();
  void copyFromJson(Map<String, dynamic> value);
}
