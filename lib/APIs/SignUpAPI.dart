// ignore: file_names
import 'package:dio/dio.dart';

import 'package:lancer1/DioConfig/configDio.dart';
import 'package:flutter/material.dart';
import 'package:lancer1/Model/SignUpModel.dart';
import 'package:lancer1/sharedPreference.dart';

import '../Model/SignInResponse.dart';
import '../View/Screens/Buyer/UserMain.dart';

GSignUpApi(
  String token,
) async {
  Response response = await globalDio
      .post("/auth/users/signup/google", data: {"tokenId": token});

  print(
      "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$response ++++++++++++++++++++++++++++++++++");

  // ignore: avoid_print{{URL}}/auth/otp
}

SendOTPApi(
  BuildContext context,
  String phone,
) async {
  try {
    Response response =
        await globalDio.post("/auth/otp", data: {"phone": phone});
  } catch (e) {}

  // ignore: avoid_print{{URL}}/auth/otp
}

ValidateOTPApi(
  BuildContext context,
  String name,
  String password,
  String email,
  String phone,
  String pin,
) async {
  try {
    late SignUpResponse userinfo;

    Response response = await globalDio.post("/auth/users/signup", data: {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "otp": pin,
    });

    userinfo = signUpResponseFromJson(response.data);

    SaveId.saveToken(userinfo.token!);
    SaveId.saveId(userinfo.id!);
    SaveId.saveRole(userinfo.role!);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => UserMain())),
        (route) => false);
  } on DioError catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.response!.data),
      ),
    );
    print(e.response!.data);
    print(pin);
    print(
        '====================================\n==================================r\n=============================Exeption catched  $e');
  }

  // ignore: avoid_print{{URL}}/auth/otp
}

SignUpAPI(String name, String phone, String email, String password) async {
  Response response = await globalDio.post("/auth/users/signin", data: {
    "email": email,
    "password": password,
    "name": name,
    "phone": phone
  });

  // ignore: avoid_print
  print(response);
}
