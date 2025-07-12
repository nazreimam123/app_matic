// import 'dart:convert';

import 'dart:developer';

import 'package:app_matic/src/model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api2Service {
  final Dio _dio = Dio();

  Future<List<Appmatic>> fetchData() async {
    log('fetch data called');
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');
      log('response: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (kDebugMode) {
          print(response.statusCode);
        }
        // return AppmaticFromJson(response.data);
        return List<Appmatic>.from(
          response.data.map((x) => Appmatic.fromJson(x)),
        );
        // return (response.data as List)
        //     .map((json) => Appmatic.fromJson(json))
        //     .toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
