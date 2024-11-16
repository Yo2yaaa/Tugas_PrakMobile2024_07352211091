import 'Karyawan.dart';

enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

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
      print("Ingin beralih ke fase Pengembangan?\n");
      print("Maaf, syarat tidak terpenuhi untuk beralih ke fase Pengembangan.");
    }
  }

  void lanjutKeEvaluasi() {
    if (faseSaatIni == FaseProyek.Pengembangan &&
        DateTime.now().difference(tanggalMulai).inDays > 45) {
      faseSaatIni = FaseProyek.Evaluasi;
      print("Proyek beralih ke fase Evaluasi.");
    } else {
      print(
          "Ingin beralih ke fase Evaluasi?\nMaaf, syarat tidak terpenuhi untuk beralih ke fase Evaluasi.");
    }
  }
}
