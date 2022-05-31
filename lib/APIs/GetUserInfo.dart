import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lancer1/DioConfig/configDio.dart';

Future<Map> getUserInfo(String id) async {
  Response response = await globalDio.get('/users/$id/sellers');

  Map userinfo = jsonDecode(response.data);
  print(userinfo); 
  // Map Userinfo = res;
  print('HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH');
  print(response);
  print(userinfo);
  return userinfo;
}
