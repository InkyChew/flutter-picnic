import 'dart:async';

import 'package:flutter/material.dart';
import 'package:picnic/place/models/google_place.dart';
// import 'package:picnic/place/services/place_service.dart';

class PlaceSearch extends StatefulWidget {
  const PlaceSearch({super.key});

  @override
  State<PlaceSearch> createState() => _PlaceSearchState();
}

class _PlaceSearchState extends State<PlaceSearch> {
  List<Place> _places = [];

  Timer? _debounce;
  void _onSearchChanged(String query) {
    if (query.isNotEmpty) {
      if (_debounce?.isActive ?? false) _debounce?.cancel();

      _debounce = Timer(const Duration(milliseconds: 1000), () async {
        print(query);
        // final places = await searchPlaces(query);
        final places = [
          Place(
              id: "1",
              formattedAddress: '台中市西屯區秋紅谷',
              location: Location(latitude: 22, longitude: 33),
              displayName: '秋紅谷'),
          Place(
              id: "2",
              formattedAddress: '台中市西屯區中央公園',
              location: Location(latitude: 22, longitude: 33),
              displayName: '中央公園')
        ];

        // Update the state
        setState(() {
          _places = places;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for a picnic spot...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _places.length,
        itemBuilder: (context, index) {
          final place = _places[index];
          return ListTile(
            leading: const Icon(Icons.place),
            title: Text(place.displayName),
            subtitle: Text(place.formattedAddress),
            onTap: () {
              // Handle tap event (e.g., navigate to detail screen)
            },
          );
        },
      ),
    );
  }
}
