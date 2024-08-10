import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/config/constant/assets.dart';
import 'package:weather_app/view/Search/pages/search_page.dart';
import 'package:weather_app/view/common/widgets/weather_details_widget.dart';
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
    return currentWeather.when(
      data: (currentWeather) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                SizedBox(
                    height: 28, child: SvgPicture.asset(Assets.imagesLocation)),
                Text('${currentWeather.name}'),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SearchPage()));
                },
                icon: const Icon(
                  Icons.navigate_next_outlined,
                  size: 30,
                ),
                tooltip: 'Go to next page',
              )
            ],
          ),
          body: RefreshIndicator(
            strokeWidth: 4,
            color: Colors.black,
            onRefresh: () => ref.refresh(homeViewmodelProvider.future),
            child: SingleChildScrollView(
              child: WetherDetails(
                currentWeather: currentWeather,
              ),
            ),
          ),
        );
      },
      error: (er, st) {
        return Scaffold(
          body: Text('error: ${er.toString()}'),
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text('Wait... loading the weather data'),
              ],
            ),
          ),
        );
      },
    );
  }
}
