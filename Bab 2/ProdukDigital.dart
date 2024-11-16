//Kategori Produk
enum KategoriProduk { DataManagement, NetworkAutomation }

class ProdukDigital {
  final String namaProduk;
  double harga;
  final KategoriProduk kategori;
  int jumlahTerjual = 0;

  ProdukDigital({required this.namaProduk, required this.harga, required this.kategori}) {
    //Validasi harga masing-masing kategori
    if (kategori == KategoriProduk.NetworkAutomation && harga < 200000) {
      throw Exception("Harga produk NetworkAutomation harus minimal 200.000");
    } else if (kategori == KategoriProduk.DataManagement && harga >= 200000) {
      throw Exception("Harga produk DataManagement harus di bawah 200.000");
    }
  }

  //diskon untuk kategori NetworkAutomation dengan jumlah terjual > 50
  void terapkanDiskon() {
    if (kategori == KategoriProduk.NetworkAutomation && jumlahTerjual > 50) {
      double diskonHarga = harga * 0.15;
      harga = diskonHarga >= 200000 ? diskonHarga : 200000;
    }
  }
}