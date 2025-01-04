import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/event.dart';
import '../services/nofitication_service.dart';

class MapScreen extends StatefulWidget {
  final List<Event> events;

  MapScreen({Key? key, required this.events}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Set<Marker> _markers = {};
  LatLng? _userLocation;
  final double _notificationRadius = 100000;

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _getCurrentLocation();
  }

  void _addMarkers() {
    Set<Marker> markers = {};
    widget.events.forEach((event) {
      markers.add(
        Marker(
          markerId: MarkerId(event.location),
          position: LatLng(
            event.latitude ?? 0.0,
            event.longitude ?? 0.0,
          ),
          infoWindow: InfoWindow(
            title: event.location,
            snippet: '${event.time} - ${event.subject}',
          ),
        ),
      );
    });

    setState(() {
      _markers = markers;
    });
  }


  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });


    _checkNearbyEvents();
  }


  void _checkNearbyEvents() {
    if (_userLocation == null) return;

    widget.events.forEach((event) {
      double distanceInMeters = Geolocator.distanceBetween(
        _userLocation!.latitude,
        _userLocation!.longitude,
        event.latitude ?? 0.0,
        event.longitude ?? 0.0,
      );

      if (distanceInMeters <= _notificationRadius) {

        NotificationService.showNotification(
          'Event Nearby',
          'You are near the event: ${event.subject} at ${event.location}.',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Locations Map'),
      ),
      body: _userLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _userLocation ?? LatLng(42.1333, 21.7167),
          zoom: 12.0,
        ),
        markers: _markers,
      ),
    );
  }
}
