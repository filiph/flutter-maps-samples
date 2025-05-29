// Copyright 2025 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Initializes a map with a mapID to apply Cloud-based maps styling to the map.
class MapIdSample extends StatelessWidget {
  const MapIdSample({super.key});

  @override
  Widget build(BuildContext context) {
    // [START maps_flutter_map_id]
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),

      // Generate your own map ID at https://goo.gle/get-map-id.
      cloudMapId: '78434bee6dc2e9b1',
    );
    // [END maps_flutter_map_id]
  }
}
