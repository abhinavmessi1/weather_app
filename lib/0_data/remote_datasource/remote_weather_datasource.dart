import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/0_data/models/weather_report_model.dart';

const String baseUrl = 'http://api.weatherapi.com/v1/forecast.json';

abstract class RemoteWeatherDataSource {
  Future<WeatherReport> getWeatherReport(
      {required double lat, required double long});
}

class RemoteWeatherDataSourceImpl implements RemoteWeatherDataSource {
  @override
  Future<WeatherReport> getWeatherReport(
      {required double lat, required double long}) async {
    final responseBody;
    http.Response response = await http.get(
        Uri.parse('$baseUrl?key=a4d9e60d658347a496d134430241808&q=$lat,$long'));

    responseBody = jsonDecode(response.body);
    return WeatherReport.fromJson(responseBody);
  }
}
