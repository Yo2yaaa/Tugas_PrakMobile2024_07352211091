import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas3 Mobile',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Center(
          child: Container(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: const Icon(Icons.list_rounded),
                ),
                SizedBox(width: 12),
                Expanded(child: const Text('E-Commerce')),
                Container(
                  child: const Icon(Icons.notifications_active_rounded),
                ),
                SizedBox(width: 12),
                Container(
                  child: const Icon(Icons.shopping_cart_sharp),
                ),
              ],
            ),
          ),
        )),
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
                            child:
                                Icon(Icons.filter_list, color: Colors.black)),
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/14.jpg'),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Wade Warren',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Beautician',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
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
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5)),
                                                  CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/11.jpg'),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
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
                                                        Text(
                                                            'Lorem ipsum dolor amet.',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .grey)),
                                                        Text(
                                                            'ipsum dolor sit amet.',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .grey)),
                                                        const SizedBox(
                                                            height: 10),
                                                        Row(children: [
                                                          Icon(Icons.star,
                                                              size: 16,
                                                              color:
                                                                  Colors.blue),
                                                          Text('4.9',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14)),
                                                          // Tombol Book Now
                                                          ElevatedButton(
                                                            onPressed: () {},
                                                            child: Text(
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
                        return PictureCustom();
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
                          NeverScrollableScrollPhysics(), // Disable scroll GridView agar scroll yang dipakai hanya dari SingleChildScrollView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                    borderRadius: BorderRadius.vertical(
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
                                        Text(
                                          'Miss Zachary Will',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 4),
                                        const Text('Beautician',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue)),
                                        Text(
                                            'Lorem ipsum odor amet, consectetuer adipiscing elit.',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                        SizedBox(height: 8),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Book Workshop'),
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
        SizedBox(height: 5),
        const Row(children: [
          CircleAvatar(
              radius: 30, backgroundImage: AssetImage('assets/images/11.jpg')),
          SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: EdgeInsets.only(top: 5)),
            Row(children: [
              const Text('Miss Zachary Will',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              const Text('Beautician',
                  style: TextStyle(fontSize: 12, color: Colors.blue)),
            ]),
            Text('Lorem ipsum dolor amet.',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text('ipsum dolor sit amet.',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 10),
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
