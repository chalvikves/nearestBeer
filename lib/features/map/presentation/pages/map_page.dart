import 'package:flutter/material.dart';
import 'package:nearest_beer/features/map/presentation/widgets/map_widget.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MapWidget(),
          ],
        ),
      ),
    );
  }
}
