import 'package:weather_app/0_data/repository/weather_repo_imp.dart';
import 'package:weather_app/1_domain/entities/weather_report_entity.dart';
import 'package:weather_app/1_domain/repository/weather_repo.dart';

class WeatherUseCases {
  final WeatherRepo weatherRepo = WeatherRepoImpl();

  Future<WeatherReportEntity> getWeatherReport(
      {required double lat, required double long}) async {
    final rawData = await weatherRepo.fetchWeatherReportFromRemoteSource(
        lat: lat, long: long);

    final WeatherReportEntity weatherReportEntity = WeatherReportEntity(
        temperature: rawData.tempC,
        humidity: rawData.humidity,
        place: rawData.place);

    return weatherReportEntity;
  }
}
