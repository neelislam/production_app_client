import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:production_app_client/controller/home_controller.dart';
import 'package:production_app_client/pages/login_page.dart';
import 'package:production_app_client/pages/product_description.dart';
import 'package:production_app_client/pages/widgets/drop_down_button.dart';
import 'package:production_app_client/pages/widgets/multi_select_dropdown.dart';
import 'package:production_app_client/pages/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
              'BooksShop', style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              onPressed: () {
                GetStorage box = GetStorage();
                box.erase();
                Get.offAll(() => LoginPage());
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),

        body: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: Chip(label: Text('Category')),
                  );
                },
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: DropDownButton(
                    items: ['Price: Low to high', 'Price: Low to high'],
                    selectedItemText: 'Price Sort',
                    onSelected: (selected) {},
                  ),
                ),
                Flexible(
                  child: MultiSelectDropdown(
                    items: ['item 1', 'item 2', 'item 3'],
                    onSelectionChanged: (selectedItems) {},
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: logic.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: logic.products[index].name ?? 'No name',
                    imageUrl: (logic.products[index].image?.isNotEmpty ?? false)
                        ? logic.products[index].image!
                        : 'https://covers.openlibrary.org/b/id/10523329-L.jpg',
                    price: logic.products[index].price ?? 0.0,
                    offerTag: '20% off',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDescription(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
