import 'package:flutter/material.dart';

import 'package:nearest_beer/core/constants/constants.dart';
import 'package:nearest_beer/features/beer/presentation/providers/beer_button_provider.dart';
import 'package:provider/provider.dart';

class BeerWidget extends StatelessWidget {
  const BeerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BeerButtonProvider beerButtonProvider =
        Provider.of<BeerButtonProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Nearest Beer',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
        ),
        const Center(
          child: Text(
            "Press for beer",
          ),
        ),
        IconButton(
          onPressed: () {
            beerButtonProvider.changePressed(true);
          },
          icon: const Icon(Icons.sports_bar_outlined),
          iconSize: 160,
          color: kAccentColor,
        ),
      ],
    );
  }
}
