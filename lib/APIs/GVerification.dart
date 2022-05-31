import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../DioConfig/configDio.dart';
import '../sharedPreference.dart';

class GoogleController extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  static GoogleSignInAccount? _user;
  String id = SaveId.getId();

  GoogleSignInAccount get user => _user!;

  String idToken = '';

  Future googleLogin(BuildContext context) async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return;
    }

    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    idToken = googleAuth.idToken!;
    send(idToken);
    print('=======================');
    print(idToken);
  }

  send(String idToken) async {
    try {
      var userData = SaveId.getUserData();

      Map map = jsonDecode(userData);

      dynamic response = await globalDio.patch(
        "/auth/users/$id/google",
        data: {
          "tokenId": idToken,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer ${map["token"]}",
          },
        ),
      );
      print(response.runtimeType);
      print('1111111111111111111111111111111111111111111111111111rr');

      print(map);

      map['isEmailVarified'] = true;
      map['idToken'] = idToken;

      SaveId.saveUserData(map);
      SaveId.saveRole([
        'buyer',
        'seller',
      ]);
      print(map);

      notifyListeners();
    } on DioError catch (e) {
      print('222222222222222222222222222222222222222222222222222222222222');
      print(id);
      print(e);
    }
  }
}
