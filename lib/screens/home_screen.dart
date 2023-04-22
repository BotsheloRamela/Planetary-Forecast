import 'package:flutter/material.dart';
import 'package:planetary_forecast/providers/earth_weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:planetary_forecast/providers/mars_weather_provider.dart';

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
      body: Column(
        children: [
          TextField(
            controller: _cityController,
            decoration: InputDecoration(
              labelText: 'Enter a city name',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Provider.of<EarthWeatherProvider>(context, listen: false)
                      .fetchEarthWeather(_cityController.text);
                },
              ),
            ),
          ),
          Consumer<EarthWeatherProvider>(builder: (context, provder, child) {
            if (provder.isLoading) {
              return const CircularProgressIndicator();
            } else if (provder.errorMessage.isNotEmpty) {
              return Text(provder.errorMessage);
            } else if (provder.earthWeather != null) {
              return Text(provder.earthWeather.toString());
            } else {
              return const SizedBox.shrink();
            }
          }),
          ElevatedButton(
             child: const Text("Fetch Mars weather"),
              onPressed: () {
                Provider.of<MarsWeatherProvider>(context, listen: false).fetchMarsWeather();
              },
             ),
             Consumer<MarsWeatherProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const CircularProgressIndicator();
                } else if (provider.errorMessage.isNotEmpty) {
                  return Text(provider.errorMessage);
                } else if (provider.marsWeather != null) {
                  return Text(provider.marsWeather.toString());
                } else {
                  return const SizedBox.shrink();
                }
              }) ,
        ],
      ),
    );
  }
}
