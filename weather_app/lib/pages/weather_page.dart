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

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      throw Exception('Faild to find the city');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
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
                  maxLength: null,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    prefixIcon: GestureDetector(
                      onTap: () {},
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

            // City's Name
            Text(
              _weather?.cityName ?? 'Loading city...',
              style: const TextStyle(fontSize: 20),
            ),

            // Image
            SafeArea(
              child: Image.network(
                  'http://openweathermap.org/img/wn/${_weather?.icon ?? "01d"}.png'),
            ),

            // Temperature
            Text(
              '${_weather?.temperature.round()}°C',
              style: const TextStyle(fontSize: 20),
            ),

            // Main Condition
            Text(
              '${_weather?.temperature.round()}°C',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
