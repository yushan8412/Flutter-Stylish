import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const String googleMapKey = 'AIzaSyCCoG7it14FcUr3BghkNv-j0XlVKW0_A7Q';
const double defaultPadding = 16.0;

// class MapPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _taipei = CameraPosition(
    target: LatLng(25.033671, 121.564427),
    zoom: 14.4746,
  );

  static const CameraPosition _taipei101 = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(25.033671, 121.564427),
    tilt: 59.440717697143555,
    zoom: 17.1146,
  );

  static const CameraPosition _riverSide = CameraPosition(
    bearing: 102.8334901395799,
    target: LatLng(25.076865, 121.536683),
    tilt: 59.440717697143555,
    zoom: 17.1146,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAP'),
        backgroundColor: Color.fromARGB(255, 104, 156, 228),
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _taipei,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          const Marker(
              markerId: MarkerId("taipei101"),
              position: LatLng(25.033671, 121.564427),
              infoWindow: InfoWindow(title: 'Taipei 101', snippet: '台灣最高的建築物')),
          const Marker(
            markerId: MarkerId("river"),
            position: LatLng(25.076865, 121.536683),
            infoWindow: InfoWindow(title: '河濱公園', snippet: '台北散步好去處'),
          )
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheRiverside,
        label: const Text('To riverside!'),
      ),
    );
  }

  Future<void> _goToTheRiverside() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_riverSide));
  }
}
