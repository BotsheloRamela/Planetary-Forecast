class MarsWeather {
  final String season;
  final double averageTemperature;
  final double minimumTemperature;
  final double maximumTemperature;

  MarsWeather(
      {required this.season,
      required this.averageTemperature,
      required this.minimumTemperature,
      required this.maximumTemperature});

  factory MarsWeather.fromJson(Map<String, dynamic> json) {
    return MarsWeather(
        season: json['Season'],
        averageTemperature: json['AT'].toDouble(),
        minimumTemperature: json['HWS']['mn'].toDouble(),
        maximumTemperature: json['HWS']['mx'].toDouble()
      );
  }
}
