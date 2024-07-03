import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  factory LocalService() => _singleton;

  static final LocalService _singleton = LocalService._internal();

  late SharedPreferences prefs;

  LocalService._internal();

  Future<void> initLocal() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setValue({required String key, required String value}) async =>
      await prefs.setString(key, value);

  String? getValue({required String key}) => prefs.getString(key);

  String? getToken() => getValue(key: "token");

  Future<void> clear() async => await prefs.clear();

  Future<void> setCredentails(
      {required String id,
      required String token,
      required String email}) async {
    await setValue(key: "id", value: id);
    await setValue(key: "token", value: token);
    await setValue(key: "email", value: email);
  }

  bool isUserLogedIn() {
    String? data = getValue(key: "token");
    return data != null ? true : false;
  }
}
