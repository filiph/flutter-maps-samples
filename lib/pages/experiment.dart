import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExperimentSample extends StatefulWidget {
  const ExperimentSample({super.key});

  @override
  State<ExperimentSample> createState() => _ExperimentSampleState();
}

class _ExperimentSampleState extends State<ExperimentSample> {
  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(-33.852, 151.211),
    zoom: 11.0,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialPosition,
    );
  }
}
