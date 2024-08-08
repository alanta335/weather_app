import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/viewmodel/location/location_viewmodel.dart';
import 'package:weather_app/viewmodel/weather/weather_viewmodel.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentLocation = ref.watch(locationViewmodelProvider);

    return Scaffold(
      body: currentLocation.when(
        data: (position) {
          final lat = position.value!.latitude.toString();
          final lon = position.value!.longitude.toString();

          // Fetch weather data based on the location
          final currentWeather = ref
              .watch(weatherViewmodelProvider.notifier)
              .currentWeather(lat: lat, lon: lon);

          return currentWeather.when(
            data: (weather) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Latitude: $lat'),
                    const SizedBox(width: 10),
                    Text('Longitude: $lon'),
                  ],
                ),
                Text(weather.name.toString()),
              ],
            ),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) =>
                Text('Error fetching weather: $error'),
          );
        },
        error: (error, stackTrace) => Text('Error fetching location: $error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
