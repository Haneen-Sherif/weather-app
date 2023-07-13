import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/models/weather_model.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(), child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherModel? weather;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context)
                .weatherData!
                .getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
