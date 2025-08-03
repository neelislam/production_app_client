import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product/product.dart';

class HomeController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  List<Product>products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProduct();
    super.onInit();
  }
  //Fetch the product
  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrieveProduct = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrieveProduct);
      Get.snackbar('Success', 'Product fetched successfully',
          colorText: Colors.purpleAccent);

    } catch (e) {
      Get.snackbar('Error', e.toString(),
          colorText: Colors.red);
      print(e);
    }
    finally{
      update();
    }
  }

}