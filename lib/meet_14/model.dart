import 'package:belajar_flutter/constant/app_image.dart';
import 'package:belajar_flutter/meet_14/Model/product_model.dart';
import 'package:flutter/material.dart';

class Model extends StatefulWidget {
  const Model({super.key});

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  final List<ProductModel> products = [
    ProductModel(
      id: "1",
      productName:
          "SHF Shinkocchou Seihou Kamen Rider Double Fang Joker ( Fuuto Pi Edition Animated Anniversary ) series",
      productPrice: "250000",
      productImage: AppImage.double,
    ),
    ProductModel(
      id: "2",
      productName: "Rc Dodge Challenger SRT",
      productPrice: "250000",
      productImage: AppImage.mobil,
    ),
    ProductModel(
      id: "3",
      productName: "Pesawat Remote Controll",
      productPrice: "250000",
      productImage: AppImage.pesawat,
    ),
    ProductModel(
      id: "4",
      productName: " Rc USS Enterprise",
      productPrice: "250000",
      productImage: AppImage.kapal,
    ),
    ProductModel(
      id: "5",
      productName: " Puzzle",
      productPrice: "250000",
      productImage: AppImage.puz,
    ),
    ProductModel(
      id: "6",
      productName: " AK 47",
      productPrice: "250000",
      productImage: AppImage.tembak,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Model")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return Card(
            elevation: 4, // Tingkat elevasi (bayangan)
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ), // Jarak antar kartu
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading:
                  product.productImage != null
                      ? Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          product.productImage!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print("Error loading image: $error");
                            return Icon(Icons.error);
                          },
                        ),
                      )
                      : Icon(Icons.image_not_supported),
              title: Text(product.productName ?? "No Name"),
              subtitle: Text("Rp. ${product.productPrice ?? "0"}"),
              trailing: Icon(Icons.shopping_cart),
            ),
          );
        },
      ),
    );
  }
}
