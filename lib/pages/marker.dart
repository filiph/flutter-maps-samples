import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Shows how to add a marker to the map.
class MarkerSample extends StatelessWidget {
  const MarkerSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
      // Use this parameter to place markers on the map.
      markers: {
        Marker(
          // The id needs to be locally unique.
          markerId: MarkerId('my_nairobi_marker'),
          position: LatLng(-1.2898, 36.7747),
          infoWindow: InfoWindow(title: 'Nairobi', snippet: 'More info.'),
          onTap: () => debugPrint('tapped'),
        ),
      },
    );
  }
}
