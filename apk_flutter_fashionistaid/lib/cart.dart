import 'package:flutter/material.dart';
import 'package:apk_flutter_fashionistaid/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: CartPage(),
    );
  }
}

class CartPage extends StatelessWidget {
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
            AppBarWidget(),
            SizedBox(height: 1.0), // Jarak antar widget

            // Produk yang dipilih
            SelectedProduct(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Produk 1
            ProductCard1(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Produk 2
            ProductCard2(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Produk 3
            ProductCard3(),
            SizedBox(height: 5.0), // Jarak antar widget
          ],
        ),
      ),
      bottomNavigationBar: BottomPromoBar(),
    );
  }
}

class BottomPromoBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.local_offer, size: 24),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yuk, pakai 2 kupon promo!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bisa pakai hingga Rp50.700',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    Text('Semua'),
                  ],
                ),
                Row(
                  children: [
                    Text('Total', style: TextStyle(color: Colors.grey[700])),
                    SizedBox(width: 8),
                    Text(
                      'Rp400.000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[200],
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Beli (1)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
      color: Colors.purple[300],
      padding: EdgeInsets.only(left: 10.0, top: 46, right: 10.0, bottom: 17.0),
      child: Row(
        children: [
          // AppBar
          Expanded(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context); // Contoh navigasi kembali
                  },
                ),
                Text(
                  'Keranjang',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white, size: 25.0),
            onPressed: () {
              print(
                  "Shopping cart icon clicked!"); // Tindakan saat ikon Cart ditekan
            },
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white, size: 40.0),
            onPressed: () {
              print(
                  "Comment icon clicked!"); // Tindakan saat ikon Comment ditekan
            },
          ),
        ],
      ),
    );
  }
}

// Produk yang diplih
class SelectedProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('1 Produk terpilih'),
          TextButton(
            onPressed: () {
              // Tambahkan aksi untuk tombol Hapus di sini
            },
            child: Text(
              'Hapus',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

// Produk 1
class ProductCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(value: true, onChanged: (bool? value) {}),
              Text(
                'Fashionista ID',
                style: TextStyle(color: Colors.grey[500]),
              ),
              Spacer(),
              Text(
                'BEBAS ONGKIR',
                style: TextStyle(color: Colors.purple[500], fontSize: 12),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Icon(Icons.local_shipping, color: Colors.purple[700], size: 16),
                SizedBox(width: 4.0),
                Text(
                  'Bisa hemat Rp45rb pakai Bebas Ongkir!',
                  style: TextStyle(color: Colors.purple[700], fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // Aksi ketika gambar diklik
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'assets/sepatu_sneakers.jpg', // Gambar Logo 4 (FPayLater)
                      width: 60,
                      height: 60, // Ukuran Gambar
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sneakers Adidas - Cream|Navy|XL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(
                        'Rp400.000',
                        style: TextStyle(
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Rp445.000',
                        style: TextStyle(
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Sneakers',
                          style: TextStyle(
                              color: Colors.purple[700], fontSize: 12),
                        ),
                        Icon(Icons.arrow_drop_down,
                            color: Colors.purple[700], size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.favorite_border, color: Colors.grey[400]),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.grey[400]),
                    onPressed: () {},
                  ),
                  Text('1'),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.grey[400]),
                    onPressed: () {},
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

// Produk 2
class ProductCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(value: false, onChanged: (bool? value) {}),
              Text(
                'Fashionista ID',
                style: TextStyle(color: Colors.grey[500]),
              ),
              Spacer(),
              Text(
                'BEBAS ONGKIR',
                style: TextStyle(color: Colors.purple[500], fontSize: 12),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Icon(Icons.local_shipping, color: Colors.purple[700], size: 16),
                SizedBox(width: 4.0),
                Text(
                  'Bisa hemat Rp45rb pakai Bebas Ongkir!',
                  style: TextStyle(color: Colors.purple[700], fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // Aksi ketika gambar diklik
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'assets/sepatu_sneakers.jpg', // Gambar Logo 4 (FPayLater)
                      width: 60,
                      height: 60, // Ukuran Gambar
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sneakers Adidas - Cream|Navy|XL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(
                        'Rp400.000',
                        style: TextStyle(
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Rp445.000',
                        style: TextStyle(
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Sneakers',
                          style: TextStyle(
                              color: Colors.purple[700], fontSize: 12),
                        ),
                        Icon(Icons.arrow_drop_down,
                            color: Colors.purple[700], size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.favorite_border, color: Colors.grey[400]),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.grey[400]),
                    onPressed: () {},
                  ),
                  Text('1'),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.grey[400]),
                    onPressed: () {},
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

// Produk 3
class ProductCard3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(value: false, onChanged: (bool? value) {}),
              Text(
                'Fashionista ID',
                style: TextStyle(color: Colors.grey[500]),
              ),
              Spacer(),
              Text(
                'BEBAS ONGKIR',
                style: TextStyle(color: Colors.purple[500], fontSize: 12),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Icon(Icons.local_shipping, color: Colors.purple[700], size: 16),
                SizedBox(width: 4.0),
                Text(
                  'Bisa hemat Rp45rb pakai Bebas Ongkir!',
                  style: TextStyle(color: Colors.purple[700], fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // Aksi ketika gambar diklik
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'assets/sepatu_sneakers.jpg', // Gambar Logo 4 (FPayLater)
                      width: 60,
                      height: 60, // Ukuran Gambar
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sneakers Adidas - Cream|Navy|XL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(
                        'Rp400.000',
                        style: TextStyle(
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Rp445.000',
                        style: TextStyle(
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Sneakers',
                          style: TextStyle(
                              color: Colors.purple[700], fontSize: 12),
                        ),
                        Icon(Icons.arrow_drop_down,
                            color: Colors.purple[700], size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.favorite_border, color: Colors.grey[400]),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.grey[400]),
                    onPressed: () {},
                  ),
                  Text('1'),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.grey[400]),
                    onPressed: () {},
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
