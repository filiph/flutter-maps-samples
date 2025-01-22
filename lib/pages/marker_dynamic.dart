import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Adds a new marker to the map once the user taps a button.
class DynamicMarkerSample extends StatefulWidget {
  const DynamicMarkerSample({super.key});

  @override
  State<DynamicMarkerSample> createState() => _DynamicMarkerSampleState();
}

class _DynamicMarkerSampleState extends State<DynamicMarkerSample> {
  /// The dynamic set of markers to be shown on the map.
  /// Marker IDs need to be unique.
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('chinatown gate'),
      position: LatLng(37.7908, -122.4058),
    ),
    Marker(
      markerId: MarkerId('coit tower'),
      position: LatLng(37.8024, -122.4058),
    ),
    Marker(
      markerId: MarkerId('ferry building'),
      position: LatLng(37.7955, -122.3937),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(37.7749, -122.4194), zoom: 12.5),
          // Simply pass the set of current markers as an argument.
          markers: _markers,
        ),
        Align(
          alignment: Alignment(0, 0.8),
          child: FilledButton(
            onPressed: _onPressed,
            child: Text('Add Fisherman’s Wharf'),
          ),
        )
      ],
    );
  }

  void _onPressed() {
    const fishermansWharf = Marker(
      markerId: MarkerId('fishermansWharf'),
      position: LatLng(37.8080, -122.4177),
    );

    // Add the marker with setState.
    setState(() => _markers.add(fishermansWharf));
  }
}
