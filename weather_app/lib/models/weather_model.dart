class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final String icon;
  final String timezone;
  final Coord coord;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.icon,
    required this.timezone,
    required this.coord,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      timezone: json['timezone'].toString(),
      coord: Coord.fromJson(json["coord"]),
    );
  }
}

class Coord {
  double lon;
  double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}
