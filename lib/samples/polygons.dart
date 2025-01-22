import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Displays a map of the Atlantic Ocean with the shape of the famous
/// Bermuda Triangle drawn over it.
class PolygonsSample extends StatelessWidget {
  const PolygonsSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(25, -72)),
      polygons: {
        Polygon(
          // Polygon id must be unique.
          polygonId: PolygonId('bermuda triangle'),
          points: [
            LatLng(25.28, -80.33),
            LatLng(32.29, -64.79),
            LatLng(18.51, -65.36),
            LatLng(25.28, -80.33), // Same as first point to close polygon.
          ],
          strokeColor: Colors.red,
          fillColor: Colors.yellow,
          consumeTapEvents: true,
          onTap: () => debugPrint('tapped on the Bermuda Triangle'),
        ),
      },
    );
  }
}
