class PlanetWeather {
  final String name;
  final double mass;
  final double temperature;

  PlanetWeather(
      {required this.name,
      required this.mass,
      required this.temperature,});

  factory PlanetWeather.fromJson(Map<String, dynamic> json) {
    return PlanetWeather(
        name: json['name'],
        mass: json['mass'],
        temperature: json['temperature']);
  }
}
