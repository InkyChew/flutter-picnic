import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:picnic/place/models/google_place.dart';

class PlaceService {
  static final _apiKey = dotenv.env['PLACE_API_KEY'];

  void _checkApiKey() {
    if (_apiKey == null || _apiKey!.isEmpty) {
      throw Exception("API key is null or empty.");
    }
  }

  Future<List<Place>> searchPlaces(String query) async {
    _checkApiKey();

    final url = Uri.parse('https://places.googleapis.com/v1/places:searchText');
    final body = jsonEncode({
      'textQuery': "台中",
      "includedType": "park"
      // 'textQuery': "台中野餐",
    });
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'X-Goog-Api-Key': _apiKey!,
      'X-Goog-FieldMask':
          'places.id,places.displayName,places.formattedAddress,places.googleMapsLinks,places.location',
    };

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = jsonDecode(response.body);
      final List<dynamic> placesJson = res['places'] ?? [];
      return placesJson.map((json) => Place.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch places: ${response.statusCode}');
    }
  }
}
