import 'package:apk_flutter_fashionistaid/cart.dart';
import 'package:apk_flutter_fashionistaid/chat.dart';
import 'package:flutter/material.dart';
import 'package:apk_flutter_fashionistaid/home.dart';
import 'package:apk_flutter_fashionistaid/order.dart';
import 'package:apk_flutter_fashionistaid/stylemix.dart';
import 'package:apk_flutter_fashionistaid/notification.dart';
import 'package:apk_flutter_fashionistaid/account.dart';
import 'package:apk_flutter_fashionistaid/checkout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Warna latar belakang
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(), // Efek bouncing saat di-scroll
          padding: EdgeInsets.zero, // Menghilangkan padding bawaan
          children: [
            // Appbar dan ikon
            AppBarWidget(),

            // Foto Produk
            FotoProduct(),

            // Text Fashionista ID
            TextFashionistaID(),

            // Text Harga Produk
            TextHargaProduct(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Warna & Ukuran
            WarnaUkuran(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Detail Produk & Deskripsi
            DetailProduct(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Detail Toko
            StoreCard(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Ulasan Pembeli
            ReviewUlasan(),
            SizedBox(height: 10.0), // Jarak antar widget

            // For You
            TextForYou(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Widget Item Produk
            ItemProduct(),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(60, 50), // Lebar: 60, Tinggi: 50
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Icon(Icons.shopping_cart, color: Colors.white),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.purple[400],
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.purple[400]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(200, 50), // Lebar: 200, Tinggi: 50
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                  );
                },
                child: Text('Beli'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(180, 50), // Lebar: 180, Tinggi: 50
                ),
                onPressed: () {
                  // Tambahkan logika Anda di sini
                },
                child: Text(
                  '+ Keranjang',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
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

// AppBarWidget
class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.0, top: 45, right: 10.0, bottom: 18.0),
      child: Row(
        children: [
          // Search bar
          Expanded(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.grey[500]),
                  onPressed: () {
                    Navigator.pop(context); // Contoh navigasi kembali
                  },
                ),
              ],
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.share, color: Colors.grey[500], size: 25.0),
            onPressed: () {
              print("Share icon clicked!"); // Tindakan saat ikon Share ditekan
            },
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon:
                Icon(Icons.shopping_cart, color: Colors.grey[500], size: 25.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.comment, color: Colors.grey[500], size: 25.0),
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

// Widget untuk Header Slide
class FotoProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Foto 1
            Image.asset(
              'assets/sepatu_sneakers.jpg', // Foto 1
              height: 500,
              width: 500,
              fit: BoxFit.cover,
            ),
            // Foto 2
            Image.asset(
              'assets/sepatu_sneakers.jpg', // Foto 1
              height: 500,
              width: 500,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Text Fashionista ID
class TextFashionistaID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 0.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: Colors.purple[300],
      ),
      child: Text(
        'Fashionista ID',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Text Harga Produk
class TextHargaProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rp400,000',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sepatu Sneakers Perempuan Casual Korea Kekinian',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.grey[400],
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.local_offer,
                  color: Colors.purple[500],
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ada Diskon Rp20.000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    Text(
                      'Masih Ada 6 Kupon Toko lainnya!',
                      style: TextStyle(
                        color: Colors.purple[800],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.chevron_right,
                  color: Colors.purple[500],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Terjual 3',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[500],
                  ),
                  SizedBox(width: 4),
                  Text(
                    '5.0 (3)',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.grey[600],
                  ),
                  SizedBox(width: 4),
                  Text(
                    '3',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  Icon(
                    Icons.comment,
                    color: Colors.grey[600],
                  ),
                  SizedBox(width: 4),
                  Text(
                    '0',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.purple[500],
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Pasti Ori',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  Icon(
                    Icons.security,
                    color: Colors.purple[500],
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Pembayaran Aman',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  Icon(
                    Icons.local_shipping,
                    color: Colors.purple[500],
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Gratis Ongkir',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget Warna & Ukuran
class WarnaUkuran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Warna',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              ChoiceChip(
                label: Text('White'),
                selected: true,
                onSelected: (bool selected) {},
                backgroundColor: Colors.grey[200],
                selectedColor: Colors.grey[200],
                side: BorderSide(color: Colors.black),
              ),
              SizedBox(width: 8.0),
              ChoiceChip(
                label: Text('White|Black'),
                selected: false,
                onSelected: (bool selected) {},
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(width: 8.0),
              ChoiceChip(
                label: Text('White|Pink'),
                selected: false,
                onSelected: (bool selected) {},
                backgroundColor: Colors.grey[200],
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'Ukuran',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              ChoiceChip(
                label: Text('S'),
                selected: false,
                onSelected: (bool selected) {},
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(width: 8.0),
              ChoiceChip(
                label: Text('M'),
                selected: false,
                onSelected: (bool selected) {},
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(width: 8.0),
              ChoiceChip(
                label: Text('L'),
                selected: false,
                onSelected: (bool selected) {},
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(width: 8.0),
              ChoiceChip(
                label: Text('XL'),
                selected: true,
                onSelected: (bool selected) {},
                backgroundColor: Colors.grey[200],
                selectedColor: Colors.grey[200],
                side: BorderSide(color: Colors.black),
              ),
              SizedBox(width: 8.0),
              ChoiceChip(
                label: Text('XXL'),
                selected: false,
                onSelected: (bool selected) {},
                backgroundColor: Colors.grey[200],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget Deskripsi Produk
class DetailProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1.0,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail produk',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Etalase',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      'Sepatu',
                      style: TextStyle(
                        color: Colors.purple[500],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Deskripsi produk',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text('Sebelum membeli dipikirkan baik-baik!'),
        ],
      ),
    );
  }
}

// Widget Detail Toko Penjual
class StoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage('assets/logo_fashionista.jpg'),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Fashionista Official Store ID',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.check_circle,
                      color: Colors.purple,
                      size: 16,
                    ),
                  ],
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Kota Baturaja',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '5.0 (1juta)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.black,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '+10 menit',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: ' pesanan diproses',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.purple),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Follow',
              style: TextStyle(
                color: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Ulasan Pembeli
class ReviewUlasan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ulasan Pembeli',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  print('Lihat semua ulasan');
                },
                child: Text(
                  'Lihat Semua',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Rating summary
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 8),
                Text(
                  '5.0',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Text('- 5 rating - 3 ulasan'),
              ],
            ),
          ),
          // Ulasan 1
          Divider(height: 1),
          SizedBox(height: 16),
          // Individual review
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('assets/logo_fashionista.jpg'),
                radius: 24,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Rahma W',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(Icons.star,
                                color: Colors.yellow, size: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      '10 tahun lalu',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(height: 8),
                    Image.network(
                      'assets/sepatu_sneakers.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Varian: White|Pink | L',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Barang baguss! Kurirnya Ramah',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
          // Ulasan 2
          Divider(height: 1),
          SizedBox(height: 16),
          // Individual review
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('assets/logo_fashionista.jpg'),
                radius: 24,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Bagus',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(Icons.star,
                                color: Colors.yellow, size: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      '5 tahun lalu',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(height: 8),
                    Image.network(
                      'assets/sepatu_sneakers.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Varian: White|Black | XL',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Kerennn pengirimannya cepat',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
          // Ulasan 3
          Divider(height: 1),
          SizedBox(height: 16),
          // Individual review
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('assets/logo_fashionista.jpg'),
                radius: 24,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hengki A',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(Icons.star,
                                color: Colors.yellow, size: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1 tahun lalu',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(height: 8),
                    Image.network(
                      'assets/sepatu_sneakers.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Varian: White | XL',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Sangat Bagus dan pas dimuka:)',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget Text For You
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
