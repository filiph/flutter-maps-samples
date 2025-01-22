import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Shows how to obtain and use [GoogleMapController].
class AnimateCameraSample extends StatefulWidget {
  const AnimateCameraSample({super.key});

  @override
  State<AnimateCameraSample> createState() => _AnimateCameraSampleState();
}

class _AnimateCameraSampleState extends State<AnimateCameraSample> {
  /// An instance of map controller obtained through `onMapCreated`.
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
          onMapCreated: (controller) => _controller = controller,
        ),
        Align(
          alignment: Alignment(0, 0.8),
          child: FilledButton(
            onPressed: _onPressed,
            child: Text('Fly to New York'),
          ),
        )
      ],
    );
  }

  /// Called when the button is pressed.
  void _onPressed() {
    final newYork = CameraPosition(
        target: LatLng(40.7128, -74.0060), bearing: 270, tilt: 30, zoom: 18);
    final update = CameraUpdate.newCameraPosition(newYork);
    _controller?.animateCamera(update);
  }
}
