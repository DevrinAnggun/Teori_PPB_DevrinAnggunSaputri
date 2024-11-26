import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tp_latihan_memilih_gambar/views/camera_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _imagePath;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text(
            "Camera & Media API",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                height: 300,
                child: _imagePath != null
                    ? Image.file(
                        File(_imagePath!), // Tampilkan gambar dari path
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.image_outlined,
                        size: 200,
                        color: Colors.blue,
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraScreen(),
                      ),
                    );

                    if (result != null && result is String) {
                      setState(() {
                        _imagePath = result;
                      });
                    }
                  },
                  label: const Text(
                    "Camera",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      final XFile? image = await _imagePicker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 50,
                      );

                      if (image != null) {
                        setState(() {
                          _imagePath = image.path; // Simpan path gambar
                        });
                      }
                    } catch (e) {
                      print("Image selection error: $e");
                    }
                  },
                  label: const Text(
                    "Gallery",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.image_rounded,
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _imagePath = null; // Hapus path gambar
                });
              },
              child: const Text(
                "Hapus Gambar",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  minimumSize: MaterialStateProperty.all(const Size(300, 50))),
            ),
          ],
        ),
      ),
    );
  }
}