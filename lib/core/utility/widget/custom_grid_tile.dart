import 'package:flutter/material.dart';

class GridStateTile extends StatelessWidget {
  final String? title;
  final num? value;

  const GridStateTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(30),
          border: Border.all(width: 2, color: Colors.black54)),
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
