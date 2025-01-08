import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Shows how you can use cloud map ID (with associated custom map styles).
class MapIdSample extends StatelessWidget {
  const MapIdSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
      // Generate your own map ID at https://goo.gle/get-map-id.
      cloudMapId: '78434bee6dc2e9b1',
    );
  }
}
