import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/utility/widget/custom_card.dart';
import 'package:weather_app/core/utility/widget/custom_grid_tile.dart';
import 'package:weather_app/core/utility/widget/custom_list_tile.dart';
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Temperature :',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    width: 360,
                    decoration: BoxDecoration(border: Border.all(width: 4)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(8),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2,
                        children: <Widget>[
                          GridStateTile(
                            title: 'Current Temperature',
                            value: currentWeather.main?.temp,
                          ),
                          GridStateTile(
                            title: 'Min Temp',
                            value: currentWeather.main?.tempMin,
                          ),
                          GridStateTile(
                            title: 'Max Temp',
                            value: currentWeather.main?.tempMax,
                          ),
                          GridStateTile(
                            title: 'Feels Like',
                            value: currentWeather.main?.feelsLike,
                          ),
                          GridStateTile(
                            title: 'Humidity',
                            value: currentWeather.main?.humidity,
                          ),
                          GridStateTile(
                            title: 'Pressure',
                            value: currentWeather.main?.pressure,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                            ListStateTile(
                              title: 'Speed',
                              value: currentWeather.wind?.speed,
                            ),
                            ListStateTile(
                              title: 'Degree',
                              value: currentWeather.wind?.deg,
                            ),
                            ListStateTile(
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
