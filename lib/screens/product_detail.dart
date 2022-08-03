import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Map<dynamic, dynamic> product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
      ),
      body: Column(
        // membuat frame tampilan produt
        children: [
          Container(
            child: Image.network(product['img_url']),
          ),
          SizedBox(
            height: 20,
          ),
        
          // penampilan detail product
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // text
                  Text(product['price'], style: TextStyle(fontSize: 22)),
                  
                  // button action
                  Row(
                    children: [
                      Icon(Icons.edit),
                      Icon(Icons.delete)
                    ],
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}