import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;


import '../model/Read_user.dart';
import '../service/dio_helper.dart';
import '../service/tampil_user_repository.dart';

class TampilUserController extends GetxController {

  var isLoading  = true.obs;
  var isError    = false.obs;
  var errmsg     = "".obs;
  var acountData = <ReadUser>[].obs;
  var data       = [].obs;

  Dio dio = Dio();

  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<ReadUser>> getUser() async {
    isLoading(true);

    try {
      final result = await ApiClient().getData(ApiConst.path);
      final List data = result;
      isLoading(false);
      isError(false);
      acountData.value = data.map((e) => ReadUser.fromJson(e)).toList();
      return acountData;
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }

  showToast(fName, lName, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$fName  $lName"),
    ));
  }

  filterCariPengguna(String query){

    if (query.isEmpty) {
      data.value = acountData;
    }
    var newList = <ReadUser>[];
    for (var element in acountData) {
      if (element.contains(query)) {
        newList.add(element);
      }
    }
    data.value = newList;
  }
}

// class TampilUserController extends GetxController {
//
//   var isLoading  = true.obs;
//   var isError    = false.obs;
//   var errmsg     = "".obs;
//   var acountData = <ReadUser>[].obs;
//   var data       = [].obs;
//
//   Dio dio = Dio();
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getUser();
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   Future<List<ReadUser>> getUser() async {
//     isLoading(true);
//
//     try {
//       final result = await ApiClient().getData(ApiConst.path);
//       final List data = result;
//       isLoading(false);
//       isError(false);
//       acountData.value = data.map((e) => ReadUser.fromJson(e)).toList();
//       return acountData;
//     } catch (e) {
//       isLoading(false);
//       isError(true);
//       errmsg(e.toString());
//       throw Exception(e);
//     }
//   }
//
//   showToast(fName, lName, context) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text("$fName  $lName"),
//     ));
//   }
//
//   filterCariPengguna(String query){
//     if (query.isEmpty) {
//       data.value = acountData;
//     }
//     var newList = <ReadUser>[];
//     for (var element in acountData) {
//       if (element.contains(query)) {
//         newList.add(element);
//       }
//     }
//     data.value = newList;
//   }
// }