import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:nearest_beer/core/constants/constants.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

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
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Text(
              'History',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(),
        ),
        // TODO: On press takes you to the bar page
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.only(
                          left: 2,
                        ),
                        leading: const SizedBox(
                          height: 50,
                          width: 50,
                          child: Placeholder(),
                        ),
                        title: const Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              width: 55,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star_outline_rounded),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text("4.2"),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Tvåkanten'),
                          ],
                        ),
                        trailing: AnimatedIconButton(
                          size: 25,
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
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
