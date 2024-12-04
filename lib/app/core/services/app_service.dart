
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService extends GetxService {
  static const String _firstTimeKey = 'first_time';
  late SharedPreferences _prefs;

  Future<AppService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  bool isFirstTime() {
    return _prefs.getBool(_firstTimeKey) ?? true;
  }

  Future<void> setFirstTime(bool value) async {
    await _prefs.setBool(_firstTimeKey, value);
  }
}