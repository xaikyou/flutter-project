import 'dart:convert';
import 'dart:math';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  static const url = 'http://api.openweathermap.org/data/2.5';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$url/weather?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Faild to load weather data ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> getForecastFor5Days(
      String lat, String lon) async {
    final response = await http.get(Uri.parse(
        '$url/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body)['list'];
      List<ForeCast> forecastList = [];
      for (var item in jsonList) {
        ForeCast forecast = ForeCast.fromJson(item);
        forecastList.add(forecast);
      }

      List<String> dates = [];

      List<double> minTempThreeDays = [];
      List<double> minTempSingleDay = [];

      List<double> maxTempThreeDays = [];
      List<double> maxTempSingleDay = [];

      List<String> iconsThreeDays = [];
      List<String> iconsSingleDay = [];
      Map<String, int> countMap = {};

      List<String> conditions = [];

      for (int i = 0; i < forecastList.length - 1; i++) {
        if (dates.length == 3) break;
        if (forecastList[i].dtTxt.contains('00:00:00') &&
            minTempSingleDay.length == 8) {
          dates.add(forecastList[i].dtTxt);

          minTempThreeDays.add(minTempSingleDay.reduce(min));
          minTempSingleDay.clear();

          maxTempThreeDays.add(maxTempSingleDay.reduce(max));
          maxTempSingleDay.clear();

          countMap.clear();
          for (var item in iconsSingleDay) {
            if (countMap.containsKey(item)) {
              countMap[item] = countMap[item]! + 1;
            } else {
              countMap[item] = 1;
            }
          }
          String mostFrequentIcon =
              countMap.entries.reduce((a, b) => a.value > b.value ? a : b).key;
          iconsThreeDays.add(mostFrequentIcon);
          iconsSingleDay.clear();
        } else if (forecastList[i].dtTxt.contains('00:00:00') &&
            minTempSingleDay.length != 8) {
          minTempSingleDay.clear();
          maxTempSingleDay.clear();
          iconsSingleDay.clear();
        }
        minTempSingleDay.add(forecastList[i].tempMin);
        maxTempSingleDay.add(forecastList[i].tempMin);
        iconsSingleDay.add(forecastList[i].icon);
      }

      minTempThreeDays =
          minTempThreeDays.map((number) => number.ceil().toDouble()).toList();

      maxTempThreeDays =
          maxTempThreeDays.map((number) => number.ceil().toDouble()).toList();

      List<String> formattedDates = dates.map((dateString) {
        DateTime date = DateTime.parse(dateString);
        return DateFormat('EEE, MMM dd')
            .format(date.subtract(const Duration(days: 1)));
      }).toList();

      for (var item in iconsThreeDays) {
        switch (item.substring(0, 2)) {
          case '01':
            conditions.add('clear sky');
            break;
          case '02':
            conditions.add('few clouds');
            break;
          case '03':
            conditions.add('scattered clouds');
            break;
          case '04':
            conditions.add('broken clouds');
            break;
          case '09':
            conditions.add('shower rain');
            break;
          case '10':
            conditions.add('rain');
            break;
          case '11':
            conditions.add('thunderstorm');
            break;
          case '13':
            conditions.add('snow');
            break;
          case '50':
            conditions.add('mist');
            break;
        }
      }

      return {
        'dates': formattedDates,
        'icons': iconsThreeDays,
        'minTemps':
            minTempThreeDays.map((temp) => temp.ceil().toDouble()).toList(),
        'maxTemps':
            maxTempThreeDays.map((temp) => temp.ceil().toDouble()).toList(),
        'conditions': conditions,
      };
    } else {
      throw Exception('Failed to load 5-day forecast ${response.statusCode}');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;

    return city ?? "";
  }
}
