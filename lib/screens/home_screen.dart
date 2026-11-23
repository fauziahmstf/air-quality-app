
import 'package:flutter/material.dart';
import '../services/air_quality_service.dart';
import '../services/storage_service.dart';
import '../models/air_quality.dart';
import '../widgets/search_field.dart';
import '../widgets/aqi_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AirQualityService _airQualityService = AirQualityService();
  final StorageService _storageService = StorageService();
  final TextEditingController _cityController = TextEditingController();

  Future<AirQuality>? _airQualityFuture;

  @override
  void initState() {
    super.initState();
    loadLastCity();
  }

  Future<void> loadLastCity() async {
    final city = await _storageService.getLastCity();

    if (city != null && mounted) {
      _cityController.text = city;
      searchCity(city);
    }
  }

  void searchCity(String city) {
    if (city.trim().isEmpty) return;

    setState(() {
      _airQualityFuture = _airQualityService.searchByCity(city.trim());
    });

    _storageService.saveLastCity(city.trim());
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F6FC),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Air Quality App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A5F),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Icon(
              Icons.air,
              size: 42,
              color: Color(0xFF2878C8),
            ),
            const SizedBox(height: 12),
            const Text(
              'Cek Kualitas Udara',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A5F),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cari tahu kondisi kualitas udara di kota Anda secara langsung.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            SearchField(
              controller: _cityController,
              onSearch: () => searchCity(_cityController.text),
            ),
            const SizedBox(height: 28),
            const Text(
              'Hasil Pencarian',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A5F),
              ),
            ),
            const SizedBox(height: 14),
            if (_airQualityFuture == null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.location_searching,
                      size: 42,
                      color: Color(0xFF8AA8C5),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Belum Ada Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Masukkan nama kota untuk melihat informasi kualitas udara.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              )
            else
              FutureBuilder<AirQuality>(
                future: _airQualityFuture,
                builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text(
                          'Mengambil Data Kualitas Udara...',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Mohon tunggu sebentar.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.cloud_off,
                          color: Colors.red,
                          size: 42,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Gagal Mengambil Data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Pastikan nama kota benar dan koneksi internet tersedia.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                }


                  if (snapshot.hasData) {
                    return AqiCard(data: snapshot.data!);
                  }

                  return const Center(
                    child: Text('Data tidak tersedia'),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
