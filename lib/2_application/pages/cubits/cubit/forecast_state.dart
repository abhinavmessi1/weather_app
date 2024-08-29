part of 'forecast_cubit.dart';

@immutable
sealed class ForecastState {}

final class ForecastInitial extends ForecastState {}

final class ForecastStateLoaded extends ForecastState {
  final WeatherReportEntity weatherReportEntity;

  ForecastStateLoaded({required this.weatherReportEntity});
}
