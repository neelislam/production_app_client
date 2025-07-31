import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    late CollectionReference userCollection;

    @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }


    adduser() {
        try {
            DocumentReference doc = userCollection.doc();
            // Product product = Product(
            //     id: doc.id,
            //     name: productNameController.text,
            //     category: category,
            //     description: productDescriptionController.text,
            //     price: double.tryParse(productPriceController.text),
            //     brand: brand,
            //     image: productImgController.text,
            //     offer: offer,
            // );
            //
            // final productJson = product.toJson();
            // doc.set(productJson);
            // Get.snackbar(
            //     'Success',
            //     'User added successfully',
            //     colorText: Colors.green,
            // );
        } catch (e) {
            Get.snackbar('Error', e.toString(), colorText: Colors.red);
            print(e);
        }
    }


}