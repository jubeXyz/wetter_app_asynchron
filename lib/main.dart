import 'package:flutter/material.dart';
import 'package:wetter_app_asynchron/weather_data.dart';
import 'package:wetter_app_asynchron/weather_repository.dart';

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
    initWeatherData();
  }

  void initWeatherData() async {
    WeatherData incomingData = await WeatherDataRepository().getWeatherData();
    setState(() {
      weatherData = incomingData;
    });
  }

  void updateWeatherData() async {
    WeatherData updatedData = await WeatherDataRepository().getWeatherData();
    setState(() {
      weatherData = updatedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Wetter App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Stuttgart",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
                      weatherData = updateWeatherData() as WeatherData;
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
