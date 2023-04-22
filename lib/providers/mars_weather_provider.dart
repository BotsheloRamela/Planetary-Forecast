import 'package:flutter/material.dart';
import 'package:planetary_forecast/services/api_services.dart';

import '../models/mars_weather.dart';

class MarsWeatherProvider with ChangeNotifier {
  late MarsWeather _marsWeather;
  late bool _isLoading;
  late String _errorMessage;

  MarsWeather get marsWeather => _marsWeather;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchMarsWeather() async {
    try {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();

      final weather = await ApiService.fetchMarsWeather();
      _marsWeather = weather;
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
