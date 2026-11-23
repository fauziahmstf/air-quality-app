# Air Quality App

Aplikasi mobile berbasis Flutter untuk memantau kualitas udara berdasarkan lokasi kota yang dicari pengguna. Aplikasi mengambil data kualitas udara melalui REST API dan menampilkan Air Quality Index (AQI) beserta informasi beberapa polutan udara.

## Features

- **City Search:** Mencari informasi kualitas udara berdasarkan nama kota.
- **Air Quality Index (AQI):** Menampilkan nilai AQI dan kategori kualitas udara.
- **Pollutant Information:** Menampilkan kadar PM2.5, PM10, Carbon Monoxide, Nitrogen Dioxide, dan Ozone.
- **Asynchronous Data Loading:** Menggunakan FutureBuilder untuk menangani proses loading, success, dan error.
- **Local Storage:** Menggunakan SharedPreferences untuk menyimpan nama kota terakhir yang dicari.
- **Last Search:** Menampilkan kembali kota terakhir ketika aplikasi dibuka ulang.

## Technologies Used

- Flutter
- Dart
- REST API
- HTTP Package
- SharedPreferences
- Android Emulator

## API Used

Aplikasi menggunakan Open-Meteo API untuk memperoleh informasi lokasi dan kualitas udara.

1. **Geocoding API:** Mencari koordinat latitude dan longitude berdasarkan nama kota.
   - https://geocoding-api.open-meteo.com/v1/search

2. **Air Quality API:** Mengambil data kualitas udara berdasarkan koordinat lokasi.
   - https://air-quality-api.open-meteo.com/v1/air-quality

## Project Structure

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

test/
└── widget_test.dart
```

## Installation and Setup

1. Clone this repository:

```bash
git clone https://github.com/fauziahmstf/air-quality-app.git
```

2. Navigate to the project directory:

```bash
cd air-quality-app
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## Build APK

To generate a release APK, run:

```bash
flutter build apk --release
```

The generated APK can be found at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Testing

Run the following commands to check the project:

```bash
flutter analyze
flutter test
```

## Project Information

**Project:** Air Quality App  
**Framework:** Flutter  
**Language:** Dart  
**Platform:** Android

Developed as an individual assignment for the Mobile Programming course.