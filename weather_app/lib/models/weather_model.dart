class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final String icon;
  final String timezone;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.icon,
    required this.timezone,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      timezone: json['timezone'].toString(),
    );
  }
}
