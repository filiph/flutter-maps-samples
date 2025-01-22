import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Demonstrates how to dynamically change the clustering of markers at runtime.
class DynamicClustersSample extends StatefulWidget {
  const DynamicClustersSample({super.key});

  @override
  State<DynamicClustersSample> createState() => _DynamicClustersSampleState();
}

class _DynamicClustersSampleState extends State<DynamicClustersSample> {
  Set<ClusterManager> _clusters = {};

  Set<Marker> _markers = {
    Marker(markerId: MarkerId('in 1'), position: LatLng(6.51, 3.37)),
    Marker(markerId: MarkerId('in 2'), position: LatLng(6.64, 3.52)),
    Marker(markerId: MarkerId('in 3'), position: LatLng(6.46, 3.58)),
    Marker(markerId: MarkerId('in 4'), position: LatLng(6.85, 3.63)),
    Marker(markerId: MarkerId('out'), position: LatLng(5.31, -3.99)),
  };

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
      clusterManagers: _clusters,
      markers: _markers,
      // We recompute clusters whenever the map's view has finished moving.
      onCameraIdle: _recomputeClusters,
    );
  }

  /// Creates clusters according to some business logic, then calls [setState].
  void _recomputeClusters() {
    final myCluster = ClusterManager(
      clusterManagerId: ClusterManagerId('my cluster'),
      onClusterTap: (c) => debugPrint('tapped cluster'),
    );

    // Here, we simply assign markers whose id starts with 'in'
    // to a the cluster above, and keep the rest as individual markers.
    //
    // Real apps will cluster according to some meaningful relationship
    // between markers.
    final updatedMarkers = _markers
        .map((marker) => marker.copyWith(
              clusterManagerIdParam: marker.markerId.value.startsWith('in')
                  ? myCluster.clusterManagerId
                  : null,
            ))
        .toSet();

    setState(() {
      _clusters = {myCluster};
      _markers = updatedMarkers;
    });
  }
}
