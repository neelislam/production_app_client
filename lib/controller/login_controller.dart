import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user/user.dart';

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerNumberController = TextEditingController();



  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }

  adduser(){

    try {
      if(registerNameController.text.isEmpty || registerNumberController.text.isEmpty){
        Get.snackbar(
          'Error',
          'Please enter yur name and number',
          colorText: Colors.green,
        );
        return;
      }
      DocumentReference doc = userCollection.doc();
      User user = User(id: doc.id,
          name: registerNameController.text,
          number:  int.parse(registerNumberController.text));

      final userJson = user.toJson();
      doc.set(userJson);
      Get.snackbar(
        'Success',
        'User added successfully',
        colorText: Colors.green,
      );
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }
}
