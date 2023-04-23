import 'package:flutter/material.dart';
import 'package:planetary_forecast/models/weather.dart';
import '../services/api_services.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  static String cityName = '';
  static String temp = '';
  static String main = '';
  String date = DateFormat('MMM d, h:mm a').format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Planetary Forecast"),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1496016943515-7d33598c11e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.white,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          cityName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            weatherIcon(),
                            Text(
                              "It's $main",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "$temp\u2103",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 60),
                          textAlign: TextAlign.left,
                        )
                      ],
                    )
                  ],
                ),
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot != null) {
                    Weather? weather = snapshot.data;
                    if (weather == null) {
                      return const Text("Error getting weather");
                    } else {
                      return weatherData(weather);
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
                future: ApiService.fetchWeather("Johannesburg"),
              ),
            ],
          ),
        ));
  }

  Widget weatherData(Weather weather) {
    cityName = weather.cityName;
    temp = weather.temperature.toInt().toString();
    main = weather.main;
    return Container(
      height: 200,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(weather.cityName),
          const Text("Weather Today"),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(weather.description),
              Text(weather.temperature.toString()),
              Text(weather.humidity.toString()),
              Text(weather.windSpeed.toString())
            ],
          )
        ],
      ),
    );
  }

  Widget weatherIcon() {
    String imgURL = '';
    switch (main) {
      case 'Sunny':
        imgURL = 'https://img.icons8.com/ios/256/sun.png';
        break;
      case "Clear":
        imgURL = 'http://openweathermap.org/img/wn/01d@2x.png';
        break;
      case "Rain":
        imgURL = 'http://openweathermap.org/img/wn/10d@2x.png';
        break;
      case "Thundersorm":
        imgURL = "http://openweathermap.org/img/wn/11d@2x.png";
        break;
      case "Drizzle:":
        imgURL = 'http://openweathermap.org/img/wn/09d@2x.png';
        break;
      case "Snow":
        imgURL = 'http://openweathermap.org/img/wn/13d@2x.png';
        break;
      case "Clouds":
        imgURL = 'http://openweathermap.org/img/wn/02d@2x.png';
    }

    return Image.network(
      imgURL,
      width: 50,
      height: 50,
    );
  }
}
