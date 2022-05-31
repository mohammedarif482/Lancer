import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lancer1/DioConfig/configDio.dart';
import 'package:lancer1/Model/SignInResponse.dart';

import '../View/Screens/Buyer/UserMain.dart';
import '../sharedPreference.dart';

Future googleLogin(BuildContext context) async {
  
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  late SignInResponse userinfo;

  // GoogleSignInAccount get user => _user!;

  String idToken = '';
  final googleUser = await googleSignIn.signIn();

  if (googleUser == null) {
    return;
  }

  _user = googleUser;

  final googleAuth = await googleUser.authentication;
  idToken = googleAuth.idToken!;

  print('=======================');
  print(idToken);
  print(_user);

  try {
    dynamic response = await globalDio.post(
      '/auth/users/signin/google',
      data: {"tokenId": idToken},
    );
    var map = jsonDecode(response.data);
    userinfo = signInResponseFromJson(response.data);

    SaveId.saveUserData(map);
    SaveId.saveToken(userinfo.token!);
    SaveId.saveId(userinfo.id!);
    SaveId.saveRole(userinfo.role!);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => UserMain())),
        (route) => false);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      // String message = e.response!.data.toString();
      SnackBar(
        content: Text(e.toString()),
      ),
    );
  }
}
