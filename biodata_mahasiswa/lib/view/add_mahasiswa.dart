import 'package:flutter/material.dart';
import '../helper/db_helper.dart';

class AddMahasiswaView extends StatefulWidget {
  final Function refreshData;

  const AddMahasiswaView({Key? key, required this.refreshData})
      : super(key: key);

  @override
  _AddMahasiswaViewState createState() => _AddMahasiswaViewState();
}

class _AddMahasiswaViewState extends State<AddMahasiswaView> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _alamatController = TextEditingController();
  final _hobiController = TextEditingController();
  final dbHelper = DatabaseHelper();

  void addMahasiswa() async {
    await dbHelper.insert({
      'nama': _namaController.text,
      'nim': _nimController.text,
      'alamat': _alamatController.text,
      'hobi': _hobiController.text,
    });
    widget.refreshData();
    Navigator.pop(context);
  }

  // Method to build a text field with icon
  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 212, 148, 228),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField(
              controller: _namaController,
              label: 'Nama',
              icon: Icons.person,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _nimController,
              label: 'NIM',
              icon: Icons.book_outlined,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _alamatController,
              label: 'Alamat',
              icon: Icons.location_on,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: _hobiController,
              label: 'Hobi',
              icon: Icons.try_sms_star,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addMahasiswa,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 212, 148, 228),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
