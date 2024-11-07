import 'package:ecommerce_navigation_notification/screens/product_detail_page.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      title: 'Basreng Pedas',
      description:
          'Basreng, singkatan dari "bakso goreng," adalah camilan khas Sunda yangA terbuat dari bakso ikan atau bakso sapi yang diiris tipis dan kemudian digoreng. Makanan ini memiliki tekstur yang bervariasi, bisa digoreng hingga kering sehingga renyah seperti kerupuk, atau setengah matang yang memberikan rasa kenyal saat dikunyah.',
      price: 12000,
      imageUrl:
          'https://akcdn.detik.net.id/community/media/visual/2022/01/06/bakso-gorengbasreng_43.jpeg?w=700&q=90',
    ),
    Product(
      id: '2',
      title: 'Mi Lidi',
      description:
          'Mie lidi adalah jajanan khas Indonesia yang terbuat dari adonan tepung sagu dan tepung terigu, dibentuk menyerupai lidi, dan digoreng hingga garing. Camilan ini memiliki tekstur yang renyah dan sering kali dibumbui dengan berbagai rasa, seperti pedas, balado, atau keju.',
      price: 11000,
      imageUrl:
          'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/1/29/ccf283ce-4b80-41b9-bbbb-a1c7ec352361.jpg.webp?ect=4g',
    ),
    Product(
      id: '3',
      title: 'Keripik Cireng',
      description:
          'Keripik cireng pedas adalah camilan khas Indonesia yang terbuat dari adonan tepung tapioka yang dibentuk pipih dan digoreng hingga garing. Camilan ini dikenal dengan rasa pedas yang menggugah selera, biasanya ditambahkan dengan bumbu cabai dan rempah-rempah yang membuatnya semakin nikmat.',
      price: 10000,
      imageUrl:
          'https://cdn.orderonline.id/uploads/5272361660557311691-original.png',
    ),
    Product(
      id: '4',
      title: 'Makaroni Pedas',
      description:
          'Makaroni pedas adalah camilan lezat yang terbuat dari makaroni yang digoreng hingga renyah, kemudian dibumbui dengan berbagai rempah dan cabai untuk memberikan rasa pedas yang menggugah selera.',
      price: 13500,
      imageUrl:
          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/4a4a467b-ffbf-4419-b862-fe5627e9e46c_4e6af633-c59f-4caf-a079-2d38b12c4423_Go-Biz_20200513_192659.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Camilanku'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 230, 154, 13)),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ProductDetailScreen(product: products[i]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: products[i]
                    .backgroundColor, // Warna latar belakang untuk kontainer produk
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(products[i].imageUrl, fit: BoxFit.cover),
                ),
                footer: Container(
                  color: products[i].backgroundColor ??
                      const Color.fromARGB(255, 230, 154, 13), // Terapkan backgroundColor pada footer
                  child: GridTileBar(
                    backgroundColor: Colors.transparent, // Set agar transparan
                    title: Text(
                      products[i].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black), // Warna teks agar kontras
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}