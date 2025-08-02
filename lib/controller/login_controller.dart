import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

import '../models/user/user.dart';
import '../pages/home_page.dart';

class LoginController extends GetxController {


  GetStorage box = GetStorage();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerNumberController = TextEditingController();
  TextEditingController loginNumberController = TextEditingController();

  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShow = false;
  int? otpSend ;
  int? otpEntered;


  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }


  @override
  void onReady(){
    Map<String, dynamic>user = box.read('loginUser');
    if(user != null){
      Get.to(HomePage());
    }
    super.onReady();
  }

  adduser(){

    try {
      if(otpSend == otpEntered){
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
        registerNameController.clear();
        registerNumberController.clear();
        otpController.clear();

      } else {
        Get.snackbar(
          'Error',
          'OTP not correct!',
          colorText: Colors.green,
        );

      }

    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }



  sendOtp(){
    try {
      if(registerNameController.text.isEmpty || registerNumberController.text.isEmpty){
        Get.snackbar(
          'Error',
          'Empty or Wrong input',
          colorText: Colors.red,
        );
        return;
      }
      final random = Random();
      int otp = 1000+ random.nextInt(9000);
      print(otp);
      if(otp != null){
            otpFieldShow = true;
            otpSend = otp;
            Get.snackbar(
              'Success',
              'Otp sent Successfully!!',
              colorText: Colors.blue,
            );

          } else {
            Get.snackbar(
              'Error',
              'Otp not send !!',
              colorText: Colors.red,
            );
          }
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }
  
  
  // Future<void> loginWithPhone() async {
  //   String phoneNumber = loginNumberController.text;
  //   if(phoneNumber.isEmpty){
  //     var querySnapshot = await userCollection.where('number',isEqualTo: phoneNumber).limit(1).count();
  //   if(querySnapshot.docs.isNotEmpty){
  //     var userDoc = querySnapshot.docs.first;
  //     var userData = userDoc.data() as Map<String, dynamic>;
  //     box.write('loginUser' , userData);
  //      loginNumberController.clear();
//        Get.to(HomePage());
  //     Get.snackbar(
  //       'Success',
  //       'Login Successfully',
  //       colorText: Colors.green,
  //     );
  //
  //
  //   } else {
  //     Get.snackbar(
  //       'Error',
  //       'Login Failed',
  //       colorText: Colors.green,
  //     );
  //   }
  //   }
  // }
}
