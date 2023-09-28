import 'package:flutter/material.dart';
import 'package:nearest_beer/core/constants/constants.dart';
import 'package:provider/provider.dart';
import '../providers/selected_page_provider.dart';

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedPageProvider>(context).selectedPage;

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: "Beer",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map_outlined,
          ),
          label: "Maps",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history_outlined,
          ),
          label: "History",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: "Settings",
        ),
      ],
      currentIndex: selectedPage,
      selectedItemColor: kAccentColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      unselectedFontSize: 12,
      selectedFontSize: 12,
      iconSize: 24,
      onTap: (value) =>
          Provider.of<SelectedPageProvider>(context, listen: false)
              .changePage(value),
    );
  }
}
