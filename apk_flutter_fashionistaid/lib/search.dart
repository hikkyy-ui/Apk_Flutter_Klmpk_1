import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Warna latar belakang
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(), // Efek bouncing saat di-scroll
          padding: EdgeInsets.zero, // Menghilangkan padding bawaan
          children: [
            // Search bar dan ikon
            SearchBar(),

            // Riwayat Pencarian
            SearchHistory(),

            // Text Brand Rekomendasi
            TextRecommendedBrand(),

            // Brand Rekomendasi
            RecommendedBrand(),
          ],
        ),
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
      padding: EdgeInsets.only(left: 10.0, top: 30, right: 15.0, bottom: 10.0),
      child: Row(
        children: [
          // Search bar
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Contoh navigasi kembali
            },
          ),
          SizedBox(width: 8),
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
                    onPressed: () {},
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.grey[500]),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.0),
          SizedBox(
            width: 85.0, // Lebar tombol
            height: 40.0, // Tinggi tombol
            child: OutlinedButton(
              onPressed: () {
                print('Tombol Cari diklik');
              },
              child: Text(
                'Cari',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.purple[600]!),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Widget Riwayat Hasil Pencarian
class SearchHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListItem(
            icon: Icons.access_time,
            text: 'kaos hitam polos pria compression',
          ),
          Divider(height: 1, color: Colors.grey),
          ListItem(
            icon: Icons.access_time,
            text: 'baju cosplayer naruto',
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final IconData icon;
  final String text;

  ListItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 24.0),
              SizedBox(width: 8.0),
              Text(
                text,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Icon(Icons.close, size: 24.0),
        ],
      ),
    );
  }
}

// Widget Text Brand Rekomendasi
class TextRecommendedBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 0.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Text(
        'Brand Rekomendasi',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

// Widget Brand Rekomendasi
class RecommendedBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BrandItem(
            imageUrl: 'assets/gucci_brand.jpg',
            brandName: 'GUCCI',
            onTap: () {
              print('GUCCI tapped');
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
          BrandItem(
            imageUrl: 'assets/chanel_brand.jpg',
            brandName: 'CHANEL',
            onTap: () {
              print('CHANEL tapped');
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
          BrandItem(
            imageUrl: 'assets/adidas_brand.jpg',
            brandName: 'ADIDAS',
            onTap: () {
              print('ADIDAS tapped');
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
          BrandItem(
            imageUrl: 'assets/nike_brand.jpg',
            brandName: 'NIKE',
            onTap: () {
              print('NIKE tapped');
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
          BrandItem(
            imageUrl: 'assets/balenciaga_brand.jpg',
            brandName: 'BALENCIAGA',
            onTap: () {
              print('BALENCIAGA tapped');
            },
          ),
        ],
      ),
    );
  }
}

class BrandItem extends StatelessWidget {
  final String imageUrl;
  final String brandName;
  final VoidCallback onTap;

  BrandItem(
      {required this.imageUrl, required this.brandName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 16),
                Text(
                  brandName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
