import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceMap extends StatefulWidget {
  const PlaceMap({super.key});

  @override
  State<PlaceMap> createState() => _PlaceMapState();
}

class _PlaceMapState extends State<PlaceMap> {
  // ignore: unused_field
  GoogleMapController? _mapController;
  final List<Marker> _markers = [];
  final List<Map<String, dynamic>> _picnicSpots = [
    {
      "id": "1",
      "name": "Sunny Park",
      "lat": 37.7749,
      "lng": -122.4194,
      "rating": 4.5,
      "parking": true,
      "restrooms": true,
      "openingHours": "8:00 AM - 6:00 PM",
      "imageUrl": "https://via.placeholder.com/150",
    },
    {
      "id": "2",
      "name": "River View",
      "lat": 37.7849,
      "lng": -122.4094,
      "rating": 4.8,
      "parking": false,
      "restrooms": true,
      "openingHours": "7:00 AM - 7:00 PM",
      "imageUrl": "https://via.placeholder.com/150",
    },
  ];
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredSpots = [];

  @override
  void initState() {
    super.initState();
    _filteredSpots = _picnicSpots;
    _loadPicnicSpots();
  }

  void _loadPicnicSpots() {
    _markers.clear();
    for (var spot in _filteredSpots) {
      _markers.add(
        Marker(
          markerId: MarkerId(spot['id'] as String),
          position: LatLng(spot['lat'] as double, spot['lng'] as double),
          infoWindow: InfoWindow(
            title: spot['name'] as String,
            snippet: 'Rating: ${spot['rating']} ★',
            onTap: () => _showSpotDetails(spot),
          ),
        ),
      );
    }
    setState(() {});
  }

  void _showSpotDetails(Map<String, dynamic> spot) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(spot['name'] as String,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Image.network(spot['imageUrl'] as String,
                height: 150, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Text('Rating: ${spot['rating']} ★'),
            Text('Parking: ${spot['parking'] ? "Available" : "Not Available"}'),
            Text(
                'Restrooms: ${spot['restrooms'] ? "Available" : "Not Available"}'),
            Text('Opening Hours: ${spot['openingHours']}'),
          ],
        ),
      ),
    );
  }

  void _filterSpots(String query) {
    if (query.isEmpty) {
      _filteredSpots = _picnicSpots;
    } else {
      _filteredSpots = _picnicSpots
          .where((spot) => (spot['name'] as String)
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    _loadPicnicSpots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a picnic spot...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              onChanged: _filterSpots,
            ),
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Centered on a sample location
          zoom: 12,
        ),
        markers: Set.from(_markers),
        onMapCreated: (controller) => _mapController = controller,
      ),
    );
  }
}
