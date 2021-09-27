import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static const String userIdKey = 'USER_ID_KEY';

  static Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  static Future<void> setUserId({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userIdKey, id);
  }

  static Future<void> removeUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userIdKey);
  }
}
