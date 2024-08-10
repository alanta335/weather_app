import 'package:flutter/material.dart';
import 'package:weather_app/model/domain/current_weather_model.dart';
import 'package:weather_app/view/home/widgets/custom_card.dart';
import 'package:weather_app/view/home/widgets/temperature_window.dart';
import 'package:weather_app/view/home/widgets/weather_window.dart';
import 'package:weather_app/view/home/widgets/wind_window.dart';

class WetherDetails extends StatelessWidget {
  final CurrentWeatherModel currentWeather;

  const WetherDetails({
    super.key,
    required this.currentWeather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('${currentWeather.weather?.first.icon}'),
        WeatherWindow(
          description: currentWeather.weather?.first.description,
          icon: currentWeather.weather?.first.icon,
        ),
        const SizedBox(
          height: 5,
        ),
        TemperatureWindow(
          main: currentWeather.main,
        ),
        const SizedBox(
          height: 15,
        ),
        WindWindow(
          wind: currentWeather.wind,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonCardWidget(
              value: currentWeather.clouds?.all,
              title: 'Cloudiness',
              metric: '%',
            ),
            CommonCardWidget(
              value: currentWeather.visibility,
              title: 'Visibility',
              metric: ' meter',
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
