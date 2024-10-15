import 'dart:math';

void main() {
  int A = 3; // Jumlah baris
  int B = 2; // Jumlah kolom
  createMatrixAndTranspose(A, B);
}

void createMatrixAndTranspose(int A, int B) {
  // Inisialisasi Random
  Random rand = Random();

  // Membuat matriks AxB dengan nilai acak antara 1 hingga 50
  List<List<int>> matrix = List.generate(
      A, (_) => List.generate(B, (_) => rand.nextInt(50) + 1));

  // Mencetak matriks
  print('Matriks ${A}x${B}:');
  for (var row in matrix) {
    print(row.join(' '));
  }

  // Membuat matriks transpose
  List<List<int>> transpose = List.generate(
      B, (_) => List.generate(A, (_) => 0));

  for (int i = 0; i < A; i++) {
    for (int j = 0; j < B; j++) {
      transpose[j][i] = matrix[i][j];
    }
  }

  // Mencetak matriks transpose
  print('Hasil Transpose:');
  for (var row in transpose) {
    print(row.join(' '));
  }
}
