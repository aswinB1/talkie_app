import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class googleMaps extends StatefulWidget {
  googleMaps({super.key});

  @override
  State<googleMaps> createState() => _googleMapsState();
}

class _googleMapsState extends State<googleMaps> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Future<LocationData> acceslocation() async {
    Location location = Location();
    var datalocation = await location.getLocation();

    return datalocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Friends near you",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: FutureBuilder(
          future: acceslocation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  initialCameraPosition: CameraPosition(
                      tilt: 50,
                      zoom: 15,
                      target: LatLng(
                        snapshot.data!.latitude!,
                        snapshot.data!.longitude!,
                      )));
            } else {
              Fluttertoast.showToast(msg: ("Something went wrong !!!"));
              return SizedBox();
            }
          },
        ));
  }
}
