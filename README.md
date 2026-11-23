# Air Quality App

<p align="center">
  Aplikasi mobile berbasis Flutter untuk mencari dan memantau kualitas udara berdasarkan kota.
</p>

---

##  Author

| Informasi | Keterangan |
|---|---|
| Nama | Nurul Fauziah Mustafa |
| NIM | D121241035 |
| Departemen | Teknik Informatika |
| Fakultas | Teknik |
| Universitas | Universitas Hasanuddin |
| Angkatan | 2024 |

---

##  Features

| Fitur | Deskripsi |
|---|---|
| City Search | Mencari kualitas udara berdasarkan nama kota. |
| Air Quality Index (AQI) | Menampilkan nilai dan kategori kualitas udara. |
| Pollutant Information | Menampilkan PM2.5, PM10, CO, NO2, dan O3. |
| Asynchronous Data Fetching | Menggunakan FutureBuilder untuk menangani loading, success, dan error. |
| Local Storage | Menyimpan kota terakhir menggunakan SharedPreferences. |
| Automatic Last Search | Memuat kembali kota terakhir saat aplikasi dibuka. |

---

##  Technologies

- **Framework:** Flutter
- **Programming Language:** Dart
- **API Communication:** REST API, HTTP
- **Local Storage:** SharedPreferences
- **Asynchronous UI:** FutureBuilder

---

##  API

Aplikasi menggunakan layanan Open-Meteo API.

| API | Kegunaan |
|---|---|
| [Geocoding API](https://geocoding-api.open-meteo.com/v1/search) | Mencari koordinat berdasarkan nama kota. |
| [Air Quality API](https://air-quality-api.open-meteo.com/v1/air-quality) | Mengambil data kualitas udara dan polutan. |

---

##  Project Structure

```text
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
```

---

##  Installation

**1. Clone repository**

```bash
git clone https://github.com/fauziahmstf/air-quality-app.git
```

**2. Masuk ke direktori project**

```bash
cd air-quality-app
```

**3. Install dependencies**

```bash
flutter pub get
```

**4. Jalankan aplikasi**

```bash
flutter run
```

---

##  Testing

Jalankan perintah berikut untuk memeriksa kode dan menjalankan pengujian:

```bash
flutter analyze
flutter test
```

---

##  Build APK

Untuk membuat aplikasi versi release:

```bash
flutter build apk --release
```

Lokasi file APK:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

<p align="center">
  <sub>Developed as an individual Mobile Programming course assignment.</sub>
</p>
