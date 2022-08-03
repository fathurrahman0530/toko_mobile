import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toko_online/screens/add_product.dart';
import 'package:toko_online/screens/product_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  Future<Map<String, dynamic>> getProducts() async {
    var response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products'));
    // print(json.decode(response.body)['data']);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
          },
          child: Icon(Icons.add),
      ),
      
      appBar: AppBar(
        title: Text('CF Teknologi'),
      ),
      body: FutureBuilder(
          // proses pemanggilan future product
          future: getProducts(),

          // proses pengambilan data product
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {

              return ListView.builder(
                  // perhitungan jumlah data product
                  itemCount: snapshot.data['data'].length,

                  // penampilan data berdasarkan jumlah product
                  itemBuilder: (context, index) {

                    //proses pembuatan card
                    return Container(
                      height: 180,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [

                            // bagian gambar product
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => ProductDetail(product: snapshot.data['data'][index],
                                    )
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                padding: EdgeInsets.all(5),
                                height: 120,
                                width: 120,
                                child: Image.network(
                                  snapshot.data['data'][index]['img_url'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    // bagian name product
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(snapshot.data['data'][index]['name'], style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
                                    ),

                                    // bagian description product
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(snapshot.data['data'][index]['description'])
                                    ),

                                    // bagian harga product
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.edit),
                                        Text(snapshot.data['data'][index]['price'].toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            } else {
              return Text('data error');
            }
          }),
    );
  }
}
