import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This example demonstrates how to configure a Google Map
/// with handlers for pointer events.
class HandleEventsSample extends StatefulWidget {
  const HandleEventsSample({super.key});

  @override
  State<HandleEventsSample> createState() => _HandleEventsSampleState();
}

class _HandleEventsSampleState extends State<HandleEventsSample> {
  String _response = '(Tap on map or a marker.)';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
          onTap: (position) => setState(() => _response = 'Tapped $position.'),
          markers: {
            Marker(
              markerId: MarkerId('my_marker'),
              position: LatLng(51.5099, -0.1180),
              onTap: () => setState(() => _response = 'Tapped marker.'),
            ),
          },
        ),
        Align(
          alignment: Alignment(0, 0.8),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(_response),
            ),
          ),
        )
      ],
    );
  }
}
