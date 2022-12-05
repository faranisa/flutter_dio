import 'package:flutter/material.dart';
import 'package:flutter_crud_wtih_dio/detail_user/detail_data_user_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../read_user/tampil_user.dart';
import '../update_user/update_data_user.dart';

class DetailData extends StatefulWidget {
  const DetailData({Key? key}) : super(key: key);

  @override
  State<DetailData> createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {

  final DetailDataUserController detailUserController = Get.put(DetailDataUserController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Detail Data Pengguna")),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/8,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 4, bottom: 2, left: 4, right: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(25)
              ),
              color: Color(0xff008080),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text("Nama : ${detailUserController.data.name}", style: TextStyle(fontSize: 14.sp, color: Colors.white),textAlign: TextAlign.start),
              ),
            ),
          ),
          SizedBox(height: 1.h,),
          Container(
            height: MediaQuery.of(context).size.height/8,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 4, bottom: 2, left: 4, right: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(25)
              ),
              color: Color(0xff008080),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text("Email : ${detailUserController.data.email}", style: TextStyle(fontSize: 14.sp, color: Colors.white),textAlign: TextAlign.start),
              ),
            ),
          ),
          SizedBox(height: 1.h,),
          Container(
            height: MediaQuery.of(context).size.height/8,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 4, bottom: 2, left: 4, right: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(25)
              ),
              color: Color(0xff008080),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text("Gender : ${detailUserController.data.gender}", style: TextStyle(fontSize: 14.sp, color: Colors.white),textAlign: TextAlign.start),
              ),
            ),
          ),
          SizedBox(height: 1.h,),
          Container(
            height: MediaQuery.of(context).size.height/8,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 4, bottom: 2, left: 4, right: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(25)
              ),
              color: Color(0xff008080),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text("Status : ${detailUserController.data.status}", style: TextStyle(fontSize: 14.sp, color: Colors.white),textAlign: TextAlign.start),
              ),
            ),
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        textStyle: const TextStyle(color: Colors.white)),
                    onPressed: () => Get.to(const EditData(), arguments: detailUserController.data),
                    child: Container(
                      alignment: Alignment.center,
                      height: 8.h,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 34,139,34),
                            Color.fromARGB(255, 255, 177, 41)
                          ])),
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        "Edit Pengguna",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        textStyle: const TextStyle(color: Colors.white)),
                    onPressed: ()=>Get.dialog(
                      AlertDialog(
                        title: Text("Hapus Pengguna", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),),
                        content: Text("Anda Yakin Untuk Menghapus Data?", style: TextStyle(fontSize: 12.sp),),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text("Kembali", style: TextStyle(fontSize: 10.sp),),
                            onPressed: ()=> Get.back(),
                          ),
                          ElevatedButton(
                              onPressed: (){
                                detailUserController.hapusPengguna(detailUserController.data.id);
                                Get.off(const TampilUser());
                              },
                              child: Text("Ya, Hapus Data", style: TextStyle(fontSize: 10.sp),))
                        ],
                      ),
                      barrierDismissible: false,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 8.h,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 0,128,0),
                            Color.fromARGB(255, 255, 177, 41)
                          ])),
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        "Hapus Pengguna",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
          )
        ],
      ),

    );
  }
}
