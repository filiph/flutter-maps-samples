import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This example shows how to initialize a map with a mapID to apply
/// Cloud-based maps styling to the map.
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
