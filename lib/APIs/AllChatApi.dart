import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lancer1/DioConfig/configDio.dart';
import 'package:lancer1/sharedPreference.dart';

String token = SaveId.getToken();
Future<List> fetchAllChat() async {
  Response response = await globalDio.get(
    '/chats',
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
  Map res = jsonDecode(response.data);
  List allchats = res['services'];

  print(allchats);

  return allchats;
}
