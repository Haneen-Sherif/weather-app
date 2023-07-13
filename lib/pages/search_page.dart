import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/models/weather_model.dart';
import 'package:untitled1/providers/weather_provider.dart';
import 'package:untitled1/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});

  String? cityName;
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search a City"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              onChanged: (value) {
                cityName = value;
              },
              onSubmitted: (value) async {
                cityName = value;
                WeatherService service = WeatherService();
                WeatherModel weather =
                    await service.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    cityName;
                // updateUi!();
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () async {
                        WeatherService service = WeatherService();
                        WeatherModel weather =
                            await service.getWeather(cityName: cityName!);
                        Provider.of<WeatherProvider>(context, listen: false)
                            .weatherData = weather;
                        Provider.of<WeatherProvider>(context, listen: false)
                            .cityName = cityName;
                        // updateUi!();
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.search)),
                  border: OutlineInputBorder(),
                  label: Text("Search"),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  hintText: "Enter City Name"),
            ),
          ),
        ));
  }
}
