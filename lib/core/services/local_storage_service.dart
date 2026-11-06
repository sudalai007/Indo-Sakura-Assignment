import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _keyOnboardingCompleted = 'onboarding_completed';
  static const String _keyLastUserId = 'last_user_id';

  static LocalStorageService? _instance;
  static SharedPreferences? _prefs;

  LocalStorageService._();

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService._();
      _prefs = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  bool isOnboardingCompleted() {
    return _prefs?.getBool(_keyOnboardingCompleted) ?? false;
  }

  Future<bool> setOnboardingCompleted(bool value) async {
    return await _prefs?.setBool(_keyOnboardingCompleted, value) ?? false;
  }

  String? getLastUserId() {
    return _prefs?.getString(_keyLastUserId);
  }

  Future<bool> setLastUserId(String uid) async {
    return await _prefs?.setString(_keyLastUserId, uid) ?? false;
  }

  Future<void> clearAll() async {
    await _prefs?.clear();
  }
}

