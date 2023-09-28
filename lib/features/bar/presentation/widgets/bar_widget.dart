import 'package:flutter/material.dart';
import 'package:nearest_beer/features/beer/presentation/providers/beer_button_provider.dart';
import 'package:provider/provider.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BeerButtonProvider beerButtonProvider =
        Provider.of<BeerButtonProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                beerButtonProvider.changePressed(false);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            const Text('Tvåkanten'),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        const SizedBox(
          child: Placeholder(),
        ),
      ],
    );
  }
}
