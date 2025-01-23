import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  final LatLng zooLocation = LatLng(42.00649, 21.41722);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zoo Location',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: zooLocation,
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('zooLocation'),
                  position: zooLocation,
                  infoWindow: InfoWindow(
                    title: 'Zoo Location',
                    snippet: 'Visit us here!',
                  ),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}