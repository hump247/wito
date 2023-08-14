import 'package:flutter/material.dart';
import 'package:wito_app/screens/homepage.dart';
import 'package:wito_app/screens/views/Miradi_intro.dart';
import 'package:wito_app/screens/views/biashara.dart';
import 'package:wito_app/screens/views/mpangilio.dart';
import 'package:wito_app/screens/views/nyumbani.dart';
import 'package:wito_app/screens/views/siasa.dart';

import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    NyumbaniScreen(),
    const BiasharaSCreen(),
    Miradi_intro(),
    const SiasaScreen(),
    const MpangilioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    customBottomNavigationBar = CustomBottomNavigationBar(
      currentIndex: _pageIndex,
      onTap: (value) {
        setState(() {
          _pageIndex = value;
        });
      },
    );
    return Scaffold(
        body: _pages[_pageIndex],
        bottomNavigationBar: customBottomNavigationBar
    );
  }
}
