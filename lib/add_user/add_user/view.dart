import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Add_userPage extends StatelessWidget {
  final logic = Get.put(Add_userLogic());
  final state = Get.find<Add_userLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
