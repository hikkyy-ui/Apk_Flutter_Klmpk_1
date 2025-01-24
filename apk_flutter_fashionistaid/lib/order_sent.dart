import 'package:flutter/material.dart';
import 'package:apk_flutter_fashionistaid/order.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apk_flutter_fashionistaid/product.dart';
import 'package:apk_flutter_fashionistaid/other_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: OrderSentPage(),
    );
  }
}

class OrderSentPage extends StatelessWidget {
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
            SizedBox(height: 2.0), // Jarak antar widget

            // Sedang Dikirim
            Sent(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Detail Produk
            ProductDetails(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Info Pengiriman
            ShippingInfo(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Ringkasan Pembayaran
            PaymentSummary(),
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
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0, top: 10, right: 15.0, bottom: 25.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(40, 50), // Lebar: 40, Tinggi: 50
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Other2Page()),
                  );
                },
                child: Icon(Icons.more_horiz, color: Colors.grey),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple[300],
                  side: BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(380, 50), // Lebar: 380, Tinggi: 50
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderSentPage()),
                  );
                },
                child: Text(
                  'Lacak',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
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
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.0, top: 47, right: 10.0, bottom: 17.0),
      child: Row(
        children: [
          // AppBar
          Expanded(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.grey[500]),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(),
                      ),
                    );
                  },
                ),
                Text(
                  'Detail Pesanan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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

// Widget Dikirim
class Sent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sedang Dikirim',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'Lihat Detail',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('INU/20241001/MPL/321546'),
                      SizedBox(width: 4.0),
                      FaIcon(
                        FontAwesomeIcons.clipboard,
                        size: 20.0,
                        color: Colors.grey[700],
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Tanggal Pembelian',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Lihat Invoice',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text('01 Oktober 2024, 10:55 WIB'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget Detail Produk
class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Detail Produk',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          NetworkImage('assets/logo_fashionista.jpg'),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Fashionista Official Store ID',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'assets/sepatu_sneakers.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sneakers Adidas - Cream|Navy|XL',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1 x Rp400.000',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Harga',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Rp400.000',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                      color: Colors.grey,
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

// Widget Info Pengiriman
class ShippingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
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
            'Info Pengiriman',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kurir',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 70.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Kurir Rekomendasi - Tim Fashionista ID ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'BEBAS ONGKIR',
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '(Estimasi tiba 01-06 Okt 2024)',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No Resi',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 50.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TFN01-HFYR7NP9',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alamat',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              Icon(Icons.location_on, size: 20.0),
              SizedBox(width: 35.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Nama Pembeli',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'No Hp',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Nama kota, Kecamatan, Kabupaten, Provinsi, Kelurahan',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Nama Jalan - Kasih alamat lengkap kasihan kurirnya',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
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

// Widget Ringkasan Pembayaran
class PaymentSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Metode Pembayaran',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'FashPay',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(),
          buildRow('Total Harga (1 Barang)', 'Rp400.000'),
          buildRow('Total Ongkos Kirim', 'Rp45.000 - Rp0', isSecondary: true),
          buildRow('Diskon Ongkos Kirim', '-Rp45.000', isDiscount: true),
          buildRow('Total Diskon Barang', 'Rp0'),
          buildRow('Biaya Asuransi Pengiriman', 'Rp1.000'),
          buildRow('Biaya Jasa Aplikasi', 'Rp2.000 - Rp1.000',
              isSecondary: true),
          Divider(),
          buildRow('Total Belanja', 'Rp402.000', isTotal: true),
        ],
      ),
    );
  }

  Widget buildRow(String label, String value,
      {bool isSecondary = false,
      bool isDiscount = false,
      bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSecondary ? Colors.grey : Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isDiscount
                  ? Colors.red
                  : (isSecondary ? Colors.grey : Colors.black),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
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
