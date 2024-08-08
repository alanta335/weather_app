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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${currentWeather.weather?.first.icon}'),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(100),
                    border: Border.all(width: 2, color: Colors.black)),
                height: 180,
                width: 120,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: WeatherSVG(
                        iconName: currentWeather.weather?.first.icon,
                      ),
                    ),
                    Text('${currentWeather.weather?.first.description}'),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 400,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(35),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: <Widget>[
                    TempStateWidget(
                      title: 'Temperature',
                      value: currentWeather.main?.temp,
                    ),
                    TempStateWidget(
                      title: 'Min Temp',
                      value: currentWeather.main?.tempMin,
                    ),
                    TempStateWidget(
                      title: 'Max Temp',
                      value: currentWeather.main?.tempMax,
                    ),
                    TempStateWidget(
                      title: 'Feels Like',
                      value: currentWeather.main?.feelsLike,
                    ),
                    TempStateWidget(
                      title: 'Humidity',
                      value: currentWeather.main?.humidity,
                    ),
                    TempStateWidget(
                      title: 'Pressure',
                      value: currentWeather.main?.pressure,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: CustomScrollView(
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(30),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          <Widget>[
                            WindStateWidget(
                              title: 'Speed',
                              value: currentWeather.wind?.speed,
                            ),
                            WindStateWidget(
                              title: 'Degree',
                              value: currentWeather.wind?.deg,
                            ),
                            WindStateWidget(
                              title: 'Gust',
                              value: currentWeather.wind?.gust,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardWidget(
                    value: currentWeather.clouds?.all,
                    title: 'Cloudiness',
                    metric: '%',
                  ),
                  CardWidget(
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
          ),
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

class CardWidget extends StatelessWidget {
  final String? title;
  final num? value;
  final String? metric;

  const CardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.metric,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Text('$title ${value ?? "not available"}$metric'),
      ),
    );
  }
}

class TempStateWidget extends StatelessWidget {
  final String? title;
  final num? value;

  const TempStateWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(30),
          border: Border.all(width: 2, color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? "not available",
              textAlign: TextAlign.center,
            ),
            Text(
              '${value ?? "not available"}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class WindStateWidget extends StatelessWidget {
  final String? title;
  final num? value;

  const WindStateWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 190,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(30),
            border: Border.all(width: 2, color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title ?? " not available ",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${value ?? " not available "}',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
