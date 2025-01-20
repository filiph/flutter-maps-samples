import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Shows how to add polylines to the map.
class PolylinesSample extends StatelessWidget {
  const PolylinesSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(49, -23)),
      polylines: {
        Polyline(
          // Polyline id must be unique.
          polylineId: PolylineId('titanic route'),
          points: [
            LatLng(50.90, -1.41), // Southampton
            LatLng(49.65, -1.60), // Cherbourg
            LatLng(49.77, -6.71),
            LatLng(51.83, -8.28), // Cobh
            LatLng(50.96, -8.58),
            LatLng(41.75, -49.90), // Wreck
          ],
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          jointType: JointType.round,
          width: 5,
          color: Colors.red,
          geodesic: true,
          consumeTapEvents: true,
          onTap: () => debugPrint('clicked route'),
        ),
      },
    );
  }
}
