import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/view/common/widgets/weather_details_widget.dart';
import 'package:weather_app/viewmodel/search/search_viewmodel.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(suggestionsProvider);
    final weather = ref.watch(searchViewmodelProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1200,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // TextField for user input
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Search Locations',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (String value) async {
                    await ref
                        .read(suggestionsProvider.notifier)
                        .updateSuggestions(location: value);
                  },
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      final suggestion = suggestions[index];
                      return ListTile(
                        title: Text(suggestion.name.toString()),
                        onTap: () {
                          ref
                              .read(locationSearchTextProvider.notifier)
                              .update(suggestion);
                          ref
                              .read(searchViewmodelProvider.notifier)
                              .fetchLocationWeather(
                                  lat: suggestion.lat.toString(),
                                  lon: suggestion.lon.toString());
                          ref
                              .read(suggestionsProvider.notifier)
                              .updateSuggestions(location: null);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                weather.when(
                  data: (_) {
                    return _ != null
                        ? WetherDetails(currentWeather: _)
                        : const SizedBox();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
