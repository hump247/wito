import 'package:flutter/material.dart';
import 'package:wito_app/screens/views/nyumbani.dart';
import 'package:wito_app/themes/colors.dart';



class Minada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Minada',textAlign: TextAlign.start,),

          ),
          body: Container(

              child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                      child: Form(
                          child: Column(children: [
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/logo/img_4.png',
                                    height: 180,
                                  ),
                                  SizedBox(height: 30,),
                                  Text('Nunua Bidhaa Mbali Mbali Kwenye Minada'),
                                  SizedBox(height: 20,),

                                  Text('Inakuja Hivi Karibuni',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                                ],
                              ),
                            )
                          ])))))),
    );
  }
}