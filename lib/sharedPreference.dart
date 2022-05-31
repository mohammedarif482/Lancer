import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SaveId {
  static late SharedPreferences _preferences;
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future saveId(String id) async {
    var result = await _preferences.setString("id", id);
    print(result);
  }

  static getId() {
    return _preferences.getString("id");
  }

  static getUserData() {
    return _preferences.getString('userData');
  }

  static deleteId() async {
    var result = await _preferences.remove("id");
    print(result);
  }
  //============token==================

  static Future saveToken(String token) async {
    var result = await _preferences.setString("token", token);
    print(result);
  }

  static getToken() {
    return _preferences.getString("token");
  }

  static deleteToken() async {
    var result = await _preferences.remove("token");
    print(result);
  }
  //============userinfo==================

  static Future saveRole(List<String> role) async {
    var result = await _preferences.setStringList("role", role);
    print(result);
  }

  static getRole() {
    return _preferences.getStringList("role");
  }

  static deleteRole() async {
    var result = await _preferences.remove("role");
    print(result);
  }

  static saveUserData(Map userData) {
    String encodedMap = json.encode(userData);

    print('Naveeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeen');

    print(encodedMap);


    final map = jsonDecode(encodedMap);

    print('EEEEEEeeeeeemma');
    print(map['email']);

    _preferences.setString('userData', encodedMap);
  }
}
