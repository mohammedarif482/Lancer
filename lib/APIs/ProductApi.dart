import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lancer1/DioConfig/configDio.dart';

Future fetchProduct(String id) async {
  Response response = await globalDio.get('/services/$id');
  Map data = jsonDecode(response.data);
  print('I am the product');
  print(data);
  return data;
}
