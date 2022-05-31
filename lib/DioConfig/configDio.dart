// ignore: file_names
import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: "https://lancer.unityshop.shop/api/v2",
  responseType: ResponseType.plain,
);

Dio globalDio = Dio(options);
