import 'package:flutter/material.dart';
import 'package:flutter_crud_wtih_dio/add_user/tambah_data_user.dart';
import 'package:flutter_crud_wtih_dio/read_user/tampil_user_controller.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../detail_user/detail_data_user.dart';

class TampilUser extends StatefulWidget {
  const TampilUser({Key? key}) : super(key: key);

  @override
  State<TampilUser> createState() => _TampilUserState();
}

class _TampilUserState extends State<TampilUser> {

  TextEditingController editingController = TextEditingController();
  final TampilUserController tampilUserController = Get.put(TampilUserController());

  late int selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      Get.offAll(const TambahData());
    });
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    tampilUserController.acountData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Flutter CRUD With Dio Package")),
      body: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    tampilUserController.filterCariPengguna(value);
                  },
                  controller: editingController,
                  decoration: const InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                  child: Obx(() {
                    if (tampilUserController.isLoading.value) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey[400]!,
                          highlightColor: Colors.grey[300]!,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              height: 100,
                              width: 200,
                            ),
                          ));
                    } else if (tampilUserController.isError.value) {
                      return Text(
                          "Error: ${tampilUserController.errmsg.value.capitalize}");
                    } else{
                      return ListView.separated(

                        separatorBuilder: (BuildContext context, int index) {
                         return SizedBox(height: 1.h);
                        },
                        itemCount: tampilUserController.acountData.length,
                        itemBuilder: (context, index)=> InkWell(
                            onTap: (){
                              Get.to(const DetailData(), arguments: tampilUserController.acountData[index]);
                            },
                          child: Container(
                            height: MediaQuery.of(context).size.height/8,
                            margin: const EdgeInsets.only(top: 2, bottom: 2),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30)
                              ),
                              color: Color(0xff008080),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(tampilUserController.acountData[index].name, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
                                  ),

                                  Expanded(
                                    child: Text(tampilUserController.acountData[index].email, style: TextStyle(color: Colors.white, fontSize: 9.sp),),
                                  ),

                                  Expanded(
                                    child: Text("Status : ${tampilUserController.acountData[index].status}", style: TextStyle(color: Colors.white, fontSize: 8.sp),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      );
                    }

                  })
              ),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

