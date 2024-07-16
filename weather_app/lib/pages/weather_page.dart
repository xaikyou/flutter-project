import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var textController = TextEditingController();

  final _weatherService = WeatherService('27c472aed2837389d80bf18841ec60e8');
  Weather? _weather;

  Future<void> _fetchWeather() async {
    String cityName;

    try {
      cityName = await _weatherService
          .getCurrentCity()
          .timeout(const Duration(seconds: 10));
    } catch (_) {
      cityName = 'England';
    }

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      throw Exception('Error fetching weather: $e');
    }
  }

  Future<void> _fetchWeatherForCity(String cityName) async {
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      throw Exception('Error fetching weather for $cityName: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();

    Timer.periodic(const Duration(milliseconds: 1), (Timer t) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: textController,
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (value) {
                    _fetchWeatherForCity(textController.text);
                  },
                  maxLength: null,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    prefixIcon: GestureDetector(
                      onTap: () => {
                        _fetchWeatherForCity(textController.text),
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Colors.blueAccent, width: 2.0),
                    ),
                    hintText: "Weather in your city",
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            _weather != null
                ? Column(
                    children: [
                      // City's Name
                      Text(
                        _weather?.cityName ?? 'Loading city...',
                        style: const TextStyle(fontSize: 20),
                      ),

                      // City's Time
                      Text(
                        '${DateTime.now().add(Duration(seconds: int.parse(_weather!.timezone) - DateTime.now().timeZoneOffset.inSeconds))}'
                            .split('.')[0], // Remove milliseconds
                        style: const TextStyle(fontSize: 20),
                      ),

                      // Image
                      SafeArea(
                        child: Image.network(
                          'http://openweathermap.org/img/wn/${_weather?.icon ?? "01d"}.png',
                        ),
                      ),

                      // Main Condition
                      Text(
                        _weather!.mainCondition,
                        style: const TextStyle(fontSize: 20),
                      ),

                      // Temperature
                      Text(
                        '${_weather?.temperature.round()}°C',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                : const Text('No weather data'),
          ],
        ),
      ),
    );
  }
}
