// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:food/model/food_model.dart';

class FoodServices {
  static const String _url = 'https://dummyjson.com/recipes';
  final dio = Dio();

  List<Food> _List = [];

  Future<List<Food>> getFood() async {
    try {
      var response = await dio.get(_url);
      var responseList = jsonDecode(jsonEncode(response.data))['recipes'];

      if (responseList is List) {
        // print('birinci durumda');
        _List = responseList.map((e) => Food.fromJson(e)).toList();
      } else {
        // print('Response verisi bir liste değil');
      }

      // print('hata  ${_List}');
      return _List;
    } catch (e) {
      print('Hata oluştu: $e');
      return [];
    }
  }
}
