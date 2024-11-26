import 'package:biodata_mahasiswa/helper/db_helper.dart';
import 'package:biodata_mahasiswa/view/add_mahasiswa.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> mahasiswaList = [];

  void refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      mahasiswaList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Biodata Mahasiswa',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 212, 148, 228),
      ),
      body: mahasiswaList.isEmpty
          ? const Center(
              child: Text(
                'Belum ada data mahasiswa.',
                style: TextStyle(fontSize: 16, color: Colors.purple),
              ),
            )
          : ListView.builder(
              itemCount: mahasiswaList.length,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                final item = mahasiswaList[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      item['nama'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text('NIM: ${item['nim']}'),
                        Text('Alamat: ${item['alamat']}'),
                        Text('Hobi: ${item['hobi']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMahasiswaView(refreshData: refreshData),
            ),
          );
        },
      ),
    );
  }
}
