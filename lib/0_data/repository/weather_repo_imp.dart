import 'package:weather_app/0_data/models/weather_report_model.dart';
import 'package:weather_app/0_data/remote_datasource/remote_weather_datasource.dart';
import 'package:weather_app/1_domain/repository/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  @override
  Future<WeatherReport> fetchWeatherReportFromRemoteSource(
      {required double lat, required double long}) async {
    RemoteWeatherDataSource remoteWeatherDataSource =
        RemoteWeatherDataSourceImpl();
    WeatherReport result =
        await remoteWeatherDataSource.getWeatherReport(lat: lat, long: long);

    return result;
  }
}
