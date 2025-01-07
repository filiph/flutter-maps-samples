import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Nairobi, Kenya.
const nairobi = CameraPosition(
  target: LatLng(-1.2898, 36.7747),
  zoom: 13,
);

const nairobiLocation = LatLng(-1.2898, 36.7747);

/// Lower Manhattan in New York City, USA.
const newYork = CameraPosition(
  target: LatLng(40.7128, -74.0060),
  zoom: 12,
);

const newYorkLocation = LatLng(40.7128, -74.0060);

/// An overview of Earth centered on 0°,0°.
const origin = CameraPosition(
  target: LatLng(0, 0),
  zoom: 0,
);

/// Downtown San Francisco, USA.
const sanFrancisco = CameraPosition(
  target: LatLng(37.7749, -122.4194),
  zoom: 12,
);

/// Sydney, Australia (the birth place of Google Maps).
const sydney = CameraPosition(
  target: LatLng(-33.852, 151.211),
  zoom: 11,
);
