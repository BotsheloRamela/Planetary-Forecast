import 'package:flutter/material.dart';
import 'package:planetary_forecast/providers/earth_weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:planetary_forecast/models/earth_weather.dart';
import 'package:planetary_forecast/providers/mars_weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  void _fetchEarthWeather(BuildContext context) {
    final provider = Provider.of<EarthWeatherProvider>(context, listen: false);
    provider.fetchEarthWeather(_cityController.text);
  }

  void _fetchMarsWeather(BuildContext context) {
    final provider = Provider.of<MarsWeatherProvider>(context, listen: false);
    provider.fetchMarsWeather();
  }
}
