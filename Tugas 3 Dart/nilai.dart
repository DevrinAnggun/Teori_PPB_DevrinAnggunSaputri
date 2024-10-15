void main() {
  // Inisialisasi list 2D sesuai spesifikasi
  List<List<int>> list2D = [
    [5, 10, 15],            // Baris 1: Kelipatan 5
    [2, 4, 6, 8],           // Baris 2: Bilangan genap
    [1, 4, 9, 16, 25],      // Baris 3: Kuadrat bilangan asli
    [3, 4, 5, 6, 7, 8]      // Baris 4: Bilangan asli mulai dari 3
  ];

  // Contoh pencarian
  cariNilaiDalamList2D(list2D, 22);
  cariNilaiDalamList2D(list2D, 5);
}

void cariNilaiDalamList2D(List<List<int>> list2D, int target) {
  bool ditemukan = false;

  for (int i = 0; i < list2D.length; i++) {
    for (int j = 0; j < list2D[i].length; j++) {
      if (list2D[i][j] == target) {
        print(
            'Bilangan yang dicari: $target berada di: baris ${i + 1} kolom ${j + 1}');
        ditemukan = true;
      }
    }
  }

  if (!ditemukan) {
    print('Bilangan yang dicari: $target tidak ditemukan dalam list.');
  }
}
