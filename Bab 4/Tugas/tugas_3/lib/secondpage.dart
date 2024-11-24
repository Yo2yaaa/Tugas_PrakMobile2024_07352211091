import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';

class Product {
  String name;
  String brand;
  int price;
  int quantity;
  String image;

  Product(
      {required this.name,
      required this.brand,
      required this.price,
      required this.quantity,
      required this.image});
}

class CartPage extends StatefulWidget {
  //const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Product data
  final List<Product> _products = [
    Product(
        name: 'Bapak1',
        brand: 'Webtoon',
        price: 800,
        quantity: 1,
        image: 'assets/images/11.jpg'),
    Product(
        name: 'Bapak2',
        brand: 'Webtoon',
        price: 1000,
        quantity: 1,
        image: 'assets/images/14.jpg'),
    Product(
        name: 'Bapak3',
        brand: 'Webtoon',
        price: 600,
        quantity: 1,
        image: 'assets/images/16.jpg'),
  ];

  int discount = 4;
  int deliveryCharges = 2;

  // Calculate subtotal
  int get subtotal => _products.fold(
        0,
        (total, item) => total + (item.price * item.quantity),
      );

  // Calculate total price
  int get total => subtotal - discount + deliveryCharges;

  // Update quantity of a product
  void updateQuantity(int index, bool increment) {
    setState(() {
      if (increment) {
        _products[index].quantity++;
      } else {
        if (_products[index].quantity > 1) {
          _products[index].quantity--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.grey.shade100, // Warna latar belakang
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
          },
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.grey.shade100, // Warna latar belakang
              child: const Icon(Icons.more_vert, color: Colors.black),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return CartItem(
                    product: _products[index],
                    onIncrement: () => updateQuantity(index, true),
                    onDecrement: () => updateQuantity(index, false),
                    onDelete: () {
                      setState(() {
                        _products.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Order Summary',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SummaryRow(
                        title: 'Items', value: _products.length.toString()),
                    SummaryRow(title: 'Subtotal', value: '\$$subtotal'),
                    SummaryRow(title: 'Discount', value: '-\$$discount'),
                    SummaryRow(
                      title: 'Delivery Charges',
                      value: '\$$deliveryCharges',
                    ),
                    const Divider(),
                    SummaryRow(title: 'Total', value: '\$$total', isBold: true),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _showCartDialog(context, total);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 140, 42, 252),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text(
                        'Check Out',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showCartDialog(BuildContext context, int total) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Total Belanjaan"),
        content: Text("Total: Rp $total"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

class CartItem extends StatelessWidget {
  final Product product;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const CartItem({
    super.key,
    required this.product,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Gambar Produk
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                product.image,
                width: 140,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),

            // Informasi Produk
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    product.brand,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 140, 42, 252),
                    ),
                  ),
                ],
              ),
            ),

            // Kontrol Jumlah dan Hapus Produk
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete_outlined, color: Colors.red),
                  onPressed: onDelete,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Color.fromARGB(255, 140, 42, 252),
                      ),
                      onPressed: onDecrement,
                    ),
                    Text(
                      product.quantity.toString().padLeft(2, '0'),
                      style: const TextStyle(fontSize: 14),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        color: Color.fromARGB(255, 140, 42, 252),
                      ),
                      onPressed: onIncrement,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;

  const SummaryRow(
      {super.key,
      required this.title,
      required this.value,
      this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/HomeScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
