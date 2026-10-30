# Aplikasi Kasir Toko Oleh-Oleh Khas Medan

## Identitas Mahasiswa

- **Nama:** Juhraini Helfiana Lexa
- **NIM:** 4243550018
- **Kelas:** PSIK 24C
- **Mata Kuliah:** Pemrograman Mobile

## Deskripsi

Program ini merupakan aplikasi kasir berbasis console yang dibuat menggunakan bahasa pemrograman Dart. Aplikasi digunakan untuk membantu proses transaksi pada toko oleh-oleh khas Medan, mulai dari menampilkan katalog produk, menerima pesanan pelanggan, menghitung total belanja, memberikan diskon, hingga menampilkan struk pembayaran.

## Fitur Program

1. Menampilkan katalog enam produk oleh-oleh khas Medan.
2. Menerima pesanan dengan format `P01x2, P02x1`.
3. Memeriksa kode produk dan jumlah pesanan.
4. Menolak kode produk yang tidak tersedia atau jumlah yang tidak valid.
5. Menghitung subtotal setiap produk menggunakan `map()` dan total belanja menggunakan `fold()`.
6. Memberikan diskon 10% jika total belanja minimal Rp100.000.
7. Menampilkan kategori produk yang dibeli menggunakan `Set`.
8. Menampilkan struk pembayaran.

## Cara Menjalankan Program

Pastikan Dart SDK sudah terpasang. Buka terminal pada folder proyek, kemudian jalankan perintah berikut:

```bash
dart pub get
dart format .
dart analyze
dart test
dart run bin/kasir.dart
```

## Bukti Pengujian

### 1. Pengujian Pesanan Valid

Pesanan yang digunakan: `P01x2, P02x1`.

Hasil yang diharapkan:
- Total belanja: Rp155.000
- Diskon: Rp15.500
- Total bayar: Rp139.500

Bukti screenshot:

![Pesanan Valid 1](screenshots/pesanan-valid-1.png)

![Pesanan Valid 2](screenshots/pesanan-valid-2.png)

### 2. Pengujian Pesanan Tidak Valid

Pesanan yang digunakan: `P01x2, P99x1, P02xabc`.

Hasil yang diharapkan:
- `P01x2` berhasil diproses.
- `P99x1` ditolak karena kode produk tidak tersedia.
- `P02xabc` ditolak karena jumlah bukan angka.
- Program tetap berjalan tanpa mengalami error.

Bukti screenshot:

![Pesanan Tidak Valid 1](screenshots/pesanan-tidak-valid-1.png)

![Pesanan Tidak Valid 2](screenshots/pesanan-tidak-valid-2.png)

### 3. Pengujian Otomatis

Pengujian otomatis dilakukan menggunakan perintah `dart test`. Terdapat enam skenario pengujian yang mencakup perhitungan subtotal, pemberian diskon, perhitungan total pembayaran, pemeriksaan kode produk, dan validasi jumlah pesanan.

Hasil pengujian menunjukkan bahwa keenam pengujian berhasil dijalankan dengan keterangan `All tests passed!`.

## Penjelasan Konsep Dart dan Null Safety

Pada program ini, `final` digunakan untuk menyimpan variabel yang tidak perlu diberi nilai ulang, seperti katalog produk pada baris 7, input pesanan pada baris 40, dan keranjang belanja pada baris 43–44. Meskipun variabel `final` tidak dapat diarahkan ke objek baru, isi Map atau List masih dapat ditambahkan dan diubah. `var` digunakan ketika tipe data dapat disimpulkan secara otomatis oleh Dart, sedangkan `const` digunakan untuk nilai tetap yang diketahui saat kompilasi. Program ini tidak menggunakan `var` dan `const` secara langsung karena deklarasi variabel dibuat dengan tipe data yang jelas.

Null safety diterapkan untuk mencegah kesalahan akibat nilai null. Pada baris 40, operator `??` memberikan string kosong jika input tidak tersedia. Pada baris 59, `int.tryParse()` digunakan agar input jumlah yang bukan angka menghasilkan nilai null, bukan menyebabkan program berhenti. Selanjutnya, baris 62–66 memeriksa apakah produk ditemukan dan jumlah valid sebelum pesanan dimasukkan ke keranjang. Dengan demikian, program dapat menangani input yang tidak valid dengan lebih aman.

## Penggunaan AI

Dalam pengerjaan tugas ini, ChatGPT digunakan sebagai alat bantu untuk memahami instruksi, memberikan arahan penyusunan kode, membantu pemeriksaan kesalahan, dan menjelaskan konsep Dart. Kode program tetap diperiksa dan dijalankan kembali oleh mahasiswa melalui Visual Studio Code menggunakan perintah `dart format .`, `dart analyze`, serta pengujian langsung pada aplikasi.