import 'package:flutter/material.dart';
import 'package:wito_app/main.dart';
import 'package:wito_app/screens/homepage.dart';
import 'package:wito_app/screens/views/Miradi_intro.dart';
import 'package:wito_app/screens/views/biashara.dart';
import 'package:wito_app/screens/views/mpangilio.dart';
import 'package:wito_app/screens/views/nyumbani.dart';
import 'package:wito_app/screens/views/siasa.dart';
import 'package:wito_app/themes/colors.dart';



class Alarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
    return const Placeholder();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',textAlign: TextAlign.start,),

      ),

      body: Container(

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 90,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Hakuna taarifam mpya kwa sasa',
                            style: TextStyle(

                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar,
    );
  }
}
