import 'package:apk_flutter_fashionistaid/cart.dart';
import 'package:apk_flutter_fashionistaid/login.dart';
import 'package:apk_flutter_fashionistaid/order.dart';
import 'package:apk_flutter_fashionistaid/search.dart';
import 'package:apk_flutter_fashionistaid/stylemix.dart';
import 'package:apk_flutter_fashionistaid/notification.dart';
import 'package:apk_flutter_fashionistaid/account.dart';
import 'package:apk_flutter_fashionistaid/product.dart';
import 'package:apk_flutter_fashionistaid/chat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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

            // Informasi FashPay
            FashPayInfo(),

            // Item Kategory
            ItemKategory(),

            // Header Slide
            HeaderSlide(),

            // Fashionista Live
            FashionistaLive(),
            SizedBox(height: 10.0), // Jarak antar widget

            // For You
            TextForYou(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Item Produk
            ItemProduct(),
            SizedBox(height: 5.0), // Jarak antar widget
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

// Widget untuk informasi FashPay
class FashPayInfo extends StatelessWidget {
  static const String balanceText = "Saldo:";
  static const String balanceValue = "(Rp1.000.000)";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bagian kiri: QR, Wallet, dan FashPay Info
          LeftSection(),
          // Bagian kanan: Saldo dan tombol aksi
          RightSection(),
        ],
      ),
    );
  }
}

// Bagian kiri dari FashPayInfo
class LeftSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.qr_code, color: Colors.grey[500], size: 30.0),
        SizedBox(width: 8.0),
        Container(
          height: 30,
          width: 2,
          color: Colors.grey[300],
        ),
        VerticalDivider(
          color: Colors.grey[300],
          thickness: 2, // Ketebalan Garis
          width: 16.0, // Lebar total divinder/Jarak Mungkin? (Emote Batu)
        ),
        Icon(Icons.account_balance_wallet,
            color: Colors.purple[300], size: 30.0),
        SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FashPay',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Bayar Cepat',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        SizedBox(width: 65.0),
        Container(
          height: 30,
          width: 2,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}

// Bagian kanan dari FashPayInfo
class RightSection extends StatelessWidget {
  static const TextStyle balanceTextStyle = TextStyle(fontSize: 14.0);
  static const TextStyle balanceValueStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.purple,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Saldo:', style: balanceTextStyle),
        SizedBox(width: 4.0),
        Text('(Rp1.000.000)', style: balanceValueStyle),
        SizedBox(width: 14.0),
        Container(
          height: 30,
          width: 2,
          color: Colors.grey[300],
        ),
        SizedBox(width: 8.0),
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage('assets/logo_rp.jpg'),
        ),
      ],
    );
  }
}

// Widget untuk Kategory
class ItemKategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      padding: EdgeInsets.only(left: 20.0, top: 10, right: 20.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Kategory 1 (Gratis Ongkir dan Voucher)
          Row(
            children: [
              SizedBox(width: 2.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5.0),
                  SizedBox(height: 2.0),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // Aksi ketika gambar diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Warna outline
                            width: 2.0, // Ketebalan outline
                          ),
                          borderRadius:
                              BorderRadius.circular(10.0), // Radius outline
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'assets/ongkir_voucher.jpg', // Gambar Logo 4 (Gratis Ongkir dan Voucher)
                            width: 50,
                            height: 50, // Ukuran Gambar
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '   Voucher', // Text Gambar Kategory
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10, // Ukuran Tulisan
                      fontWeight: FontWeight.w700, // Ketebalan Tulisan
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Tutup Kategory 1 (Gratis Ongkir dan Voucher)

          // Kategory 2 (Flash Sale)
          Row(
            children: [
              SizedBox(width: 2.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5.0),
                  SizedBox(height: 2.0),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // Aksi ketika gambar diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Warna outline
                            width: 2.0, // Ketebalan outline
                          ),
                          borderRadius:
                              BorderRadius.circular(10.0), // Radius outline
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'assets/flash_sale.jpg', // Gambar Logo 2 (Flash Sale)
                            width: 50,
                            height: 50, // Ukuran Gambar
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    ' Flash Sale', // Text Gambar Kategory
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10, // Ukuran Tulisan
                      fontWeight: FontWeight.w700, // Ketebalan Tulisan
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Tutup Kategory 2 (Flash Sale)

          // Kategory 3 (FPayLater)
          Row(
            children: [
              SizedBox(width: 2.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5.0),
                  SizedBox(height: 2.0),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // Aksi ketika gambar diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Warna outline
                            width: 2.0, // Ketebalan outline
                          ),
                          borderRadius:
                              BorderRadius.circular(10.0), // Radius outline
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'assets/fpay_later.jpg', // Gambar Logo 4 (FPayLater)
                            width: 50,
                            height: 50, // Ukuran Gambar
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    ' FPayLater', // Text Gambar Kategory
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10, // Ukuran Tulisan
                      fontWeight: FontWeight.w700, // Ketebalan Tulisan
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Tutup Kategory 3 (FPayLater)

          // Kategory 4 (FashPay)
          Row(
            children: [
              SizedBox(width: 2.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5.0),
                  SizedBox(height: 2.0),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // Aksi ketika gambar diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Warna outline
                            width: 2.0, // Ketebalan outline
                          ),
                          borderRadius:
                              BorderRadius.circular(10.0), // Radius outline
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'assets/fashpay.jpg', // Gambar Logo 4 (FashPay)
                            width: 50,
                            height: 50, // Ukuran Gambar
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '   FashPay', // Text Gambar Kategory
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10, // Ukuran Tulisan
                      fontWeight: FontWeight.w700, // Ketebalan Tulisan
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Tutup Kategory 4 (FashPay)

          // Kategory 5 (Lihat Semua)
          Row(
            children: [
              SizedBox(width: 2.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5.0),
                  SizedBox(height: 2.0),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // Aksi ketika gambar diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Warna outline
                            width: 2.0, // Ketebalan outline
                          ),
                          borderRadius:
                              BorderRadius.circular(10.0), // Radius outline
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'assets/lihat_semua.jpg', // Gambar Logo 5 (Lihat Semua)
                            width: 50,
                            height: 50, // Ukuran Gambar
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Lihat Semua', // Text Gambar Kategory
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10, // Ukuran Tulisan
                      fontWeight: FontWeight.w700, // Ketebalan Tulisan
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Tutup Kategory 5 (Lihat Semua)
        ],
      ),
    );
  }
}

// Widget untuk Header Slide
class HeaderSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
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
                    builder: (context) => LoginPage(), // Beralih ke Halaman
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'assets/header_slide_1.jpg', // Gambar Header 1
                  width: 460,
                  height: 120,
                  fit: BoxFit.cover,
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
                    builder: (context) => LoginPage(), // Beralih ke Halaman
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'assets/header_slide_2.jpg', // Gambar Header 2
                  width: 460,
                  height: 120,
                  fit: BoxFit.cover,
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
                    builder: (context) => LoginPage(), // Beralih ke Halaman
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/logo_fashionista.jpg', // Gambar Header 3
                  width: 460,
                  height: 120,
                  fit: BoxFit.cover,
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
                    builder: (context) => LoginPage(), // Beralih ke Halaman
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/logo_fashionista.jpg', // Gambar 4
                  width: 460,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Fashionista Live
class FashionistaLive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fashionista Live',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
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
                        builder: (context) => LoginPage(), // Beralih ke Halaman
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
                        builder: (context) => LoginPage(), // Beralih ke Halaman
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
                        builder: (context) => LoginPage(), // Beralih ke Halaman
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
                        builder: (context) => LoginPage(), // Beralih ke Halaman
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
                        builder: (context) => LoginPage(), // Beralih ke Halaman
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
                        builder: (context) => LoginPage(), // Beralih ke Halaman
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

class TextForYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        padding:
            EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(children: [
          Text(
            'For You',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ]));
  }
}

// Widget Item Produk
class ItemProduct extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'imageUrl': 'assets/sepatu_sneakers.jpg',
      'title': 'Sepatu Sneakers Perempuan Casual Korea Kekinian', // Anjayyy...
      'price': 'Rp 400,000', // Murah Bangetttt...
      'rating': 5.0,
      'sold': 3,
    },
    {
      'imageUrl': 'assets/kemeja_tartan.jpg',
      'title': 'Kemeja Tartan Shirt Lengan Panjang',
      'price': 'Rp 40,000',
      'rating': 4.7,
      'sold': 230,
    },
    {
      'imageUrl': 'assets/celana_hitam_pria.jpg',
      'title': 'Celana Kain Hitam Pra Deawasa Formal',
      'price': 'Rp 179,000',
      'rating': 5.0,
      'sold': 320,
    },
    {
      'imageUrl': 'assets/tas_selempang_wanita.jpg',
      'title': 'Tas Selempang Wanita',
      'price': 'Rp 44,000',
      'rating': 4.5,
      'sold': 120,
    },
    {
      'imageUrl': 'assets/celana_kulot_wanita.jpg',
      'title': 'Celana Kulot Wanita',
      'price': 'Rp 55,999',
      'rating': 4.8,
      'sold': 450,
    },
    {
      'imageUrl': 'assets/sepatu_air_bls.jpg',
      'title': 'Sepatu AIR BLS-ECKE Sneakers',
      'price': 'Rp 122,500',
      'rating': 4.6,
      'sold': 300,
    },
    {
      'imageUrl': 'assets/baju_kemeja_pria.jpg',
      'title': 'Baju Kemeja Pria Riko Lengan Panjang',
      'price': 'Rp 60,000',
      'rating': 4.6,
      'sold': 300,
    },
    {
      'imageUrl': 'assets/tas_slingbag_pria.jpg',
      'title': 'Tas Selempang Pria Slingbag Casual Trendy Distro',
      'price': 'Rp 34,000',
      'rating': 4.6,
      'sold': 300,
    },
    {
      'imageUrl': 'assets/topi_nyc.jpg',
      'title': 'Topi Pria Distro Original NYC',
      'price': 'Rp 15,000',
      'rating': 4.6,
      'sold': 300,
    },
    {
      'imageUrl': 'assets/topi_bucket_smile.jpg',
      'title': 'Topi Bucket Wanita Motif Smile',
      'price': 'Rp 19,000',
      'rating': 4.6,
      'sold': 300,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
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
            price: product['price'],
            rating: product['rating'],
            sold: product['sold'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductPage()),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final double rating;
  final int sold;
  final VoidCallback onTap;

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    required this.sold,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
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
                  imageUrl,
                  width: double.infinity,
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Informasi produk
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.0),
                  // Teks "Terlaris | Gratis Ongkir"
                  Text(
                    'Terlaris | Gratis Ongkir',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  // Rating, ikon bintang, dan jumlah terjual
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.0),
                      SizedBox(width: 4.0),
                      Text(
                        '$rating | Terjual $sold',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
