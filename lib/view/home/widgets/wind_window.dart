import 'package:flutter/material.dart';
import 'package:weather_app/model/domain/wind.dart';
import 'package:weather_app/view/home/widgets/custom_list_tile.dart';

class WindWindow extends StatelessWidget {
  final Wind? wind;

  const WindWindow({
    super.key,
    required this.wind,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            'Wind:',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 90,
          child: Container(
            width: 360,
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
              ),
            ),
            child: CustomScrollView(
              primary: false,
              scrollDirection: Axis.horizontal,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(10),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        ListStateTile(
                          title: 'Speed:',
                          value: wind?.speed,
                        ),
                        ListStateTile(
                          title: 'Degree:',
                          value: wind?.deg,
                        ),
                        ListStateTile(
                          title: 'Gust:',
                          value: wind?.gust,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
