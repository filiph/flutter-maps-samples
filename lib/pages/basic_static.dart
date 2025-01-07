import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Shows the most basic usage of the [GoogleMap] widget.
class BasicStaticSample extends StatelessWidget {
  const BasicStaticSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      // The only required argument is the initial position.
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
    );
  }
}
