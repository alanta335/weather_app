import 'package:flutter/material.dart';
import 'package:weather_app/view/home/widgets/weather_svg.dart';

class WeatherWindow extends StatelessWidget {
  final String? icon;
  final String? description;

  const WeatherWindow({
    super.key,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(100),
          border: Border.all(width: 2, color: Colors.black)),
      height: 180,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WeatherSVG(
            iconName: icon,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(description ?? 'Not available'),
        ],
      ),
    );
  }
}
