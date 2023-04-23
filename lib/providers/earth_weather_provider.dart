import 'package:flutter/material.dart';
import 'package:planetary_forecast/models/earth_weather.dart';

import '../services/api_services.dart';

class EarthWeatherProvider with ChangeNotifier {
  late EarthWeather _earthWeather;
  late bool _isLoading = false;
  late String _errorMessage = '';

  EarthWeather get earthWeather => _earthWeather;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchEarthWeather(String cityName) async {
    try {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();

      final weather = await ApiService.fetchEarthWeather(cityName);
      _earthWeather = weather;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
