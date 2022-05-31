import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lancer1/APIs/SignInAPI.dart';
import 'package:lancer1/DioConfig/configDio.dart';
import 'package:lancer1/Model/BecomeSellerModel.dart';

import 'package:lancer1/Model/SignInResponse.dart';
import 'package:lancer1/View/Screens/Seller/SellerMain.dart';
import 'package:lancer1/sharedPreference.dart';

becomeSellerPost(
  BuildContext context,
  BecomeSellerModel becomseller,
  String token,
) async {
  try {
    SignInResponse? userinfo;

    String id = SaveId.getId();
    String data = becomeSellerModelToJson(becomseller);

    dynamic response = await globalDio.post(
      "/users/$id/sellers",
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    // print(userid);
    // print(response.data);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SellerMain()),
        (route) => false);
  } on DioError catch (e) {
    print(e.response!.data);
    print('Error');
  }
}
