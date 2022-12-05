import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/Read_user.dart';

class EditDataController extends GetxController{

  late ReadUser data;
  var isLoading  = true.obs;
  var isError    = false.obs;
  var errmsg     = "".obs;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments;
  }

  Future<String> editPengguna(int id, String nama, String email, String gender, String status) async{

    Dio dio = Dio();
    var baseUrl = 'https://gorest.co.in/public/v2/users/$id';
    final form = {
      'name'  : nama,
      'email'  : email,
      'gender' : gender,
      'status' : status
    };

    dio.options.headers['Authorization'] = 'Bearer 70bcda2768418451bc8473145af3efbf249da0570ad8574633d326387a3a86f6';

    isLoading(true);

    try {
      final result = await dio.put(baseUrl, data: form);
      isLoading(false);
      isError(false);

      print("Inj hsl update $result");
      return "null";
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }
}