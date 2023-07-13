import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/models/weather_model.dart';
import 'package:untitled1/pages/search_page.dart';
import 'package:untitled1/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      updateUi: updateUi,
                    );
                  },
                ));
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(Provider.of<WeatherProvider>(context).cityName!,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  // Text(
                  //   "updated: ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}",
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  Text(
                    "updatesd at: ${weatherData!.date}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getWeather()),
                      Text(weatherData!.temp.toInt().toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Column(
                        children: [
                          Text(
                            "maxTemp: ${weatherData!.maxTemp.toInt()}",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "minTemp: ${weatherData!.minTemp.toInt()}",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(weatherData!.weatherStateName,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}
