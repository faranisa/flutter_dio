import 'package:flutter/material.dart';
import 'package:flutter_crud_wtih_dio/read_user/tampil_user.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType){
        return GetMaterialApp(
          title: 'Flutter CRUD with Dio Package',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: const TampilUser(),
        );
      }
  ));
}
