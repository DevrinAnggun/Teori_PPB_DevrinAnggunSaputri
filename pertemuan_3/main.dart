// void main() {
// int a = 10;
// int b = 5;
// print(a >= b ? true : false);

// int? a; // nullable variable
// a = 10;
// print(a);

// List<String> daftarMahasiswa = ["Agus", "Budi", "caca"];
// for (var mahasiswa in daftarMahasiswa) {
//   print(mahasiswa);
// }

//   double sum(double a, double b) {
//     return a + b;
//   }
//   void main() {
//     print(sum(10, 20));
//   }
// }

// List<String> daftarMahasiswa(List<String> mahasiswa) {
//   mahasiswa.add("Dedi");
//   return mahasiswa;
// }

// void main() {
//   print(rerataIPKMahasiswa([3.9,3.88,3.77,4.00,3.55]));
//   // Rata rata nilai mahasiswa adalah 3.87
// }

// double rerataIPKMahasiswa(List<double> nilai) {
//   double total = nilai.reduce((a, b) => a + b);  // Menjumlahkan semua nilai
//   return total / nilai.length;  // Menghitung rata-rata
// }

class Animal {
  String name;
  int age;
  Animal(this.name, this.age);
}

void main() {
  Animal cat = Animal("Kucing", 2);
  print(cat.name);
  print(cat.age);
  Animal dog = Animal("Anjing", 3);
  print(dog.name);
  print(dog.age);
}

