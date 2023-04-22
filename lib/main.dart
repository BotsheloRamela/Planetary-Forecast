import 'package:flutter/material.dart';
import 'package:planetary_forecast/providers/earth_weather_provider.dart';
import 'package:planetary_forecast/providers/mars_weather_provider.dart';
import 'package:planetary_forecast/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<EarthWeatherProvider>(
          create: (_) => EarthWeatherProvider()),
      ChangeNotifierProvider<MarsWeatherProvider>(
          create: (_) => MarsWeatherProvider())
    ], child: MaterialApp(
      title: 'Planetary Forecast',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: const HomeScreen(),));
  }
}
