class ForeCast {
  final String dtTxt;
  final double tempMin;
  final double tempMax;
  final String mainCondition;
  final String icon;

  ForeCast({
    required this.dtTxt,
    required this.tempMin,
    required this.tempMax,
    required this.mainCondition,
    required this.icon,
  });

  factory ForeCast.fromJson(Map<String, dynamic> json) {
    return ForeCast(
      dtTxt: json['dt_txt'],
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }
}
