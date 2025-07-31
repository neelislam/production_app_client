import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black12),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://t3.ftcdn.net/jpg/04/98/10/60/360_F_498106090_1dXlGGTRtmPoZuBdDOT70lSF9qgFZQ1r.jpg',
                fit: BoxFit.contain,

                width: double.infinity,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'English Book',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('product description', style: TextStyle(fontSize: 25)),
            SizedBox(height: 20),
            Text(
              'Tk. 200',
              style: TextStyle(
                fontSize: 25,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Enter your address here',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 15
                  ),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                  onPressed: () {}, child: Text('Buy Now')),
            ),
          ],
        ),
      ),
    );
  }
}
