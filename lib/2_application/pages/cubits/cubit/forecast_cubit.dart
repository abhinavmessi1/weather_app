import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/1_domain/entities/weather_report_entity.dart';
import 'package:weather_app/1_domain/use_cases/weather_use_cases.dart';
part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final WeatherUseCases weatherUseCases = WeatherUseCases();
  ForecastCubit() : super(ForecastInitial());

  void getWeatherReport({required double lat, required double long}) async {
    WeatherReportEntity entity =
        await weatherUseCases.getWeatherReport(lat: lat, long: long);
    debugPrint('${entity.humidity}  and ${entity.temperature}');
    emit(ForecastStateLoaded(weatherReportEntity: entity));
  }
}
