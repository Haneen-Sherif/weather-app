import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        date: data["location"]["localtime"],
        temp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherStateName: jsonData["condition"]["text"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "temp $temp, mintemp $minTemp, maxtemp $maxTemp";
  }

  String getWeather() {
    if (weatherStateName == "Clear" ||
        weatherStateName == "Light Cloud" ||
        weatherStateName == "Sunny") {
      return "assets/images/clear.png";
    } else if (weatherStateName == "Sleet" ||
        weatherStateName == "Snow" ||
        weatherStateName == "Hail") {
      return "assets/images/snow.png";
    } else if (weatherStateName == "Heavy Cloud") {
      return "assets/images/cloudy.png";
    } else if (weatherStateName == "Light Rain" ||
        weatherStateName == "Heavy Rain" ||
        weatherStateName == "Moderate rain") {
      return "assets/images/rainy.png";
    } else if (weatherStateName == "Thunderstorm" ||
        weatherStateName == "Thunder") {
      return "assets/images/thunderstorm.png";
    } else {
      return "assets/images/clear.png";
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == "Clear" ||
        weatherStateName == "Light Cloud" ||
        weatherStateName == "Sunny") {
      return Colors.orange;
    } else if (weatherStateName == "Sleet" ||
        weatherStateName == "Snow" ||
        weatherStateName == "Hail") {
      return Colors.cyan;
    } else if (weatherStateName == "Heavy Cloud") {
      return Colors.grey;
    } else if (weatherStateName == "Light Rain" ||
        weatherStateName == "Heavy Rain" ||
        weatherStateName == "Moderate rain") {
      return Colors.blueGrey;
    } else if (weatherStateName == "Thunderstorm" ||
        weatherStateName == "Thunder") {
      return Colors.indigo;
    } else {
      return Colors.orange;
    }
  }
}
