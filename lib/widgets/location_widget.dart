import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart'; // Import geocoding package
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? _mapController;

  static const CameraPosition _kDefaultCameraPosition =
      CameraPosition(target: LatLng(0.0, 0.0), zoom: 1);
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(0.0, 0.0),
        infoWindow: InfoWindow(title: 'Marker'))
  ];
  final TextEditingController _textFieldController =
      TextEditingController(); // Add this controller

  @override
  void initState() {
    super.initState();
    _textFieldController.text =
        ""; // Initialize the text field with an empty string
  }

  Future<void> loadData() async {
    Position userLocation = await getUserCurrentLocation();
    print('my current location');
    print("${userLocation.latitude} ${userLocation.longitude}");

    _markers.add(Marker(
      markerId: const MarkerId('2'),
      position: LatLng(userLocation.latitude, userLocation.longitude),
      infoWindow: const InfoWindow(title: 'Current location'),
    ));

    // Perform reverse geocoding to get the address (including country)
    List<Placemark> placemarks = await placemarkFromCoordinates(
        userLocation.latitude, userLocation.longitude);
    if (placemarks.isNotEmpty) {
      String country = placemarks.first.country ?? ""; // Get the country name
      setState(() {
        _textFieldController.text =
            country; // Set the text field with the country name
      });
    }

    if (_mapController != null) {
      CameraPosition cameraPosition = CameraPosition(
        zoom: 14,
        target: LatLng(userLocation.latitude, userLocation.longitude),
      );

      _mapController!
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }

    setState(() {});
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error$error");
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _setInitialLocation() async {
    Position userLocation = await getUserCurrentLocation();

    setState(() {
      _markers.clear();
      _markers.add(Marker(
          markerId: const MarkerId('2'),
          position: LatLng(userLocation.latitude, userLocation.longitude),
          infoWindow: const InfoWindow(title: 'My current location')));
    });

    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(userLocation.latitude, userLocation.longitude),
      zoom: 14,
    );

    if (_mapController != null) {
      _mapController!
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFF38003C)),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextField(
                      controller: _textFieldController, // Set the controller
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          color: const Color(0xFF38003C),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<CircleBorder>(
                          const CircleBorder(),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () async {
                      await loadData(); // Call loadData when the button is pressed
                    },
                    icon: const Icon(
                      Icons.location_pin,
                      color: Color(0xFF38003C),
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 4),
                child: GoogleMap(
                  initialCameraPosition: _kDefaultCameraPosition,
                  markers: Set<Marker>.of(_markers),
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      _controller.complete(controller);
                      _mapController = controller;
                    });
                  },
                ),
              )
            ],
          ),
        ),
     ),
);
}
}