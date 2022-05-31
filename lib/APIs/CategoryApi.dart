import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lancer1/DioConfig/configDio.dart';
import '../Model/categoryModel.dart';

class FetchCategory extends GetxController {
  List<Category> category = [];
  @override
  void onInit() {
    fetchCategory();

    super.onInit();
  }

  Future<List<Category>?> fetchCategory() async {
    try {
      Response response = await globalDio.get('/category');
      if (response == null) {
        return null;
      }
      category = categoryFromJson(response.data);
      print(category);

      print(
          '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    } on DioError catch (e) {
      print(e);
      print(
          '=====================================================================');
    }
    update();
  }
}




















