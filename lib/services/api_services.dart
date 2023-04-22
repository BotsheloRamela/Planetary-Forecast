import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:planetary_forecast/models/earth_weather.dart';
import 'package:planetary_forecast/models/mars_weather.dart';
import 'api_key.dart';

class ApiService {
  static const String _openWeatherMapApiKey = openWeatherMapApiKey;
  static const String _openWeatherMapApiUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  static const String _nasaApiKey = nasaApiKey;
  static const String _nasaApiUrl =
      'https://api.nasa.gov/insight_weather/?api_key=$_nasaApiKey&feedtype=json&ver=1.0';

  static Future<EarthWeather> fetchEarthWeather(String cityName) async {
    final url =
        '$_openWeatherMapApiUrl?q=$cityName&appid=$_openWeatherMapApiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return EarthWeather.fromJson(json);
    } else {
      throw Exception('Failed to fetch weather data for $cityName');
    }
  }

  static Future<MarsWeather> fetchMarsWeather() async {
    final response = await http.get(Uri.parse(_nasaApiUrl));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final latestData = json['sol_keys'].last;
      return MarsWeather.fromJson(json['sol'][latestData]);
    } else {
      throw Exception('Failed to fetch Mars weather data');
    }
  }
}
