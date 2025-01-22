import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// User's location is shown as a blue dot and the My Location button
/// is displayed in the bottom right corner of the map. When the user taps
/// the button, the map pans to the user's current location.
class MyLocationSample extends StatelessWidget {
  const MyLocationSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(37.78, -122.42)),

      // Enables the My Location layer.
      //
      // This feature is not available on all platforms and you MUST have
      // the appropriate location permission enabled in order for this to work.
      // See documentation of [GoogleMap.myLocationEnabled] for details.
      myLocationEnabled: true,

      // You can choose whether to show the button that lets the user
      // transport the camera to their current location.
      // This has no effect when `myLocationEnabled` is false.
      myLocationButtonEnabled: true,
    );
  }
}
