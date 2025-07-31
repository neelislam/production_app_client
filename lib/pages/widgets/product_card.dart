import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final String offerTag;
  const ProductCard({super.key, required this.name, required this.imageUrl, required this.price, required this.offerTag});

  @override
  Widget build(BuildContext context) {
    return Card(
elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //pass image url later
            Image.network( 'https://m.media-amazon.com/images/I/41as+WafrFL._SX331_BO1,204,203,200_.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 120,
            ),
            SizedBox(height: 9,),
            Text(name,
            style: TextStyle(
              fontSize: 16,
            ), overflow: TextOverflow.ellipsis,),
            SizedBox(height: 7,),
            Text(price,
            style: TextStyle(
              fontSize: 16,
            ), overflow: TextOverflow.ellipsis,),
            SizedBox(height: 7,),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text('Tk. $price',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ), overflow: TextOverflow.ellipsis,),
            )
          ],
        ),
      ),
    );
  }
}
