import 'package:flutter/material.dart';
import 'package:flutter_crud_wtih_dio/update_user/update_data_user_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../read_user/tampil_user.dart';

class EditData extends StatefulWidget {
  const EditData({Key? key}) : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  final EditDataController editUserController = Get.put(EditDataController());
  final GlobalKey<FormState> formKey = GlobalKey();
  final _namaController  = TextEditingController();
  final _emailController  = TextEditingController();

  String dropdownValue     = '';
  String dropdownStatValue = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _namaController.text  = editUserController.data.name;
    _emailController.text = editUserController.data.email;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Ubah Data Pengguna")),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(children: [
              TextFormField(
                controller: _namaController,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Harap isi nama pengguna'
                      : null;
                },

                decoration: const InputDecoration(
                    labelText: "Nama Pengguna", icon: Icon(Icons.person_outline)),
              ),
              SizedBox(height: size.height * 0.03),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap Masukan Email';
                  }
                  String pattern = r'\w+@\w+\.\w+';
                  if (!RegExp(pattern).hasMatch(value)) {
                    return 'Invalid E-mail Address format.';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Email', icon: Icon(Icons.mail)),
              ),
              SizedBox(height: size.height * 0.03),
              DropdownButtonFormField(
                value: dropdownValue,
                items: const [
                  DropdownMenuItem<String>(value: '', child: Text('-Pilih Jenis Kelamin-')),
                  DropdownMenuItem<String>(value: 'Female', child: Text('Female')),
                  DropdownMenuItem<String>(value: 'Male', child: Text('Male')),
                ],
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                validator: (value) {
                  if (dropdownValue == '') return 'Harap Pilih Jenis Kelamin';
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Gender', icon: Icon(Icons.female)),
              ),
              SizedBox(height: size.height * 0.03),
              DropdownButtonFormField(
                value: dropdownStatValue,
                items: const [
                  DropdownMenuItem<String>(value: '', child: Text('-Pilih Status-')),
                  DropdownMenuItem<String>(value: 'Active', child: Text('Active')),
                  DropdownMenuItem<String>(value: 'Inactive', child: Text('Inactive')),
                ],
                onChanged: (String? value) {
                  setState(() {
                    dropdownStatValue = value!;
                  });
                },
                validator: (value) {
                  if (dropdownStatValue == '') return 'Harap Pilih Status';
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Status', icon: Icon(Icons.check)),
              ),
              SizedBox(height: size.height * 0.03),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textStyle: const TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    editUserController.editPengguna(editUserController.data.id, _namaController.text, _emailController.text, dropdownValue, dropdownStatValue);
                    Get.off(const TampilUser());
                  }
                },
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
                    "Ubah Data Pengguna",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]),
          ),
        )
    );
  }
}
