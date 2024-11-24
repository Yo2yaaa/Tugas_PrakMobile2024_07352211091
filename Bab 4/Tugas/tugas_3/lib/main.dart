import 'package:flutter/material.dart';
import 'secondpage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas3 Mobile',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/CartPage': (context) => CartPage(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

   @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas3 Mobile',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: SizedBox(
                  width: 400,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Icon(Icons.list_rounded),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(child: Text('E-Commerce')),
                      ]))),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, size: 24),
              onPressed: () {},
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(Icons.shopping_cart, size: 24),
              onPressed: () {
                // Navigasi ke SecondPage saat ikon keranjang ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              //Container utama
              Container(
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade700, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  // Search dan Filter Row
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.search, color: Colors.black),
                                const SizedBox(width: 12),
                                Text(
                                  'Search here',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.filter_list,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Gambar banner1
                  Image.asset(
                    'assets/images/banner.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),

                  // Bagian Top Rated Freelances
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Rated Freelances',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  // List freelancer
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/14.jpg'),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Wade Warren',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Beautician',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star,
                                      size: 12, color: Colors.blue),
                                  Text('4.9', style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),

                  // Bagian Top Services
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Services',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  // List layanan
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(children: [
                              Stack(clipBehavior: Clip.none, children: [
                                // Gambar layanan
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/11.jpg',
                                    width: 165,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Positioned(
                                  left: 130,
                                  top: 15,
                                  child:
                                      // Detail layanan
                                      Container(
                                          height: 120,
                                          width: 230,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      189, 189, 189, 1),
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          child: Expanded(
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5)),
                                                  const CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/11.jpg'),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5)),
                                                        const Text(
                                                          'Miss Zachary Will',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const Text(
                                                          'Beautician',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        const Text(
                                                            'Lorem ipsum dolor amet.',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .grey)),
                                                        const Text(
                                                            'ipsum dolor sit amet.',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .grey)),
                                                        const SizedBox(
                                                            height: 10),
                                                        Row(children: [
                                                          const Icon(Icons.star,
                                                              size: 16,
                                                              color:
                                                                  Colors.blue),
                                                          const Text('4.9',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14)),
                                                          // Tombol Book Now
                                                          ElevatedButton(
                                                            onPressed: () {},
                                                            child: const Text(
                                                                'Book Now'),
                                                          ),
                                                        ]),
                                                      ]),
                                                ]),
                                          )),
                                ),
                              ])
                            ]));
                      }),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best Bookings',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  // Gambar banner2
                  Image.asset(
                    'assets/images/banner.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),

                  //Gambar dan Posisi 2 Layanan
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return const PictureCustom();
                      }),

                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended Workshops',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  GridView.builder(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable scroll GridView agar scroll yang dipakai hanya dari SingleChildScrollView
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Dua kolom
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.75, // Rasio tinggi dan lebar item
                      ),
                      itemCount: 4, // Jumlah otak yang dipakai
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(8)),
                                    child: Image.asset(
                                      'assets/images/16.jpg',
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Miss Zachary Will',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 4),
                                        const Text('Beautician',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue)),
                                        const Text(
                                            'Lorem ipsum odor amet, consectetuer adipiscing elit.',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                        const SizedBox(height: 8),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Book Workshop'),
                                        ),
                                      ]),
                                ),
                              ]),
                        );
                      })
                ]),
              ),
            ]))),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Blog',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

//Banner dengan gambar yang sama (Extract Widget)
class PictureCustom extends StatelessWidget {
  const PictureCustom({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(children: [
        // Gambar layanan
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/11.jpg',
            width: 360,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),

        //Logo, Teks: Nama, bidang,
        const SizedBox(height: 5),
        const Row(children: [
          CircleAvatar(
              radius: 30, backgroundImage: AssetImage('assets/images/11.jpg')),
          SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: EdgeInsets.only(top: 5)),
            Row(children: [
              Text('Miss Zachary Will',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Text('Beautician',
                  style: TextStyle(fontSize: 12, color: Colors.blue)),
            ]),
            Text('Lorem ipsum dolor amet.',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text('ipsum dolor sit amet.',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 10),
          ]),
          SizedBox(width: 10),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Icon(Icons.star, size: 16, color: Colors.blue),
            Text('4.9', style: TextStyle(fontSize: 12))
          ])
        ]),
      ]),
    );
  }
}
