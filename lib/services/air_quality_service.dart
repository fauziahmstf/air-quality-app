
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/air_quality.dart';

class AirQualityService {
  Future<AirQuality> searchByCity(String city) async {
    final url = Uri.parse(
      'https://geocoding-api.open-meteo.com/v1/search'
      '?name=${Uri.encodeComponent(city)}'
      '&count=1'
      '&language=en'
      '&format=json',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, Object?>;
      final results = data['results'] as List<Object?>?;

      if (results == null || results.isEmpty) {
        throw Exception('Kota tidak ditemukan');
      }

      final location = results.first as Map<String, Object?>;

      final latitude = (location['latitude'] as num).toDouble();
      final longitude = (location['longitude'] as num).toDouble();
      final cityName = location['name'] as String;

      return getAirQuality(cityName, latitude, longitude);
    } else {
      throw Exception('Gagal mencari lokasi kota');
    }
  }

  Future<AirQuality> getAirQuality(
    String city,
    double latitude,
    double longitude,
  ) async {
    final url = Uri.parse(
      'https://air-quality-api.open-meteo.com/v1/air-quality'
      '?latitude=$latitude'
      '&longitude=$longitude'
      '&current=pm10,pm2_5,carbon_monoxide,nitrogen_dioxide,ozone,us_aqi',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final current = data['current'];

      return AirQuality(
        city: city,
        aqi: (current['us_aqi'] as num).round(),
        pm25: (current['pm2_5'] as num).toDouble(),
        pm10: (current['pm10'] as num).toDouble(),
        carbonMonoxide: (current['carbon_monoxide'] as num).toDouble(),
        nitrogenDioxide: (current['nitrogen_dioxide'] as num).toDouble(),
        ozone: (current['ozone'] as num).toDouble(),
      );
    } else {
      throw Exception('Gagal mengambil data kualitas udara');
    }
  }
}
