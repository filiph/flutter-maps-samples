import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This example demonstrates how to set the satellite, terrain,
/// or hybrid map type property.
class MapTypeSample extends StatelessWidget {
  const MapTypeSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),

      // Available map types:
      // .normal - Standard road map with streets, political boundaries, labels
      // .satellite - Satellite imagery without street labels or overlays
      // .terrain - Topographic data showing elevation, vegetation, and so on
      // .hybrid - Satellite imagery with road overlays and place labels
      mapType: MapType.satellite,
    );
  }
}
