import 'package:wito_app/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../../controllers/yaliojiriController.dart';

class YaliojiriDetailScreen extends StatefulWidget {
  final YaliojiriCardDetails yaliyojiriCardDetails;
  const YaliojiriDetailScreen({super.key, required this.yaliyojiriCardDetails});

  @override
  State<YaliojiriDetailScreen> createState() => _YaliojiriDetailScreenState();
}

class _YaliojiriDetailScreenState extends State<YaliojiriDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.lightCOlor,
        elevation: 0,
        title: Text(
          'Kuhusu Mradi',
          style: TextStyle(color: Styles.darkCOlor),
        ),
        iconTheme: IconThemeData(color: Styles.primaryColor),
      ),
      body: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add your multiline text here
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: TextStyle(fontSize: 16.0),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Styles.primaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Styles.lightCOlor,
        selectedItemColor: Styles.whiteColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Nyumbani'),
          BottomNavigationBarItem(icon: Icon(Icons.sell), label: 'Biashara'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business_center), label: 'Miradi'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Siasa'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Mpangilio'),
        ],
      ),
    );
  }
}
