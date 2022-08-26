import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_weather/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e67d09e2c73821eb9ec37b8d7033d9d6&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    // ignore: avoid_print
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
