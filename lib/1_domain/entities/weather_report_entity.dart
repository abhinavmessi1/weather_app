class WeatherReportEntity {
  final String place;
  final double temperature;
  final int humidity;

  WeatherReportEntity(
      {required this.temperature, required this.humidity, required this.place});
}
