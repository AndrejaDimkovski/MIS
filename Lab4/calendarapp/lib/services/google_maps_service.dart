import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleMapsService {
  final String apiKey = 'AIzaSyDEUe6QAsH05KJyEacEbjgrbS7-ohi7C14';

  Future<String> getDirections(LatLng origin, LatLng destination) async {
    final response = await http.get(
      Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['routes'][0]['legs'][0]['duration']['text'];
    } else {
      throw Exception('Failed to load directions');
    }
  }
}
