import 'dart:convert';

import 'package:http/http.dart';
import 'package:wetter_app_asynchron/weather_data.dart';

class WeatherDataRepository {
  final weatherUri =
      "https://api.open-meteo.com/v1/forecast?latitude=48.783333&longitude=9.183333&current=temperature_2m,apparent_temperature,is_day,precipitation&timezone=Europe%2FBerlin&forecast_days=1";

  Future<String> getDataFromApi() async {
    final Response response = await get(Uri.parse(weatherUri));
    final String jsonString = response.body;

    return jsonString;
  }

  Future<WeatherData> getWeatherData() async {
    final String jsonString = await getDataFromApi();
    Map<String, dynamic> jsonData = json.decode(jsonString);
    return WeatherData.fromJson(jsonData);
  }
}
