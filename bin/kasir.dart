import 'dart:io';

typedef Produk = ({String nama, String kategori, int harga});

void main() {
  // 1. Katalog produk menggunakan Map dan record
  final Map<String, Produk> katalog = {
    'P01': (nama: 'Kopi Sidikalang 250g', kategori: 'Minuman', harga: 45000),
    'P02': (nama: 'Bika Ambon', kategori: 'Makanan', harga: 65000),
    'P03': (nama: 'Teh Kayu Aro 100g', kategori: 'Minuman', harga: 25000),
    'P04': (nama: 'Gula Aren 500g', kategori: 'Makanan', harga: 30000),
    'P05': (nama: 'Bolu Meranti', kategori: 'Makanan', harga: 80000),
    'P06': (nama: 'Dodol Medan', kategori: 'Makanan', harga: 35000),
  };

  // 2. Tampilan judul aplikasi
  print('==============================================');
  print('             KASIR TOKO OLEH-OLEH');
  print('                  KHAS MEDAN');
  print('==============================================');

  // 3. Menampilkan daftar produk
  print('\nDAFTAR PRODUK');
  print('----------------------------------------------');
  print('Kode'.padRight(8) + 'Nama Produk'.padRight(25) + 'Harga'.padLeft(10));
  print('----------------------------------------------');

  katalog.forEach((kode, produk) {
    print(
      kode.padRight(8) +
          produk.nama.padRight(25) +
          produk.harga.toString().padLeft(10),
    );
  });

  print('----------------------------------------------');

  // 4. Input pesanan pelanggan
  stdout.write('\nMasukkan pesanan (contoh: P01x2, P02x1): ');
  final String inputPesanan = stdin.readLineSync() ?? '';

  // 5. Menyiapkan keranjang belanja dan daftar pesanan ditolak
  final List<Map<String, Object>> keranjang = [];
  final List<String> pesananDitolak = [];

  // 6. Memisahkan pesanan berdasarkan tanda koma
  final List<String> daftarPesanan = inputPesanan.split(',');

  for (final pesanan in daftarPesanan) {
    // Memisahkan kode produk dan jumlah
    final List<String> bagian = pesanan.trim().split('x');

    if (bagian.length != 2) {
      pesananDitolak.add(pesanan.trim());
      continue;
    }

    final String kode = bagian[0].trim().toUpperCase();
    final int? jumlah = int.tryParse(bagian[1].trim());

    // Memeriksa ketersediaan produk
    final Produk? produk = katalog[kode];

    if (produk == null || jumlah == null || jumlah <= 0) {
      pesananDitolak.add(pesanan.trim());
      continue;
    }

    // 7. Menghitung subtotal setiap produk
    final int subtotal = produk.harga * jumlah;

    // Memasukkan produk ke keranjang
    keranjang.add({
      'nama': produk.nama,
      'kategori': produk.kategori,
      'harga': produk.harga,
      'jumlah': jumlah,
      'subtotal': subtotal,
    });
  }

  // 8. Menghitung total belanja menggunakan fold
  final int totalBelanja = keranjang.fold<int>(
    0,
    (total, item) => total + (item['subtotal'] as int),
  );

  // 9. Menghitung diskon 10% jika belanja minimal Rp100.000
  final int diskon = totalBelanja >= 100000 ? (totalBelanja * 0.10).round() : 0;

  // 10. Menghitung total pembayaran
  final int totalBayar = totalBelanja - diskon;

  // 11. Mengumpulkan kategori produk menggunakan Set
  final Set<String> kategoriDibeli = keranjang
      .map((item) => item['kategori'] as String)
      .toSet();

  // 12. Menampilkan struk belanja
  print('\n==============================================');
  print('                 STRUK BELANJA');
  print('==============================================');

  if (keranjang.isEmpty) {
    print('Tidak ada pesanan yang valid.');
  } else {
    for (final item in keranjang) {
      print('${item['nama']}');
      print(
        '${item['jumlah']} x Rp${item['harga']} '
        '= Rp${item['subtotal']}',
      );
    }
  }

  print('----------------------------------------------');
  print('Total Belanja : Rp$totalBelanja');
  print('Diskon        : Rp$diskon');
  print('Total Bayar   : Rp$totalBayar');
  print('----------------------------------------------');

  // 13. Menampilkan kategori produk yang dibeli
  if (kategoriDibeli.isNotEmpty) {
    print('Kategori Produk Dibeli:');

    for (final kategori in kategoriDibeli) {
      print('- $kategori');
    }

    print('----------------------------------------------');
  }

  // 14. Menampilkan pesanan yang ditolak
  if (pesananDitolak.isNotEmpty) {
    print('Pesanan yang ditolak:');

    for (final pesanan in pesananDitolak) {
      print('- $pesanan');
    }

    print('----------------------------------------------');
  }

  print('==============================================');
  print('       TERIMA KASIH TELAH BERBELANJA');
  print('==============================================');

  // 15. Menampilkan pesanan yang dimasukkan
  print('\nPesanan yang dimasukkan: $inputPesanan');
}
