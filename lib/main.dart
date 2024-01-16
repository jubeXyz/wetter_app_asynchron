import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wetter_app_asynchron/weather_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late WeatherData weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = getWeatherData();
  }

  WeatherData getWeatherData() {
    const jsonString = """
 {
    "city": "Stuttgart",
     "latitude": 48.78,
     "longitude": 9.18,
     "current": {
         "time": "2024-01-12T11:45",
         "temperature_2m": -3.6,
         "apparent_temperature": -7.0,
         "is_day": 1,
         "precipitation": 12.00
     }
 }
 """;
    Map<String, dynamic> jsonData = json.decode(jsonString);
    return WeatherData.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 232, 248),
          title: const Text("Wetter App"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Text(
                  "Stadt: ${weatherData.city}",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Gefühlte Temperatur: ${weatherData.apparent_temperature}",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Temperatur: ${weatherData.temperature_2m}",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Niederschlag: ${weatherData.precipitation}",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Tageszeit: ${weatherData.time}",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Tageszeit: ${weatherData.is_day}",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Standort: ${weatherData.longitude} ${weatherData.latitude}",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                    onPressed: () {
                      weatherData = getWeatherData();
                      setState(() {});
                    },
                    child: const Text("Vorhersage updaten"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
