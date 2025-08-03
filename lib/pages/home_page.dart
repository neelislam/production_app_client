import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:production_app_client/pages/login_page.dart';
import 'package:production_app_client/pages/product_description.dart';
import 'package:production_app_client/pages/widgets/drop_down_button.dart';
import 'package:production_app_client/pages/widgets/multi_select_dropdown.dart';
import 'package:production_app_client/pages/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BooksShop', style: TextStyle(fontWeight: FontWeight.bold)),
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductCard(
                  name: 'English Book',
                  imageUrl:
                      'https://t3.ftcdn.net/jpg/04/98/10/60/360_F_498106090_1dXlGGTRtmPoZuBdDOT70lSF9qgFZQ1r.jpg',
                  price: '200',
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
  }
}
