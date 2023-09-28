import 'package:flutter/material.dart';
import 'package:nearest_beer/features/bar/presentation/pages/bar_page.dart';
import 'package:nearest_beer/features/beer/presentation/pages/beer_page.dart';
import 'package:provider/provider.dart';
import 'widgets/custom_bottom_bar_widget.dart';
import 'providers/selected_page_provider.dart';

List<Widget> pages = const [
  BeerPage(),
  BarPage(),
  BarPage(),
  BarPage(),
];

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedPageProvider>(context).selectedPage;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Nearest Beer'),
      // ),
      body: pages[selectedPage],
      bottomNavigationBar: const CustomBottomBarWidget(),
    );
  }
}
