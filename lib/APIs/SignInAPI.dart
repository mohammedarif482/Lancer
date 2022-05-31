import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lancer1/DioConfig/configDio.dart';
import 'package:lancer1/Model/SignInResponse.dart';
import 'package:lancer1/View/Screens/Buyer/UserMain.dart';
import 'package:lancer1/sharedPreference.dart';
import 'package:hexcolor/hexcolor.dart';

class SignInApi extends GetxController {
  static late SignInResponse userinfo;

  String? id;

  signInApi(
    BuildContext? context,
    String password,
    String email,
  ) async {
    try {
      Response response = await globalDio.post("/auth/users/signin", data: {
        "email": email,
        "password": password,
      });
      if (response == null) {
        print('--------------------no response------------------------');
        // return null;
      }
      userinfo = signInResponseFromJson(response.data);
      print(response.data);

      print('=============================================');

      // print(userinfo.role);

      var map = jsonDecode(response.data);

      SaveId.saveUserData(map);

      print(map['email']);
      // print(userid);
      SaveId.saveToken(userinfo.token!);
      SaveId.saveId(userinfo.id!);
      SaveId.saveRole(userinfo.role!);
      print('----------------------------------------------------');

      print('Response ==========${response.data}');

      Navigator.pushAndRemoveUntil(
          context!,
          MaterialPageRoute(builder: ((context) => UserMain())),
          (route) => false);
    } on DioError catch (e) {
      String message = e.response!.data.toString();
      print(
          '====================================\n====================================\n===========================Exeption catched e $e');
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }
}
