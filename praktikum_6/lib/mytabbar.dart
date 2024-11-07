import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Selamat Pagi!',
            style: TextStyle(color: Color.fromARGB(255, 248, 208, 31)), // Warna teks untuk kontras
          ),
          backgroundColor: Colors.white70, // Warna latar belakang AppBar
          bottom: const TabBar(
            labelColor: Color.fromARGB(255, 245, 223, 29), // Warna label yang dipilih
            unselectedLabelColor: Color.fromARGB(255, 243, 211, 31), // Warna label yang tidak dipilih
            indicatorColor: Colors.black, // Warna garis bawah indikator tab
            tabs: [
              Tab(
                icon: Icon(Icons.home_filled),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.camera_enhance_rounded),
                text: "Post",
              ),
              Tab(
                icon: Icon(Icons.account_circle),
                text: "Profile",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Halaman Home'), // Konten halaman Home
            ),
            Center(
              child: Text('Halaman Post'), // Konten halaman Post
            ),
            Center(
              child: Text('Halaman Profile'), // Konten halaman Profile
            ),
          ],
        ),
      ),
    );
  }
}