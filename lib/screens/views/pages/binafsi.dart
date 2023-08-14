import 'package:flutter/material.dart';

class BinafsiScreen extends StatefulWidget {
  const BinafsiScreen({super.key});

  @override
  State<BinafsiScreen> createState() => _BinafsiScreenState();
}

class _BinafsiScreenState extends State<BinafsiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          children: [
            SizedBox(height: 50,),
            Image.asset(
              'assets/logo/img_2.png',
              height: 180,
            ),
            SizedBox(height: 30,),
            Text('Nunua Bidhaa Mbalimbali zianzouzwa na '),
            Text('watu binafsi kwa Bei Nafuu'),
            SizedBox(height: 20,),

            Text('Inakuja hivi Karibuni',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          ],
        ),
      ),
    );

  }
}