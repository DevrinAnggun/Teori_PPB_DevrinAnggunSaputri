import 'package:flutter/material.dart';
import 'package:praktikum_7/models/product.dart';
import 'package:praktikum_7/pages/detail.dart';

class Mypage extends StatelessWidget {
  Mypage({super.key});

  final List<Product> products = [
    Product(
      id: 1,
      nama: 'Mouse', 
      harga: 300000,
      imageUrl: 'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1', 
      deskripsi: 'Mouse keren andalan Mahasiswa',
    ),
    Product(
      id: 2,
      nama: 'Keyboard Mechanical', 
      harga: 350000,
      imageUrl: 'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1',
      deskripsi: 'Nyaman dipakai, Garansi 5 tahun',
    ),
    Product(
      id: 3, 
      nama: 'Headphone', 
      harga: 700000, 
      imageUrl: 'https://m.media-amazon.com/images/I/61CGHv6kmWL._AC_UF894,1000_QL80_.jpg', 
      deskripsi: 'Garansi 5 tahun, Rekomendasi Mahasiswa',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Model'),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(
              product.imageUrl,
              width: 70,
              height: 70,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
            title: Text(product.nama),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga : Rp${product.harga}'),
                Text(product.deskripsi),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailProduct(
                    data: product.nama, // Pass the correct product data
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
