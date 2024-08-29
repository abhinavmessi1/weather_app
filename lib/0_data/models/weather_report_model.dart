class WeatherReport {
  final String place;
  final double tempC;
  final int humidity;

  WeatherReport(
      {required this.place, required this.tempC, required this.humidity});
  factory WeatherReport.fromJson(Map<String, dynamic> json) => WeatherReport(
      place: json['location']['name'],
      tempC: json['current']['temp_c'],
      humidity: json['current']['humidity']);
}
//https://fakestoreapi.com/