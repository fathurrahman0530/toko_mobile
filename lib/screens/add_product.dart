import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name Product"),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Description Product"),
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: "Price Product"),
              ),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: "Image Product"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text("Save"),
              )
            ],
          ),
      ),
    );
  }
}