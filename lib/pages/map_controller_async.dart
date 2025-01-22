import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This example demonstrates how to synchronize the map
/// with [Future]s and [Stream]s.
class MapControllerAsyncSample extends StatefulWidget {
  const MapControllerAsyncSample({super.key});

  @override
  State<MapControllerAsyncSample> createState() =>
      _MapControllerAsyncSampleState();
}

class _MapControllerAsyncSampleState extends State<MapControllerAsyncSample> {
  /// An async completer that we supply with the map controller
  /// as soon as the `onMapCreated` callback is fired.
  final Completer<GoogleMapController> _completer = Completer();

  /// A simulated source of asynchronous events.
  ///
  /// In real apps, this could be a stream of changes to the user's position,
  /// for example.
  final Stream<void> _myEventsStream =
      Stream.periodic(const Duration(seconds: 1)).take(5);

  /// A subscription to [_myEventsStream], so we can properly cancel it.
  StreamSubscription<void>? _myStreamSubscription;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),

      // Simply supply the completer with the map controller
      // as soon as it is available.
      //
      // Beware: This will *throw* if the `onMapCreated` callback is fired
      // more than once. That could happen, for example, if you change
      // the `Key` of the `GoogleMap` widget from one widget build to another,
      // and so the old `GoogleMap` widget cannot be reused.
      // That scenario is rare but possible.
      onMapCreated: (controller) => _completer.complete(controller),
    );
  }

  @override
  void dispose() {
    _myStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _myStreamSubscription = _myEventsStream.listen(_onOutsideEvent);
  }

  void _onOutsideEvent(void _) async {
    // First, await the completer's future. This continues immediately
    // if the controller value is already available.
    final controller = await _completer.future;

    // Use the controller.
    controller.animateCamera(CameraUpdate.zoomIn());
  }
}
