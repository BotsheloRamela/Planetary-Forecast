class Weather {
  final String cityName;
  final String description;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String main;

  Weather(
      {required this.cityName,
      required this.description,
      required this.temperature,
      required this.humidity,
      required this.windSpeed,
      required this.main});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        description: json['weather'][0]['description'],
        temperature: json['main']['temp'].toDouble(),
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'].toDouble(),
        main: json["weather"][0]["main"]);
  }
}
