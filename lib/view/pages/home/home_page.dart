import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/viewmodel/location/location_viewmodel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = ref.watch(locationViewmodelProvider);
    return Scaffold(
      body: Center(
          child: currentLocation.when(data: (position) {
        return Text(position.value.toString());
      }, error: (er, st) {
        return Text("error gettting location $er stack $st");
      }, loading: () {
        return const CircularProgressIndicator();
      })),
    );
  }
}
