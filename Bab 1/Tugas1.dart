import 'dart:async';

enum Role { Admin, Customer }

class Product {
  final String productName;
  final double price;
  bool inStock;

  Product({required this.productName, required this.price, required this.inStock});
}

class User {
  final String name;
  final int age;
  late List<Product>? products;
  final Role? role;

  User({required this.name, required this.age, this.role}) {
    products = [];
  }
}

class AdminUser extends User {
  AdminUser({required String name, required int age}) : super(name: name, age: age, role: Role.Admin);

  // Method untuk menambah produk
  void addProduct(Product product, Map<String, Product> productList, Set<Product> userProducts) {
    try {
      if (product.inStock) {
        userProducts.add(product);
        products!.add(product);
        productList[product.productName] = product;
        print("Produk ${product.productName} berhasil ditambahkan.");
      } else {
        throw Exception("Produk ${product.productName} tidak tersedia dalam stok.");
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  // Method untuk menghapus produk
  void removeProduct(Product product, Set<Product> userProducts) {
    if (userProducts.remove(product)) {
      products!.remove(product);
      print("Produk ${product.productName} berhasil dihapus.");
    } else {
      print("Produk ${product.productName} tidak ditemukan.");
    }
  }
}

// Class CustomerUser, subclass dari User
class CustomerUser extends User {
  CustomerUser({required String name, required int age}) : super(name: name, age: age, role: Role.Customer);

  // Method untuk melihat daftar produk
  void viewProducts() {
    if (products != null && products!.isNotEmpty) {
      print("Daftar Produk untuk ${this.name}:");
      for (var product in products!) {
        print("- ${product.productName} : \$${product.price} - ${product.inStock ? 'Tersedia' : 'Habis'}");
      }
    } else {
      print("Tidak ada produk yang tersedia.");
    }
  }
}

// Fungsi Asinkron untuk Mengambil Detail Produk
Future<void> fetchProductDetails(Product product) async {
  await Future.delayed(Duration(seconds: 2)); // Penundaan untuk meniru pengambilan data dari server
  print("Detail Produk: ${product.productName}, Harga: \$${product.price}, Stok: ${product.inStock ? 'Tersedia' : 'Habis'}");
}

void main() {
  // Daftar produk yang tersedia (Map) dengan nama produk sebagai kunci
  Map<String, Product> productList = {
    'Laptop': Product(productName: 'Laptop', price: 1500.0, inStock: true),
    'Smartphone': Product(productName: 'Smartphone', price: 800.0, inStock: true),
    'Tablet': Product(productName: 'Tablet', price: 400.0, inStock: false),
  };

  // Menggunakan Set untuk menyimpan produk unik yang dimiliki oleh user
  Set<Product> userProducts = {};

  // Membuat objek AdminUser dan CustomerUser
  AdminUser admin = AdminUser(name: "Admin1", age: 30);
  CustomerUser customer = CustomerUser(name: "Customer1", age: 25);

  // Admin menambahkan produk ke daftar
  admin.addProduct(productList['Laptop']!, productList, userProducts);
  admin.addProduct(productList['Smartphone']!, productList, userProducts);
  admin.addProduct(productList['Tablet']!, productList, userProducts); // Akan menghasilkan exception

  // Customer melihat daftar produk
  customer.products = admin.products; // Set daftar produk yang dimiliki admin ke customer
  customer.viewProducts();

  // Mengambil detail produk secara asinkron
  fetchProductDetails(productList['Laptop']!);
}
