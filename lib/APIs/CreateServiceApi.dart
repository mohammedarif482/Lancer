import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lancer1/DioConfig/configDio.dart';
import 'package:lancer1/Model/CreateServiceModel.dart';
import 'package:lancer1/View/Screens/Seller/SellerMain.dart';

CreateServicePost(
  BuildContext context,
  CreateServiceModel createService,
  String token,
) async {
  try {
    String data = createServiceToJson(createService);
    print(data);

    dynamic response = await globalDio.post(
      "/services",
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SellerMain()),
        (route) => false);
  } on DioError catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.response!.data),
      ),
    );
  }
}
