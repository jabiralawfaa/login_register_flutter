# Flutter Login & Register Application

Aplikasi Flutter sederhana yang menerapkan sistem login dan registrasi dengan penyimpanan data lokal.

## Daftar Isi
1. [Pembuatan Proyek](#pembuatan-proyek)
   - Instalasi Flutter
   - Membuat Proyek Baru
   - Struktur Proyek

2. [Implementasi Kode Flutter](#implementasi-kode-flutter)
   - [Main Application (main.dart)](#main-application)
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

   - [User Data Storage (data/user_data.dart)](#user-data-storage)
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

   - [Registration Page (register_page.dart)](#registration-page)
   - [Login Page (login_page.dart)](#login-page)

3. [Menjalankan Aplikasi](#menjalankan-aplikasi)

4. [Pengujian](#pengujian)

5. [Deployment](#deployment)

## Pembuatan Proyek

[Isi akan ditambahkan]

## Implementasi Kode Flutter

### Main Application

File `main.dart` berfungsi sebagai entry point aplikasi yang mengatur tema dan halaman awal.

### User Data Storage

File `data/user_data.dart` berfungsi sebagai "database" sementara untuk menyimpan data pengguna.

### Registration Page

File `register_page.dart` berisi implementasi halaman registrasi untuk pengguna baru.

### Login Page

File `login_page.dart` berisi implementasi halaman login untuk autentikasi pengguna.

[Bab-bab selanjutnya akan ditambahkan]
