import 'package:test/test.dart';

void main() {
  group('Pengujian Aplikasi Kasir Toko Oleh-Oleh', () {
    test('Menghitung subtotal produk dengan benar', () {
      const int harga = 45000;
      const int jumlah = 2;

      final int subtotal = harga * jumlah;

      expect(subtotal, 90000);
    });

    test('Memberikan diskon 10% jika total minimal Rp100.000', () {
      const int totalBelanja = 155000;

      final int diskon = totalBelanja >= 100000
          ? (totalBelanja * 0.10).round()
          : 0;

      expect(diskon, 15500);
    });

    test('Tidak memberikan diskon jika total kurang dari Rp100.000', () {
      const int totalBelanja = 90000;

      final int diskon = totalBelanja >= 100000
          ? (totalBelanja * 0.10).round()
          : 0;

      expect(diskon, 0);
    });

    test('Menghitung total pembayaran setelah diskon', () {
      const int totalBelanja = 155000;
      const int diskon = 15500;

      final int totalBayar = totalBelanja - diskon;

      expect(totalBayar, 139500);
    });

    test('Menolak kode produk yang tidak tersedia', () {
      final Map<String, String> katalog = {
        'P01': 'Kopi Sidikalang',
        'P02': 'Bika Ambon',
      };

      expect(katalog.containsKey('P99'), isFalse);
    });

    test('Menolak jumlah pesanan yang bukan angka', () {
      final int? jumlah = int.tryParse('abc');

      expect(jumlah, isNull);
    });
  });
}
