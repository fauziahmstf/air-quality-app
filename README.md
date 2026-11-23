Air Quality App

Aplikasi mobile berbasis Flutter untuk mencari dan memantau kualitas udara berdasarkan kota. Aplikasi menampilkan nilai Air Quality Index (AQI) beserta informasi beberapa polutan udara.

Author

Nama: Nurul Fauziah Mustafa

NIM: D121241035

Program Studi: Teknik Informatika

Fakultas: Teknik

Universitas: Universitas Hasanuddin

Angkatan: 2024

Features

City Search: Mencari informasi kualitas udara berdasarkan nama kota.

Air Quality Index (AQI): Menampilkan nilai dan kategori kualitas udara.

Pollutant Information: Menampilkan informasi PM2.5, PM10, Carbon Monoxide (CO), Nitrogen Dioxide (NO2), dan Ozone (O3).

Asynchronous Data Fetching: Menggunakan FutureBuilder untuk menangani proses loading, success, dan error.

Local Storage: Menyimpan kota terakhir yang dicari menggunakan SharedPreferences.

Automatic Last Search: Menampilkan kembali data berdasarkan kota terakhir yang dicari saat aplikasi dibuka.

Technologies

Flutter

Dart

REST API

HTTP

SharedPreferences

FutureBuilder

API

Aplikasi menggunakan Open-Meteo API untuk memperoleh data lokasi dan kualitas udara.

Geocoding API: Digunakan untuk mencari koordinat berdasarkan nama kota.

https://geocoding-api.open-meteo.com/v1/search

Air Quality API: Digunakan untuk memperoleh informasi kualitas udara dan polutan.

https://air-quality-api.open-meteo.com/v1/air-quality

Project Structure

lib/
├── main.dart
├── models/
│   └── air_quality.dart
├── screens/
│   └── home_screen.dart
├── services/
│   ├── air_quality_service.dart
│   └── storage_service.dart
└── widgets/
    ├── aqi_card.dart
    └── search_field.dart

Installation and Setup

Clone repository:

git clone https://github.com/fauziahmstf/air-quality-app.git

Masuk ke direktori project:

cd air-quality-app

Install dependencies:

flutter pub get

Jalankan aplikasi:

flutter run

Testing

Jalankan perintah berikut untuk memeriksa kode dan menjalankan pengujian:

flutter analyze
flutter test

Build APK

Untuk membuat APK versi release:

flutter build apk --release

File APK akan tersedia di:

build/app/outputs/flutter-apk/app-release.apk

License

This project was developed for an individual Mobile Programming course assignment.