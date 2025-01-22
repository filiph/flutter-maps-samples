import 'package:flutter/material.dart';
import 'package:flutter_maps_samples/pages/basic_static.dart';
import 'package:flutter_maps_samples/pages/camera_animate.dart';
import 'package:flutter_maps_samples/pages/camera_move.dart';
import 'package:flutter_maps_samples/pages/handle_events.dart';
import 'package:flutter_maps_samples/pages/map_controller_async.dart';
import 'package:flutter_maps_samples/pages/map_id.dart';
import 'package:flutter_maps_samples/pages/map_type.dart';
import 'package:flutter_maps_samples/pages/marker.dart';
import 'package:flutter_maps_samples/pages/marker_clustering.dart';
import 'package:flutter_maps_samples/pages/marker_clustering_dynamic.dart';
import 'package:flutter_maps_samples/pages/marker_custom_icon.dart';
import 'package:flutter_maps_samples/pages/markers_dynamic.dart';
import 'package:flutter_maps_samples/pages/my_location.dart';
import 'package:flutter_maps_samples/pages/polygons.dart';
import 'package:flutter_maps_samples/pages/polylines.dart';
import 'package:flutter_maps_samples/pages/styled_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static final List<Widget> _samples = [
    BasicStaticSample(),
    MoveCameraSample(),
    AnimateCameraSample(),
    MarkerSample(),
    MarkerCustomIconSample(),
    MarkersDynamicSample(),
    MapIdSample(),
    StyledMapSample(),
    MapTypeSample(),
    MapControllerAsyncSample(),
    HandleEventsSample(),
    MyLocationSample(),
    PolygonsSample(),
    PolylinesSample(),
    MarkerClusteringSample(),
    MarkerClusteringDynamicSample(),
  ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Google Maps Samples'),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 16 / 9,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          for (var (index, sample) in _samples.indexed)
            _buildCard(index, sample, context)
        ],
      ),
    );
  }

  Widget _buildCard(int index, Widget widget, BuildContext context) {
    final color = Colors.primaries[index % Colors.primaries.length].shade700;
    final title = _describe(widget);

    return Card(
      color: color,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _SharedScaffold(
                title: title,
                child: widget,
              ),
            ),
          );
        },
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(blurRadius: 10)],
            ),
          ),
        ),
      ),
    );
  }

  String _describe(Widget widget) {
    final camelCaseString =
        widget.runtimeType.toString().replaceAll('Sample', '');

    // Use a RegEx to find uppercase letters preceded by lowercase letters
    // or other uppercase letters
    return camelCaseString.replaceAllMapped(
        RegExp(r'(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])'),
        (match) => ' ');
  }
}

/// Code shared between sample pages.
class _SharedScaffold extends StatelessWidget {
  final String title;

  final Widget child;

  const _SharedScaffold({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: child,
    );
  }
}
