import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:planetary_forecast/models/weather.dart';
import 'api_key.dart';

class ApiService {
  static const String _openWeatherMapApiKey = openWeatherMapApiKey;
  static const String _openWeatherMapApiUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  static const String _unsplashApiAccessKey = unsplashApiAccessKey;
  static const String _unsplashApiUrl =
      'https://api.unsplash.com/search/photos?page=1&query=';

  static Future<Weather> fetchWeather(String cityName) async {
    final url =
        '$_openWeatherMapApiUrl?q=$cityName&appid=$_openWeatherMapApiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      throw Exception('Failed to fetch weather data for $cityName');
    }
  }

  static Future<BackgroundImage> fetchBackgroundImage(String weather) async {
    final url = '$_unsplashApiUrl$weather&client_id=$_unsplashApiAccessKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return BackgrounImage.fromJson(json);
    } else {
      throw Exception('Failed to fetch background image');
    }
  }
}
