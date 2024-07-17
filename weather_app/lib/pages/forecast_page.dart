import 'package:flutter/material.dart';

class ForecastPage extends StatefulWidget {
  final Map<String, dynamic>? forecastInfo;

  const ForecastPage({
    super.key,
    required this.forecastInfo,
  });

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final TextStyle _textStyle = const TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  '3-day forecast',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: List.generate(3, (int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: SizedBox(
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                widget.forecastInfo!['dates'][index].toString(),
                                style: _textStyle,
                              ),
                              SafeArea(
                                child: Image.network(
                                  'http://openweathermap.org/img/wn/${widget.forecastInfo!['icons'][index] ?? "01d"}.png',
                                ),
                              ),
                              Text(
                                '${widget.forecastInfo!['maxTemps'][index].toString()} / '
                                '${widget.forecastInfo!['minTemps'][index].toString()} °C',
                                style: _textStyle,
                              ),
                              Text(
                                widget.forecastInfo!['conditions'][index]
                                    .toString(),
                                style: _textStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
