class WeatherData {
  final String city;
  final double latitude;
  final double longitude;
  final String time;
  final double temperature_2m;
  final double apparent_temperature;
  final int is_day;
  final double precipitation;

  WeatherData({
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.time,
    required this.temperature_2m,
    required this.apparent_temperature,
    required this.is_day,
    required this.precipitation,
  });

  WeatherData.fromJson(Map<String, dynamic> json)
      : city = json["city"] ?? 0.0,
        latitude = json["latitude"] ?? 0.0,
        longitude = json["longitude"] ?? 0.0,
        time = json["current"]["time"] ?? 0.0,
        temperature_2m = json["current"]["temperature_2m"] ?? 0.0,
        apparent_temperature = json["current"]["apparent_temperature"] ?? 0.0,
        is_day = json["current"]["is_day"] ?? 0.0,
        precipitation = json["current"]["precipitation"] ?? 0.0;
}