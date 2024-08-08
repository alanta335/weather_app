import 'package:flutter/material.dart';

class ListStateTile extends StatelessWidget {
  final String? title;
  final num? value;

  const ListStateTile({
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
