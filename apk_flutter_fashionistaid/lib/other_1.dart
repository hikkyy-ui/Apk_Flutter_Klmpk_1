import 'package:flutter/material.dart';
import 'package:apk_flutter_fashionistaid/order_cancelled.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: Other1Page(),
    );
  }
}

class Other1Page extends StatelessWidget {
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

            // Chat Penjual
            ChatSeller(),
            SizedBox(height: 2.0), // Jarak antar widget

            // Batalkan Pesanan
            CancelOrder(),
          ],
        ),
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
                    Navigator.pop(context); // Contoh navigasi kembali
                  },
                ),
                Text(
                  'Lainnya',
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

// Widget Text Chat Penjual
class ChatSeller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Other1Page()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 0.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Text(
          'Chat Penjual',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

// Widget Text Batalkan Pesanan
class CancelOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderCancelledPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 0.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Text(
          'Batalkan Pesanan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
