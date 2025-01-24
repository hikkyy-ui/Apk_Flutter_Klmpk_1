import 'package:apk_flutter_fashionistaid/payment_verification.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatelessWidget {
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

            // Alamat Pengiriman
            ShippingAddress(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Metode Pengiriman
            Delivery(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Voucher
            ItemVoucher(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Metode Pembayaran
            PaymentMethod(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Ringkasan Transaksi
            TransactionSummary(),
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
                  'Checkout',
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

// Widget Alamat Pengiriman
class ShippingAddress extends StatelessWidget {
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
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat pengiriman kamu',
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.grey[700],
              ),
              SizedBox(width: 8.0),
              Text(
                'Rumah - Nama Pembeli',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.chevron_right,
              color: Colors.grey[500],
            ),
          ),
          Text(
            'Nama kota, Kecamatan, Kabupaten, Provinsi, Kelurahan',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          Text(
            'Nama Jalan -',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Metode Pengiriman
class Delivery extends StatelessWidget {
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
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage('assets/logo_fashionista.jpg'),
              ),
              SizedBox(width: 8.0),
              Text(
                'Fashionista Official Store ID',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // Aksi ketika gambar diklik
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Radius outline
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'assets/sepatu_sneakers.jpg', // Gambar Logo 2 (Flash Sale)
                      width: 60,
                      height: 60, // Ukuran Gambar
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sepatu Sneakers Perempuan Casual Korea Kekinian',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Varian: White | XL',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '1 x Rp400.000',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Warna outline
                width: 2.0, // Ketebalan outline
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BEBAS ONGKIR',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Tim Fashionista ID (Rp0 - Rp45.000)',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  'Estimasi tiba 1 - 6 Oct (Express)',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      Icons.shield,
                      size: 16.0,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      'Dilindungi Asuransi Pengiriman (Rp1.000)',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.comment,
                    size: 16.0,
                    color: Colors.grey[600],
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    'Kasih Catatan',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                size: 16.0,
                color: Colors.grey[600],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget Voucher
class ItemVoucher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.purple[200],
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.local_activity, color: Colors.black),
                    SizedBox(width: 8),
                    Text(
                      'Voucher',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right, color: Colors.black),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bebas Ongkir',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  'Rp45.000',
                  style: TextStyle(color: Colors.purple[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Metode Pembayaran
class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.all(15.0), // Padding pada container utama
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Metode Pembayaran',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  print('Lihat semua metode');
                },
                child: Text(
                  'Lihat Semua',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0), // Jarak antar elemen
          PaymentOption(
            iconUrl: 'assets/fashpay.jpg',
            title: 'FashPay (Rp1.000.000)',
            isSelected: true,
          ),
          PaymentOption(
            iconUrl: 'assets/fpay_later.jpg',
            title: 'FPayLater',
            isSelected: false,
          ),
          Divider(),
          PaymentCategory(title: 'Dompet Digital'),
          Divider(),
          PaymentCategory(title: 'Virtual Account'),
          Divider(),
          PaymentCategory(title: 'Transfer Bank'),
        ],
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String iconUrl;
  final String title;
  final bool isSelected;

  PaymentOption({
    required this.iconUrl,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Padding antar opsi
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0), // Radius pada gambar
          child: Image.asset(
            iconUrl,
            width: 40,
            height: 40,
            fit: BoxFit.cover, // Agar gambar tidak terdistorsi
          ),
        ),
        title: Text(title),
        trailing: Radio(
          value: isSelected,
          groupValue: true,
          onChanged: (value) {},
          activeColor: Colors.purple,
        ),
      ),
    );
  }
}

class PaymentCategory extends StatelessWidget {
  final String title;

  PaymentCategory({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.keyboard_arrow_down),
    );
  }
}

// Widget Ringkasan Transaksi
class TransactionSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cek ringkasan transaksimu, yuk',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          _buildSummaryRow('Total Harga (1 Barang)', 'Rp400.000'),
          _buildSummaryRow('Total Ongkos Kirim', 'Rp45.000 - Rp0', isRed: true),
          _buildSummaryRow('Total Asuransi Pengiriman', 'Rp1.000'),
          _buildSummaryRow('Biaya Jasa Aplikasi', 'Rp2.000 - Rp1.000',
              isRed: true),
          Divider(),
          _buildSummaryRow('Total Tagihan', 'Rp402.000', isBold: true),
          SizedBox(height: 16.0),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentVerificationPage(),
                ),
              );
            },
            icon: Icon(Icons.shield, color: Colors.white),
            label: Text(
              'Bayar Sekarang',
              style: TextStyle(color: Colors.white), // Warna teks
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.purple[300], // Warna latar belakang tombol
              minimumSize:
                  Size(double.infinity, 50), // Lebar tombol memenuhi layar
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Radius pada tombol
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: Text(
              'Dengan melanjutkan pembayaran, kamu menyetujui S&K Asuransi Pengiriman & Proteksi',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value,
      {bool isRed = false, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: TextStyle(
              color: isRed ? Colors.purple : Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
