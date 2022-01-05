import 'dart:convert';
import 'package:weather_app/models/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/screens/home.dart';

getuser() async {
  final queryParameters = {
    'q': city,
    'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
    'units': 'metric'
  };

  var response = await http.get(Uri.https(
      "api.openweathermap.org", '/data/2.5/weather', queryParameters));

  var jsData = jsonDecode(response.body);
  return WeatherData.fromJson(jsData);
}
