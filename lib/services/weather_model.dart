import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherSateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherSateName});

  factory WeatherModel.formJson(Map<String, dynamic> data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherSateName: jsonData['condition']['text']);
  }
  @override
  String toString() {
    return 'tem = $temp  minTemp = $minTemp  date = $date';
  }

  String getImage() {
    if (weatherSateName == 'Sunny' ||
        weatherSateName == 'Clear' ||
        weatherSateName == 'partly cloudy') {
      return 'assets/clear.png';
    } else if (weatherSateName == 'Blizzard' ||
        weatherSateName == 'Patchy snow possible' ||
        weatherSateName == 'Patchy sleet possible' ||
        weatherSateName == 'Patchy freezing drizzle possible' ||
        weatherSateName == 'Blowing snow') {
      return 'assets/snow.png';
    } else if (weatherSateName == 'Freezing fog' ||
        weatherSateName == 'Fog' ||
        weatherSateName == 'Heavy Cloud' ||
        weatherSateName == 'Mist' ||
        weatherSateName == 'Fog') {
      return 'assets/cloudy.png';
    } else if (weatherSateName == 'Patchy rain possible' ||
        weatherSateName == 'Heavy Rain' ||
        weatherSateName == 'Showers	') {
      return 'assets/rainy.png';
    } else if (weatherSateName == 'Thundery outbreaks possible' ||
        weatherSateName == 'Moderate or heavy snow with thunder' ||
        weatherSateName == 'Patchy light snow with thunder' ||
        weatherSateName == 'Moderate or heavy rain with thunder' ||
        weatherSateName == 'Patchy light rain with thunder') {
      return 'assets/thunderstorm.png';
    } else {
      return 'assets/clear.png';
    }
  }

  getThemeColor() {
    if (weatherSateName == 'Sunny' ||
        weatherSateName == 'Clear' ||
        weatherSateName == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherSateName == 'Blizzard' ||
        weatherSateName == 'Patchy snow possible' ||
        weatherSateName == 'Patchy sleet possible' ||
        weatherSateName == 'Patchy freezing drizzle possible' ||
        weatherSateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherSateName == 'Freezing fog' ||
        weatherSateName == 'Fog' ||
        weatherSateName == 'Heavy Cloud' ||
        weatherSateName == 'Mist' ||
        weatherSateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherSateName == 'Patchy rain possible' ||
        weatherSateName == 'Heavy Rain' ||
        weatherSateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherSateName == 'Thundery outbreaks possible' ||
        weatherSateName == 'Moderate or heavy snow with thunder' ||
        weatherSateName == 'Patchy light snow with thunder' ||
        weatherSateName == 'Moderate or heavy rain with thunder' ||
        weatherSateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
