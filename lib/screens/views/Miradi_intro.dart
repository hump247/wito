import 'package:flutter/material.dart';
import 'package:wito_app/screens/views/nyumbani.dart';
import 'package:wito_app/themes/colors.dart';

import 'miradi.dart';


class Miradi_intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Miradi',
            textAlign: TextAlign.start,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NyumbaniScreen(),
                ),
              );
            },
          ),
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
                          'assets/logo/img_1.png',
                          height: 250,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Pata taarifa kuhusu miradi Mbalimbali inayo simamiwa na Serikali.',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Pia unaweza kununua au Kuuza hisza Miradi Husika pamoja na Kuweka miadi ya kufanya kazi kwenye miradi hio',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Container(
                          height: 50,
                          width: 300,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MiradiScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Endelea",
                                style: TextStyle(fontSize: 15),
                              )),
                        ),
                        SizedBox(
                          height: 250,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(75, 0, 32, 1),
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                value: _isChecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _isChecked = newValue ?? false;
                                  });
                                },
                              ),
                              Text("Usionyeshe huu Ukrasa tena")
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]))))));
  }
}
