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
  String bgImageUrl =
      'https://images.unsplash.com/photo-1668995215649-d37e4c4ceec0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=410&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        appBar: AppBar(
          title: const Text("WeatherNow"),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(bgImageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    //Location
                    Text(
                      cityName,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      "$temp\u2103",
                      style: const TextStyle(color: Colors.white, fontSize: 80),
                      textAlign: TextAlign.left,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          main,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
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
          const Text(
            "Weather Today",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text("Humidity"),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${weather.humidity.toString()}%",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text("Wind Speed"),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${weather.windSpeed.toString()} km/h",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
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
      width: 150,
      height: 150,
    );
  }
}
