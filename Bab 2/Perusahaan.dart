import 'Karyawan.dart';

// Enum untuk Fase Proyek
enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

// Kelas Perusahaan dengan pembatasan jumlah karyawan aktif
class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];
  final int batasKaryawanAktif = 20;

  void tambahKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < batasKaryawanAktif) {
      if (karyawan is KaryawanKontrak) {
        print(
            "${karyawan.nama} telah ditambahkan sebagai karyawan aktif dan merupakan karyawan kontrak");
      } else if (karyawan is KaryawanTetap) {
        print(
            "${karyawan.nama} telah ditambahkan sebagai karyawan aktif dan merupakan karyawan tetap");
      } else {
        print("${karyawan.nama} telah ditambahkan sebagai karyawan aktif.");
      }
      
      karyawanAktif.add(karyawan);
    } else {
      print("Karyawan aktif mencapai batas maksimal.");
    }
  }

  void resignKaryawan(Karyawan karyawan) {
    karyawanAktif.remove(karyawan);
    karyawanNonAktif.add(karyawan);
    print("${karyawan.nama} sekarang adalah karyawan non-aktif.");
  }
}

// Class Proyek dengan Fase Proyek
class Proyek {
  FaseProyek faseSaatIni = FaseProyek.Perencanaan;
  List<Karyawan> timProyek = [];
  DateTime tanggalMulai;

  Proyek(this.tanggalMulai);

  void tambahKaryawan(Karyawan karyawan) {
    timProyek.add(karyawan);
  }

  void lanjutKePengembangan() {
    if (faseSaatIni == FaseProyek.Perencanaan && timProyek.length >= 5) {
      faseSaatIni = FaseProyek.Pengembangan;
      print("Proyek beralih ke fase Pengembangan.");
    } else {
      print("Syarat tidak terpenuhi untuk beralih ke fase Pengembangan.");
    }
  }

  void lanjutKeEvaluasi() {
    if (faseSaatIni == FaseProyek.Pengembangan &&
        DateTime.now().difference(tanggalMulai).inDays > 45) {
      faseSaatIni = FaseProyek.Evaluasi;
      print("Proyek beralih ke fase Evaluasi.");
    } else {
      print("Syarat tidak terpenuhi untuk beralih ke fase Evaluasi.");
    }
  }
}
