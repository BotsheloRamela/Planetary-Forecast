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
    return Scaffold(
      appBar: AppBar(
        title: Text("Planetary Forecast"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _cityController,
            decoration: InputDecoration(
              labelText: 'Enter a city name',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Provider.of<EarthWeatherProvider>(context, listen: false)
                      .fetchEarthWeather(_cityController.text);
                },
              ),
            ),
          ),
          Consumer<EarthWeatherProvider>(builder: (context, provder, child) {
            if (provder.isLoading) {
              return CircularProgressIndicator();
            } else if (provder.errorMessage.isNotEmpty) {
              return Text(provder.errorMessage);
            } else if (provder.earthWeather != null) {
              return Text(provder.earthWeather.toString());
            } else {
              return SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}
