import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: const Color.fromARGB(255, 230, 154, 13), // Sesuaikan dengan warna utama aplikasi
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Mengatur posisi ke tengah
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(
                  16.0), // Kotak dengan padding di sekitar gambar
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200], // Warna latar belakang kotak gambar
                ),
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(product.imageUrl),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Rp ${product.price}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 223, 167, 102),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                product.description,
                textAlign:
                    TextAlign.center, // Mengatur teks deskripsi ke tengah
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}