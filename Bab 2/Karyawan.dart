abstract class Karyawan {
  final String nama;
  final int umur;
  final String peran;

  Karyawan(this.nama, {required this.umur, required this.peran});

  void bekerja();
}

// Child: KaryawanTetap
class KaryawanTetap extends Karyawan with Kinerja{
  KaryawanTetap(String nama, {required int umur, required String peran})
      : super(nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print("$nama bekerja selama hari kerja reguler.");
  }
}

// Child: KaryawanKontrak
class KaryawanKontrak extends Karyawan with Kinerja{
  KaryawanKontrak(String nama, {required int umur, required String peran})
      : super(nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print("$nama bekerja sesuai periode proyek.");
  }
}

// mengatur produktivitas karyawan
mixin Kinerja {
  int produktivitas = 0;

  void updateProduktivitas(int nilai) {
    if (nilai >= 0 && nilai <= 100) {
      produktivitas = nilai;
      print("Produktivitas bernilai : $produktivitas");
    } else {
      throw Exception("Produktivitas harus berada di antara 0 hingga 100.");
    }
  }
}

// KaryawanManager dengan mixin Kinerja
class KaryawanManager extends Karyawan with Kinerja {
  KaryawanManager(String nama, {required int umur})
      : super(nama, umur: umur, peran: 'Manager');

  @override
  void bekerja() {
    if (produktivitas >= 85) {
      print("$nama bekerja sebagai Manager dengan produktivitas yang tinggi.");
    } else {
      print("$nama harus meningkatkan produktivitas.");
    }
  }
}
