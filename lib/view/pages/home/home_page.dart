import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/utility/widget/weather_svg.dart';
import 'package:weather_app/viewmodel/home/home_viewmodel.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentWeather = ref.watch(homeViewmodelProvider);
    return currentWeather.when(data: (currentWeather) {
      return Scaffold(
        appBar: AppBar(
          title: Text('${currentWeather.name}'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${currentWeather.weather?.first.icon}'),
            SizedBox(
              height: 150,
              child: WeatherSVG(
                iconName: currentWeather.weather?.first.icon,
              ),
            ),
          ],
        ),
      );
    }, error: (er, st) {
      return Scaffold(
        body: Text('error: ${er.toString()}'),
      );
    }, loading: () {
      return const Scaffold(body: CircularProgressIndicator());
    });
  }
}
