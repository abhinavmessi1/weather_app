import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/2_application/core/services/theme_service.dart';
import 'package:weather_app/2_application/pages/cubits/cubit/forecast_cubit.dart';
import 'package:weather_app/2_application/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theme.dart';

class BasicApp extends StatelessWidget {
  const BasicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServcie>(
      builder: (context, theme, child) => MaterialApp(
        home: BlocProvider(
          create: (context) => ForecastCubit(),
          child: HomePage(),
        ),
        themeMode: theme.toggleTheme ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
