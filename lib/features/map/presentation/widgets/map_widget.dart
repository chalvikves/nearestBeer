import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Container(
            color: Colors.green,
            height: 607,
            child: const Center(
              child: Text('Map'),
            ),
          ),
        ),
      ],
    );
  }
}
