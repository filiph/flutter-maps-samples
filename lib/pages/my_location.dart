import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Demonstrates how to show the My Location layer.
class MyLocationSample extends StatelessWidget {
  const MyLocationSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(37.78, -122.42)),

      // Enables the My Location layer.
      //
      // You MUST have the appropriate location permission enabled
      // in order for this to work.
      // See documentation of [GoogleMap.myLocationEnabled] for details.
      myLocationEnabled: true,

      // You can choose whether to show the button that let's the user
      // transport the camera to their current location.
      // This has no effect when `myLocationEnabled` is false.
      myLocationButtonEnabled: true,
    );
  }
}
