

import 'package:flutter/material.dart';
import 'package:wito_app/screens/views/siasa.dart';
import 'package:wito_app/wallet.dart';

import '../../minada.dart';
import '../../notification.dart';
import '../../pages/sing_in.dart';
import '../../themes/colors.dart';
import 'package:flutter/material.dart';

import '../homepage.dart';
import 'Miradi_intro.dart';
import 'biashara.dart';
import 'nyumbani.dart';




class MpangilioScreen extends StatefulWidget {
  const MpangilioScreen({super.key});

  @override
  State<MpangilioScreen> createState() => _MpangilioScreenState();
}

class _MpangilioScreenState extends State<MpangilioScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0070ac),
        elevation: 0,
        title: Text('Mipangilio',textAlign: TextAlign.start,),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pochi(), // Replace NewPage() with your desired page widget
                  )
              );
            },
            icon: const Icon(Icons.wallet,color: Colors.lightBlue,),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Minada(), // Replace NewPage() with your desired page widget
                  )
              );
            },
            icon: const Icon(Icons.monetization_on,color: Colors.lightBlue),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Alarm(), // Replace NewPage() with your desired page widget
                  )
              );
            },
            icon: const Icon(Icons.notifications,color: Colors.lightBlue,),
          ),
        ],
      ),
      backgroundColor: Styles.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Container(
          child: ListView(
            padding: const EdgeInsets.all(5),
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                height: 4,
              ),
              userTile(),
              // divider(),
              colorTiles()
            ],
          ),
        ),
      ),
    );

  }
}

Widget userTile() {
  String url = 'assets/icon/appicon.png';
  return ListTile(
    leading: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
      ),
    ),
    title: const Text(
      'Mgeni',
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21, color: Colors.black45),
    ),
    subtitle: const Text('Mtumiaji asiyesajiliwa', style: TextStyle(color: Colors.blue)),
  );
}


Widget divider() {
  return const Padding(
    padding: EdgeInsets.all(9),
    child: Divider(
      thickness: 1.5,
    ),
  );
}

Widget colorTiles() {
  return Column(
    children: [
      Row(

        children: [
          Text(
            'Akaunti',
            style: TextStyle(
              color: Styles.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      colorTile(Icons.person, Colors.black54, 'Wasifu',() {

        // Add your action here when the tile is tapped
      }),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mipangilio ya jumla',
            style: TextStyle(
              color: Styles.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      colorTile(Icons.people, Styles.primaryColor, 'Kuhusu sisi',() {
        // Add your action here when the tile is tapped
      }),
      colorTile(Icons.security, Styles.primaryColor, 'Sera ya faragha',() {
        // Add your action here when the tile is tapped
      }),
      colorTile(Icons.people, Styles.primaryColor, 'Vigezo na masharti',() {
        // Add your action here when the tile is tapped
      }),
      colorTile(Icons.logout, Styles.primaryColor, 'Kuondoka', () {

      }),
      SizedBox(height: 300,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'version 1.0',
            style: TextStyle(
              color: Styles.primaryColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ],
  );
}

void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('Una hakika unataka kuondoka?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext); // Close the dialog
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext); // Close the dialog
              _performLogout(context); // Call the method to perform logout
            },
            child: Text('Yes'),
          ),
        ],
      );
    },
  );
}

void _performLogout(BuildContext context) {
  // Add your logout logic here
  // For example, you can navigate to the login screen or clear user data
  // You can also call your authentication or user management methods
  // For demonstration purposes, let's navigate to the SignIn screen:
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => SignIn()), // Replace with your SignIn screen
  );
}


Widget colorTile(IconData icon, Color color, String txt, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap, // Assign the onTap callback
    child: ListTile(
      leading: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
          color: color.withOpacity(0.0),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Icon(
          icon,
          color: Colors.black54,
        ),
      ),
      title: Text(
        txt,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    ),
  );
}
