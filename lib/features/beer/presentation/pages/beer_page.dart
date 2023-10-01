import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearest_beer/features/beer/presentation/providers/beer_button_provider.dart';
import 'package:provider/provider.dart';

import '../../../bar/presentation/widgets/bar_widget.dart';
import '../widgets/beer_widget.dart';

class BeerPage extends StatelessWidget {
  const BeerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPressed = Provider.of<BeerButtonProvider>(context).isPressed;

    Future<bool> handleLocationPermission() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Location services are disabled. Please enable location services.')),
        );
        return false;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location permissions are denied'),
            ),
          );
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location permissions are permanently denied, cannot request permissions.')));
        return false;
      }

      return true;
    }

    Future<void> getCurrentPosition() async {
      final hasPermission = await handleLocationPermission();
      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isPressed ? const BarWidget() : const BeerWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
