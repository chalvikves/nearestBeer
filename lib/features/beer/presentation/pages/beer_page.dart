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
