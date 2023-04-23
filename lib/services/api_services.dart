import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:planetary_forecast/models/earth_weather.dart';
import 'api_key.dart';

class ApiService {
  static const String _openWeatherMapApiKey = openWeatherMapApiKey;
  static const String _openWeatherMapApiUrl =
      'https://api.openweathermap.org/data/2.5/weather';

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

}
