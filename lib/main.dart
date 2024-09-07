// https://api.openweathermap.org/data/3.0/onecall

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/2_application/basic_app.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/2_application/core/services/theme_service.dart';

const platform = MethodChannel('samples.flutter.dev/battery');
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeServcie(),
    child: const BasicApp(),
  ));
}
