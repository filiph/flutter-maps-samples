import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Shows how to add polygons to the map.
class PolygonsSample extends StatelessWidget {
  const PolygonsSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(25, -72)),
      polygons: {
        Polygon(
          // Polygon id must be unique.
          polygonId: PolygonId('bermuda'),
          points: [
            LatLng(25.28, -80.33),
            LatLng(32.29, -64.79),
            LatLng(18.51, -65.36),
            LatLng(25.28, -80.33), // Same as first point to close polygon.
          ],
          fillColor: Colors.yellow,
          consumeTapEvents: true,
          onTap: () => debugPrint('tapped on the Bermuda Triangle'),
        ),
      },
    );
  }
}
