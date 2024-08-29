//https://api.openweathermap.org/data/3.0/onecall
//https://github.com/OpenSphereSoftware/FlutterMadeEasy_ZeroToMastery/tree/5.5_named_routes

import 'package:flutter/cupertino.dart';
import 'package:weather_app/2_application/basic_app.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/2_application/core/services/theme_service.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeServcie(),
    child: const BasicApp(),
  ));
}
