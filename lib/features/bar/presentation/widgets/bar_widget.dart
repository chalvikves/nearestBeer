import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:nearest_beer/core/constants/constants.dart';
import 'package:nearest_beer/core/errors/failures.dart';
import 'package:nearest_beer/features/bar/business/entities/bar_entity.dart';
import 'package:nearest_beer/features/bar/presentation/providers/bar_provider.dart';
import 'package:nearest_beer/features/beer/presentation/providers/beer_button_provider.dart';
import 'package:provider/provider.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BeerButtonProvider beerButtonProvider =
        Provider.of<BeerButtonProvider>(context);

    BarEntity? barEntity = Provider.of<BarProvider>(context).barEntity;
    Failure? failure = Provider.of<BarProvider>(context).failure;
    late Widget widget;

    if (barEntity != null) {
      widget = Text(barEntity.name);
    } else if (failure != null) {
      widget = Expanded(
        child: Center(
          child: Text(failure.errorMessage),
        ),
      );
    } else {
      widget = Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            beerButtonProvider.changePressed(false);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        AnimatedIconButton(
                          icons: [
                            AnimatedIconItem(
                              icon: Icon(
                                Icons.favorite_border_outlined,
                                color: kAccentColor,
                              ),
                            ),
                            AnimatedIconItem(
                              icon: Icon(
                                Icons.favorite,
                                color: kAccentColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      'Tvåkanten',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  Icon(Icons.schedule_outlined),
                  SizedBox(
                    width: 4,
                  ),
                  Text("Closes 23"),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Row(
                children: [
                  Icon(Icons.directions_walk_outlined),
                  SizedBox(
                    width: 4,
                  ),
                  Text("140 m"),
                ],
              ),
              SizedBox(
                width: 32,
              ),
              Row(
                children: [
                  Icon(Icons.star_outline_rounded),
                  SizedBox(
                    width: 4,
                  ),
                  Text("4.2"),
                ],
              ),
              SizedBox(
                width: 16,
              )
            ],
          ),
          const Divider(),
          const Placeholder(
            fallbackHeight: 350,
          ),
        ],
      );
    }

    return widget;
  }
}
