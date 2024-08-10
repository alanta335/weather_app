import 'package:flutter/material.dart';
import 'package:weather_app/model/domain/main.dart';
import 'package:weather_app/view/home/widgets/custom_grid_tile.dart';

class TemperatureWindow extends StatelessWidget {
  final Main? main;

  const TemperatureWindow({
    super.key,
    required this.main,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            'Temperature:',
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: <Widget>[
                GridStateTile(
                  title: 'Current Temperature',
                  value: main?.temp,
                ),
                GridStateTile(
                  title: 'Min Temp',
                  value: main?.tempMin,
                ),
                GridStateTile(
                  title: 'Max Temp',
                  value: main?.tempMax,
                ),
                GridStateTile(
                  title: 'Feels Like',
                  value: main?.feelsLike,
                ),
                GridStateTile(
                  title: 'Humidity',
                  value: main?.humidity,
                ),
                GridStateTile(
                  title: 'Pressure',
                  value: main?.pressure,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
