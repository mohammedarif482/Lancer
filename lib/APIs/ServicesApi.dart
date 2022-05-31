import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lancer1/DioConfig/configDio.dart';
import 'package:lancer1/sharedPreference.dart';

String token = SaveId.getToken();
Future<List> fetchServices(
  String? catagory,
  int listsize,
  String search,
  String sorttitle,
  String category,
  String subcategory,
) async {
  print('hello');
  Response response = await globalDio.get(
    '/services/users?search=&page=1&pageSize=$listsize&sort[title]=1&category=&subcategory=',
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );
  Map res = jsonDecode(response.data);
  List services = res['services'];

  print(services);

  return services;
}
