import 'package:weather_app/0_data/models/weather_report_model.dart';

abstract class WeatherRepo {
  Future<WeatherReport> fetchWeatherReportFromRemoteSource(
      {required double lat, required double long});
}
