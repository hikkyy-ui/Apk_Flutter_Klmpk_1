import 'package:apk_flutter_fashionistaid/cart.dart';
import 'package:apk_flutter_fashionistaid/chat.dart';
import 'package:apk_flutter_fashionistaid/home.dart';
import 'package:apk_flutter_fashionistaid/order.dart';
import 'package:apk_flutter_fashionistaid/notification.dart';
import 'package:apk_flutter_fashionistaid/account.dart';
import 'package:apk_flutter_fashionistaid/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: StylemixPage(),
    );
  }
}

class StylemixPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Warna latar belakang
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(), // Efek bouncing saat di-scroll
          padding: EdgeInsets.zero, // Menghilangkan padding bawaan
          children: [
            // Search bar dan ikon
            SearchBar(),

            // Gambar Text Stylemix
            StylemixImage(),

            // Populer
            Populer(),

            // Untukmu
            GridViewForYou(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(), // Menambahkan BottomNavBar di sini
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[300],
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                icon: Icons.home,
                label: 'Home',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              _buildNavItem(
                icon: Icons.shopping_bag,
                label: 'Pesanan',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderPage(),
                    ),
                  );
                },
              ),
              _buildNavItem(
                icon: Icons.checkroom,
                label: 'StyleMix',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StylemixPage(),
                    ),
                  );
                },
              ),
              _buildNavItem(
                icon: Icons.notifications,
                label: 'Notifikasi',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationPage(),
                    ),
                  );
                },
              ),
              _buildNavItem(
                icon: Icons.person,
                label: 'Akun',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}

// Widget untuk Search Bar
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[300],
      padding: EdgeInsets.only(left: 10.0, top: 30, right: 10.0, bottom: 10.0),
      child: Row(
        children: [
          // Search bar
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.grey[500]),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        );
                        print('TextField diklik');
                      },
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {
                          // Aksi saat pengguna submit pencarian
                          print('Cari: $value');
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.grey[500]),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white, size: 25.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.comment, color: Colors.white, size: 25.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Widget Gambar Text Stylemix
class StylemixImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: ClipRRect(
        child: Image.network(
          'assets/stylemix_image.jpg', // Path gambar
          width: double.infinity,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Widget Populer
class Populer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#Populer',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(width: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Gambar 1
                InkWell(
                  onTap: () {
                    // Aksi ketika gambar diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StylemixPage(), // Beralih ke Halaman
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, width: 2), // Outline gambar
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'assets/live_1.jpg', // Path gambar
                        width: 80,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Gambar 2
                SizedBox(width: 10), // Jarak antar gambar
                InkWell(
                  onTap: () {
                    // Aksi ketika gambar kedua diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StylemixPage(), // Beralih ke Halaman
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, width: 2), // Outline gambar
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'assets/live_2.jpg', // Path gambar
                        width: 80,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Gambar 3
                SizedBox(width: 10), // Jarak antar gambar
                InkWell(
                  onTap: () {
                    // Aksi ketika gambar kedua diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StylemixPage(), // Beralih ke Halaman
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, width: 2), // Outline gambar
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'assets/live_3.jpg', // Path gambar
                        width: 80,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Gambar 4
                SizedBox(width: 10), // Jarak antar gambar
                InkWell(
                  onTap: () {
                    // Aksi ketika gambar kedua diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StylemixPage(), // Beralih ke Halaman
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, width: 2), // Outline gambar
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'assets/live_4.jpg', // Path gambar
                        width: 80,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Gambar 5
                SizedBox(width: 10), // Jarak antar gambar
                InkWell(
                  onTap: () {
                    // Aksi ketika gambar kedua diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StylemixPage(), // Beralih ke Halaman
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, width: 2), // Outline gambar
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'assets/live_5.jpg', // Path gambar
                        width: 80,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Gambar 6
                SizedBox(width: 10), // Jarak antar gambar
                InkWell(
                  onTap: () {
                    // Aksi ketika gambar kedua diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StylemixPage(), // Beralih ke Halaman
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, width: 2), // Outline gambar
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'assets/live_6.jpg', // Path gambar
                        width: 80,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget #Untukmu
class GridViewForYou extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'imageUrl': 'assets/outfit_1.jpg',
      'title': 'Oufit ini cocok untuk berbagai acara santai',
    },
    {
      'imageUrl': 'assets/outfit_2.jpg',
      'title': 'Outfit ini cocok untuk berkencan',
    },
    {
      'imageUrl': 'assets/outfit_3.jpg',
      'title': 'Outfit ini cocok acara kasual diluar ruangan',
    },
    {
      'imageUrl': 'assets/outfit_4.jpg',
      'title': 'Outfit ini cocok untuk berjalan-jalan santai',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#Untukmu',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.0), // Spasi antara teks dan GridView
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                imageUrl: product['imageUrl'],
                title: product['title'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StylemixPage()),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorited = false; // State untuk status favorit
  int favoriteCount = 10; // Contoh jumlah favorit awal

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar produk dengan padding
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.imageUrl,
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Informasi produk
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Ikon Love di sudut kanan atas
          Positioned(
            top: 10.0,
            right: 10.0,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited;
                      if (isFavorited) {
                        favoriteCount++;
                      } else {
                        favoriteCount--;
                      }
                    });
                  },
                ),
                Text(
                  '$favoriteCount',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
