import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        backgroundColor: Colors.transparent,
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
                Container(
                  height: 220,
                  width: 430,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/cloudy.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: SizedBox(
                    height: 500,
                    child: Expanded(
                      child: StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        children: [
                          StaggeredGridTile.count(
                            crossAxisCellCount: 4,
                            mainAxisCellCount: 1,
                            child: Container(
                              height: 100,
                              width: 100,
                              color: const Color.fromARGB(255, 5, 80, 142),
                              child: const Center(
                                child: Text(
                                  "Stuttgart",
                                  style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: Container(
                              height: 100,
                              width: 100,
                              color: const Color.fromARGB(255, 53, 135, 203),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Temperatur",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 192, 213, 232),
                                      ),
                                    ),
                                    Text(
                                      "${weatherData.temperature_2m}°C",
                                      style: const TextStyle(
                                        fontSize: 46,
                                        fontWeight: FontWeight.bold,
                                        height: 1.6,
                                        color:
                                            Color.fromARGB(255, 228, 234, 241),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: Container(
                              height: 100,
                              width: 100,
                              color: const Color.fromARGB(255, 113, 173, 222),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      textAlign: TextAlign.center,
                                      "Gefühlte Temperatur",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2,
                                        color:
                                            Color.fromARGB(255, 32, 113, 180),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${weatherData.apparent_temperature}°C",
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 8, 73, 142),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: Container(
                              height: 100,
                              width: 100,
                              color: const Color.fromARGB(255, 40, 177, 182),
                              child: Center(
                                child: Text(
                                  "${weatherData.is_day}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 0.5,
                            child: Container(
                              height: 100,
                              width: 100,
                              color: const Color.fromARGB(255, 247, 187, 172),
                              child: Center(
                                child: Text(
                                  "Lat: ${weatherData.latitude} ",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 157, 67, 22),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 0.5,
                            child: Container(
                              height: 100,
                              width: 100,
                              color: const Color.fromARGB(255, 225, 144, 124),
                              child: Center(
                                child: Text(
                                  "Long: ${weatherData.longitude}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 157, 67, 22),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 4,
                            mainAxisCellCount: 1,
                            child: Container(
                              height: 100,
                              width: 100,
                              color: const Color.fromARGB(255, 17, 174, 195),
                              child: Center(
                                child: Text(
                                  "Niederschlag: ${weatherData.precipitation}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 4,
                            mainAxisCellCount: 0.5,
                            child: Container(
                              height: 100,
                              width: 100,
                              color: const Color.fromARGB(255, 7, 61, 106),
                              child: Center(
                                child: Text(
                                  "Uhrzeit: ${weatherData.time}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                    onPressed: () {
                      weatherData = updateWeatherData() as WeatherData;
                      setState(() {});
                    },
                    child: const Text("Wetter updaten"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
