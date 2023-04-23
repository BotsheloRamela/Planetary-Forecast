import 'package:flutter/material.dart';
import 'package:planetary_forecast/models/earth_weather.dart';
import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Planetary Forecast"),
        ),
        body: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot != null) {
                EarthWeather? weather = snapshot.data;
                if (weather == null) {
                  return const Text("Error getting weather");
                } else {
                  return earthWeatherBox(weather);
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
            future: ApiService.fetchEarthWeather("Johannesburg"),
          ),
        ));
  }

  Widget earthWeatherBox(EarthWeather weather) {
    return Column(
      children: <Widget>[
        Text(weather.cityName),
        Text(weather.description),
        Text("Temp: ${weather.temperature}"),
        Text("Humidity: ${weather.humidity}"),
        Text("Wind Speed: ${weather.windSpeed}")
      ],
    );
  }

}
