import 'package:flutter/material.dart';
import 'package:apk_flutter_fashionistaid/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: AccountSettingsPage(),
    );
  }
}

class AccountSettingsPage extends StatelessWidget {
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
            AppBarWidget(),
            SizedBox(height: 2.0), // Jarak antar widget

            // Pengaturan Settings
            ProfileCardSettings(),

            // Text Pengaturan Akun Lainnya
            AccountSettingsOtherPage(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Pengaturan Aplikasi
            ApplicationSettings(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Seputar Fashionista ID
            AboutFashionistaID(),
            SizedBox(height: 5.0), // Jarak antar widget

            // Keluar Akun
            LogoutOfAccount(),
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
      color: Colors.purple[300],
      padding: EdgeInsets.only(left: 10.0, top: 47, right: 10.0, bottom: 17.0),
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
                  'Akun Saya',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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

// Widget Pengaturan Akun
class ProfileCardSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 32,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Kamu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'No Handphone',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Email@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
    );
  }
}

// Widget Text Pengaturan Akun
class AccountSettingsOtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pengaturan Akun',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            AccountSettingItem(
              icon: Icons.location_on,
              title: 'Daftar Alamat',
              subtitle: 'Atur alamat pengiriman belanjaan',
            ),
            AccountSettingItem(
              icon: Icons.account_balance,
              title: 'Rekening Bank',
              subtitle: 'Tarik Saldo Tokopedia ke rekening tujuan',
            ),
            AccountSettingItem(
              icon: Icons.credit_card,
              title: 'Pembayaran Instan',
              subtitle: 'E-wallet, kartu kredit, & debit instan terdaftar',
            ),
            AccountSettingItem(
              icon: Icons.lock,
              title: 'Keamanan Akun',
              subtitle: 'Kata sandi, PIN, & verifikasi data diri',
            ),
            AccountSettingItem(
              icon: Icons.notifications,
              title: 'Notifikasi',
              subtitle: 'Atur segala jenis pesan notifikasi',
            ),
            AccountSettingItem(
              icon: Icons.public,
              title: 'Privasi Akun',
              subtitle: 'Atur penggunaan data',
            ),
          ],
        ),
      ),
    );
  }
}

class AccountSettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const AccountSettingItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600]),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget Pengaturan Aplikasi
class ApplicationSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pengaturan Aplikasi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            SettingItem(
              icon: Icons.shield,
              title: 'Safe Mode',
              subtitle: 'Hasil pencarian aman untuk segala usia',
              hasSwitch: true,
              switchValue: false,
            ),
            SettingItem(
              icon: Icons.videocam,
              title: 'Putar Otomatis Video',
              subtitle:
                  'Putar video di halaman Tokopedia Play\n& hasil pencarian secara otomatis',
              hasSwitch: true,
              switchValue: true,
            ),
            SettingItem(
              icon: Icons.brightness_6,
              title: 'Tampilan',
              subtitle: 'Atur tampilan warna di Tokopedia',
            ),
            SettingItem(
              icon: Icons.image,
              title: 'Kualitas Gambar',
              subtitle: 'Atur kualitas gambar yang kamu lihat',
            ),
            SettingItem(
              icon: Icons.delete,
              title: 'Bersihkan Cache',
              subtitle: 'Solusi cepat untuk atasi masalah aplikasi',
            ),
            SettingItem(
              icon: Icons.videocam,
              title: 'Perekam Layar',
              subtitle: 'Lampiran video untuk laporan kendala',
            ),
          ],
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool hasSwitch;
  final bool switchValue;

  SettingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.hasSwitch = false,
    this.switchValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey[600]),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
          if (hasSwitch)
            Switch(
              value: switchValue,
              onChanged: (value) {},
            ),
        ],
      ),
    );
  }
}

// Widget Seputar Fashionista ID
class AboutFashionistaID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pengaturan Akun',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            AboutItem(
              icon: Icons.info_outline,
              title: 'Kenali Fashionista ID',
            ),
            AboutItem(
              icon: Icons.description_outlined,
              title: 'Syarat dan Ketentuan',
            ),
            AboutItem(
              icon: Icons.security_outlined,
              title: 'Hak Kekayaan Intelektual',
            ),
            AboutItem(
              icon: Icons.star_border,
              title: 'Ulasan Aplikasi Ini',
            ),
          ],
        ),
      ),
    );
  }
}

class AboutItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const AboutItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600]),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget Keluar Akun
class LogoutOfAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.grey[700]),
              onPressed: () {
                // Tampilkan dialog konfirmasi logout
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Keluar Akun'),
                    content: Text('Apakah Anda yakin ingin keluar dari akun?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Tutup dialog
                        },
                        child: Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Tutup dialog
                          // Lakukan aksi logout, seperti navigasi atau penghapusan sesi
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text('Keluar'),
                      ),
                    ],
                  ),
                );
              },
            ),
            title: Text(
              'Keluar Akun',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              'Versi 1.0',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
