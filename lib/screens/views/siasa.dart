import 'package:flutter/material.dart';
import 'package:wito_app/themes/colors.dart';

import '../../minada.dart';
import '../../notification.dart';
import '../../wallet.dart';

class SiasaScreen extends StatefulWidget {
  const SiasaScreen({super.key});

  @override
  State<SiasaScreen> createState() => _SiasaScreenState();
}

class _SiasaScreenState extends State<SiasaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0070ac),
        elevation: 0,
        title: Text("Siasa",textAlign: TextAlign.start,),
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
      body: Center(
        child: Column(

          children: [
            SizedBox(height: 50,),
            Image.asset(
              'assets/logo/politics_img.png',
              height: 180,
            ),
            SizedBox(height: 30,),
            Text('Pata taarifa Mbali mbali kuhusu Wanasiasa'),
            SizedBox(height: 20,),

            Text('Inakuja Hivi Karibuni',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          ],
        ),
      ),
    );

  }
}