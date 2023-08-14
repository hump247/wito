import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xff0070ac),
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      unselectedItemColor: Colors.lightBlue,
      selectedItemColor: Colors.white,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Nyumbani'),
        BottomNavigationBarItem(icon: Icon(Icons.sell), label: 'Biashara'),
        BottomNavigationBarItem(
            icon: Icon(Icons.business_center), label: 'Miradi'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Siasa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Mpangilio'),
      ],
    );
  }
}
