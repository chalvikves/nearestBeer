import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearest_beer/features/bar/presentation/providers/bar_provider.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatelessWidget {
  MapWidget({Key? key}) : super(key: key);

  late Position currentLocation;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    BarProvider barProvider = Provider.of<BarProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Nearest Beer',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: SizedBox(
            //color: Colors.green,
            height: 607,
            child: GoogleMap(
              onMapCreated: (controller) {
                barProvider
                    .getPosition()
                    .then((value) => currentLocation = value);
                _controller.complete(controller);
              },
              initialCameraPosition: CameraPosition(
                target:
                    LatLng(currentLocation.latitude, currentLocation.longitude),
                zoom: 14.4746,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
