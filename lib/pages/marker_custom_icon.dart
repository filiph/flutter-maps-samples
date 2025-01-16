import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Shows advanced options of markers.
class MarkerCustomIconSample extends StatefulWidget {
  const MarkerCustomIconSample({super.key});

  @override
  State<MarkerCustomIconSample> createState() => _MarkerCustomIconSampleState();
}

class _MarkerCustomIconSampleState extends State<MarkerCustomIconSample> {
  late Marker _marker = Marker(
    markerId: MarkerId('my_marker'),
    // Start with the default Google Maps pin, except yellow.
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    onTap: _changeIcon,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
      markers: {_marker},
    );
  }

  void _changeIcon() async {
    // Set up the image configuration for the new icon, including its size.
    final imageConfiguration =
        createLocalImageConfiguration(context, size: Size(42, 52));

    // Load the icon image from an asset.
    // Alternatively, you can create the icon with BitmapDescriptor.bytes(),
    // which allows things such as using a CustomPainter.
    final assetIcon = await BitmapDescriptor.asset(
      imageConfiguration,
      'assets/icon_flutter.png',
    );

    setState(() {
      // Modify the existing marker with the new icon and set its anchor
      // to center.
      _marker = _marker.copyWith(
        iconParam: assetIcon,
        anchorParam: const Offset(0.5, 0.5),
      );
    });
  }
}
