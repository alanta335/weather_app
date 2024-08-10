import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/viewmodel/search/search_viewmodel.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(suggestionsProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
                          .read(suggestionsProvider.notifier)
                          .updateSuggestions(location: null);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
