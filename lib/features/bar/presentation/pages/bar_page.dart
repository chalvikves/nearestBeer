import 'package:flutter/material.dart';

import '../widgets/bar_widget.dart';

class BarPage extends StatelessWidget {
  const BarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      //width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BarWidget(),
        ],
      ),
    );
  }
}
