import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.ozzao.com/';

  // Future<> fetchCovidList() async {
  //   try {
  //     Response response = await _dio.get(_url);
  //     return CovidModel.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     if (kDebugMode) {
  //       print("Exception occured: $error stackTrace: $stacktrace");
  //     }
  //     return CovidModel.withError("Data not found / Connection issue");
  //   }
  // }
}
