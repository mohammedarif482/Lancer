import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lancer1/Model/SubCategoryModel.dart';

import '../DioConfig/configDio.dart';

class ShowSubCategory extends GetxController {
  // List<SubCategory> subcategories = [];
  SubCategory? subcategory;
  @override
  Future<List<Subcategory>?> fetchSubCategory(
    String id,
    BuildContext context,
  ) async {
    try {
      dynamic response = await globalDio.get('/category/$id');
      if (response == null) {
        return null;
      }
      // print(response.data);
      subcategory = SubCategory.fromJson(jsonDecode(response.data));
      print(subcategory!.subcategory);
      return subcategory!.subcategory;
    } on DioError catch (e) {
      print('the error is ${e.message}');
    }

    update();
  }
}
