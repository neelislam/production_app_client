import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user/user.dart';

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }

  adduser(){
    try {
      DocumentReference doc = userCollection.doc();
      User user = User(id: doc.id, name: 'from neel testing', number: 1234567);

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
