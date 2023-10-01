import 'package:flutter/material.dart';
import 'package:nearest_beer/features/history/presentation/widgets/history_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HistoryWidget(),
          ],
        ),
      ),
    );
  }
}
