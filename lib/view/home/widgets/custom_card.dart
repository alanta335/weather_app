import 'package:flutter/material.dart';

class CommonCardWidget extends StatelessWidget {
  final String? title;
  final num? value;
  final String? metric;

  const CommonCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.metric,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Text('$title ${value ?? "not available"}$metric'),
      ),
    );
  }
}
