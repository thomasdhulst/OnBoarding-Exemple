import 'package:on_boarding_exemple/logic/json_prefs_file.dart';

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
