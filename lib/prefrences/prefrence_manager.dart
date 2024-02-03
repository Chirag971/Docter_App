// import 'package:shared_preferences/shared_preferences.dart';

// import 'prefrence_key.dart';

// /// Share Prefrence : when data save local storage

// class AppPreference {
//   static final AppPreference _appPreference = AppPreference._internal();

//   factory AppPreference() {
//     return _appPreference;
//   }

//   AppPreference._internal();

//   late SharedPreferences _preferences;

//   Future<void> initialAppPreference() async {
//     _preferences = await SharedPreferences.getInstance();
//   }

//   Future setString(String key, String value) async {
//     log("SetString = $value");
//     await _preferences.setString(key, value);
//   }

//   String getString(String key, {String defValue = ''}) {
//     return _preferences.getString(key) != null
//         ? (_preferences.getString(key) ?? '')
//         : defValue;
//   }

//   // Future setInt(String key, int value) async {
//   //   await _preferences.setInt(key, value);
//   // }

//   // int getInt(String key, {int defValue = 0}) {
//   //   return _preferences.getInt(key) != null
//   //       ? (_preferences.getInt(key) ?? 0)
//   //       : defValue;
//   // }

//   // Future setBool(String key, bool value) async {
//   //   await _preferences.setBool(key, value);
//   // }

//   // bool getBool(String key, {bool defValue = false}) {
//   //   return _preferences.getBool(key) ?? defValue;
//   // }

//   Future clearSharedPreferences() async {
//     await _preferences.clear();
//   }

//   Future removeSharedPreferences({String? key}) async {
//     await _preferences.remove(key ?? '');
//   }

//   // String get deviceId => getString(PreferencesKey.deviceId);
//   // String get studentId => getString(PreferencesKey.studentId);
//   // String get deviceType => getString(PreferencesKey.deviceType);
//   // bool get isLowercase => getBool(PreferencesKey.isLowercase);
//   String get token => getString(PreferencesKey.token);
// }
