import 'Karyawan.dart';
import 'ProdukDigital.dart';
import 'Perusahaan.dart';

// Fungsi Utama
void main() {
  // Membuat produk digital
  ProdukDigital produk1 = ProdukDigital(
    namaProduk: 'Sistem Manajemen Data',
    harga: 150000,
    kategori: KategoriProduk.DataManagement,
  );

  ProdukDigital produk2 = ProdukDigital(
    namaProduk: 'Sistem Otomasi Jaringan',
    harga: 250000,
    kategori: KategoriProduk.NetworkAutomation,
  );

  // Menerapkan diskon jika berlaku
  produk2.jumlahTerjual = 51;
  print(
      "Harga sebelum diskon untuk produk ${produk2.namaProduk} = ${produk2.harga}");
  produk2.terapkanDiskon();
  print("Harga setelah diskon \t\t\t\t\t  = ${produk2.harga} \n");

  // Membuat karyawan
  KaryawanTetap karyawan1 = KaryawanTetap('Andi', umur: 30, peran: 'Developer');
  KaryawanKontrak karyawan2 = KaryawanKontrak('Budi', umur: 28, peran: 'NetworkEngineer');

  // Menambah karyawan ke perusahaan
  Perusahaan perusahaan = Perusahaan();
  
  perusahaan.tambahKaryawan(karyawan1);
  karyawan1.updateProduktivitas(80);
  perusahaan.tambahKaryawan(karyawan2);
  karyawan2.updateProduktivitas(30);

  // Karyawan resign
  perusahaan.resignKaryawan(karyawan1);

  // Membuat proyek dan mengelola fase proyek
  Proyek proyek1 = Proyek(DateTime.now().subtract(Duration(days: 46)));
  proyek1.tambahKaryawan(karyawan1);
  proyek1.tambahKaryawan(karyawan2);
  print("");
  proyek1.lanjutKePengembangan();
  proyek1.lanjutKeEvaluasi();
}
