import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/2_application/core/services/theme_service.dart';
import 'package:weather_app/2_application/pages/cubits/cubit/forecast_cubit.dart';
import 'package:weather_app/2_application/widgets/common_textfield.dart';
import 'package:weather_app/theme.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather Report",
          style: theme.textTheme.displayLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeServcie>(context).toggleTheme,
              onChanged: (_) {
                Provider.of<ThemeServcie>(context, listen: false).switchTheme();
              })
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [Colors.green, Colors.blue],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            weatherImage(),
            titleName(),
            inputWidget(context),
            forecastWidget()
          ],
        ),
      ),
    );
  }

  Widget titleName() {
    return BlocBuilder<ForecastCubit, ForecastState>(
      builder: (context, state) {
        if (state is ForecastStateLoaded) {
          return Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.amber.withOpacity(0.0)),
            child: Text(
              state.weatherReportEntity.place,
              style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget weatherImage() {
    return Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/weather_image/weather_pp.png"),
          fit: BoxFit.fill,
        )));
    ;
  }

  Widget forecastWidget() {
    return BlocBuilder<ForecastCubit, ForecastState>(
      builder: (context, state) {
        if (state is ForecastInitial) {
          return const SizedBox.shrink();
        } else if (state is ForecastStateLoaded) {
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber.withOpacity(0.0)),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${state.weatherReportEntity.humidity}",
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          "${state.weatherReportEntity.temperature}",
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ));
        }
        return const SizedBox();
      },
    );
  }

  TextButton submitButton(BuildContext context) {
    return TextButton(
      onPressed: () => {
        BlocProvider.of<ForecastCubit>(context).getWeatherReport(
            lat: double.parse(_latController.text),
            long: double.parse(_longController.text)),
      },
      child: const Text("Fetch Report"),
    );
  }

  Container inputWidget(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CommonTextfield(controller: _latController, label: "latitude"),
          const SizedBox(
            height: 30,
          ),
          CommonTextfield(controller: _longController, label: "longitude"),
          const SizedBox(
            height: 20,
          ),
          submitButton(context)
        ],
      ),
    );
  }
}
