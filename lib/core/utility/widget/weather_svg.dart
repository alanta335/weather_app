import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/config/constant/assets.dart';

class WeatherSVG extends StatelessWidget {
  final String? iconName;

  const WeatherSVG({
    super.key,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    // Using a switch expression to determine the correct icon path
    final String iconPath = switch (iconName) {
      '02d' => Assets.images02d,
      '04d' => Assets.images04d,
      '09d' => Assets.images09d,
      '11d' => Assets.images11d,
      '13d' => Assets.images13d,
      '50d' => Assets.images50d,
      _ => Assets.imagesUnknown, // Default case for unknown icons
    };
    return SvgPicture.asset(iconPath);
  }
}
