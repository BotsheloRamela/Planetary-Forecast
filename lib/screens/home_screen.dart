import 'package:flutter/material.dart';
import 'package:planetary_forecast/providers/earth_weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:planetary_forecast/models/earth_weather.dart';
import 'package:planetary_forecast/providers/mars_weather_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
