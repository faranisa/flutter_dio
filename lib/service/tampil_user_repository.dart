import 'package:dio/dio.dart';

import 'dio_helper.dart';

class ApiClient {
  Future getData(String path) async {
    try {
      final resonse =
      await Dio(BaseOptions(baseUrl: ApiConst.baseUrl)).get(path);
      return resonse.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}