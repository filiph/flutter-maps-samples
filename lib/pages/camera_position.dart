import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Shows how to obtain and use [GoogleMapController].
class SetCameraPositionSample extends StatefulWidget {
  const SetCameraPositionSample({super.key});

  @override
  State<SetCameraPositionSample> createState() =>
      _SetCameraPositionSampleState();
}

class _SetCameraPositionSampleState extends State<SetCameraPositionSample> {
  /// An instance of map controller obtained through [_onMapCreated].
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
          // The onMapCreated callback is called after map initialization
          // with the map controller instance.
          onMapCreated: _onMapCreated,
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

  /// This callback merely populates [_controller]
  /// but it could also use the controller to further set up the map
  /// or start an animation.
  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _onPressed() {
    final newYork = CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 12);
    final update = CameraUpdate.newCameraPosition(newYork);
    _controller?.moveCamera(update);
  }
}
