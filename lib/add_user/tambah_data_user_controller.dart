
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TambahDataUserController extends GetxController{

  var isLoading  = true.obs;
  var isError    = false.obs;
  var errmsg     = "".obs;

  Future<String> tambahPengguna(String nama, String email, String gender, String status) async{

    Dio dio = Dio();
    var baseUrl = 'https://gorest.co.in/public/v2/users';
    final form = {
      'name'  : nama,
      'email'  : email,
      'gender' : gender,
      'status' : status
    };

    dio.options.headers['Authorization'] = 'Bearer 70bcda2768418451bc8473145af3efbf249da0570ad8574633d326387a3a86f6';
    
    isLoading(true);

    try {
      final result = await dio.post(baseUrl, data: form);
      isLoading(false);
      isError(false);

      print("Inj hsl $result");
      return "null";
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }
}