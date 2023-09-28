import 'package:flutter/material.dart';

class CustomBottomBarIconWidget extends StatelessWidget {
  const CustomBottomBarIconWidget({
    Key? key,
    required this.callback,
    required this.iconDataSelected,
    required this.iconDataUnselected,
    required this.isSelected,
    required this.label,
  }) : super(key: key);

  final VoidCallback callback;
  final bool isSelected;
  final IconData iconDataSelected;
  final IconData iconDataUnselected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: callback,
          iconSize: 25,
          icon: Icon(
            isSelected ? iconDataSelected : iconDataUnselected,
            color: isSelected ? Colors.orangeAccent : Colors.black87,
          ),
        ),
        Text(label),
      ],
    );
  }
}
