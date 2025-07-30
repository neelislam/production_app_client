import 'package:flutter/material.dart';
import 'package:production_app_client/pages/widgets/drop_down_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BooksShop', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
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
              DropDownButton(
                items: ['Price: Low to high', 'Price: Low to high'],
                selectedItemText: 'Price Sort',
                onSelected: (selected) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
