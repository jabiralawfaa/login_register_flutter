# Flutter Login & Register Application

Aplikasi Flutter sederhana yang menerapkan sistem login dan registrasi dengan penyimpanan data lokal.

## Daftar Isi
1. [Pembuatan Proyek](#pembuatan-proyek)
   - Membuat Proyek Baru
   - Struktur Proyek

2. [Implementasi Kode Flutter](#implementasi-kode-flutter)
   - [Main Application (main.dart)](#main-application)
   - [User Data Storage (data/user_data.dart)](#user-data-storage)
   - [Registration Page (register_page.dart)](#registration-page)
   - [Login Page (login_page.dart)](#login-page)

3. [Menjalankan Aplikasi](#menjalankan-aplikasi)

4. [Latihan](#latihan)
    - [Validasi Input](#validasi-input)
    - [Tampilkan atau Sembunyikan Password](#tampilkan-atau-sembunyikan-password)
    - [Animasi Sederhana](#animasi-sederhana)
    - [Simpan Sesi Login](#simpan-sesi-login)

## Pembuatan Proyek

![](/report/1.membuat-proyek.png)

![](/report/2.susunan-folder-awal-setelah-instalasi.png)

## Implementasi Kode Flutter

### Main Application

File `main.dart` berfungsi sebagai entry point aplikasi yang mengatur tema dan halaman awal.

```dart
import 'package:flutter/material.dart';
import 'package:login_register/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

```

![](/report/3.main-dart.png)

### User Data Storage

File `data/user_data.dart` berfungsi sebagai "database" sementara untuk menyimpan data pengguna.

```dart
/// Variabel global untuk menyimpan data pengguna.
/// Struktur: Map<String, Map<String, String>>
/// Key luar adalah email, value adalah Map yang berisi fullName dan password.
Map<String, Map<String, String>> userData = {
  // Contoh data awal (bisa dikosongkan)
  'test@email.com': {
    'fullName': 'Test User',
    'password': 'password123',
  },
};

```

![](/report/4.userdata-dart.png)

### Registration Page

File `register_page.dart` berisi implementasi halaman registrasi untuk pengguna baru.

```dart
import 'package:flutter/material.dart';
import 'package:login_register/data/user_data.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() {
    String fullName = _fullNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (fullName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      userData[email] = {
        'fullName': fullName,
        'password': password,
      };

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Registrasi Berhasil'),
          content: Text('Akun Anda telah dibuat. Silakan login.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                Navigator.pop(context); // Kembali ke halaman login
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Registrasi Gagal'),
          content: Text('Harap isi semua kolom.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6DD5FA), Color(0xFF2980B9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_add_alt_1, size: 80, color: Colors.white),
                SizedBox(height: 20),
                Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Register', style: TextStyle(fontSize: 18)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: TextStyle(color: Colors.white70)),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Sign In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

![](/report/6.register-page-dart.png)

### Login Page

File `login_page.dart` berisi implementasi halaman login untuk autentikasi pengguna.

```dart
import 'package:flutter/material.dart';
import 'package:login_register/register_page.dart';
import 'package:login_register/home_page.dart';
import 'package:login_register/data/user_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (userData.containsKey(email) && userData[email]!['password'] == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            fullName: userData[email]!['fullName']!,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Email atau password salah.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.lock_person, size: 80, color: Colors.white),
                SizedBox(height: 20),
                Text(
                  'Welcome Back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Login', style: TextStyle(fontSize: 18)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Colors.white70)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

![](/report/5.login-page-dart.png)

## Menjalankan Aplikasi

### Halaman Registrasi

![](/report/9.tampilan-register.png)

### Halaman Login

![](/report/8.tampilan-login.png)

![](/report/10.tampilan-login-dengan-email-dan-password-tertulis.png)

### Halaman Utama

![](/report/11.tampilan-home.png)


## Latihan

### Validasi Input

![](/report/12.Lat1-validasi-input1.png)

![](/report/12.Lat1-validasi-input2.png)

![](/report/12.Lat1-validasi-input3.png)

![](/report/12.Lat1-validasi-input4.png)

### Tampilkan atau Sembunyikan Password

![](/report/13.lat2-lihat-password1.png)

![](/report/13.lat2-lihat-password2.png)

![](/report/13.lat2-lihat-password3.png)

![](/report/13.lat2-lihat-password4.png)

![](/report/13.lat2-lihat-password5.png)

![](/report/13.lat2-lihat-password6.png)

### Animasi Sederhana

![](/report/14.lat3-animasi1.png)

![](/report/14.lat3-animasi2.png)

### Simpan Sesi Login

