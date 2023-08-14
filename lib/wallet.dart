import 'package:flutter/material.dart';
import 'package:wito_app/screens/views/nyumbani.dart';



class Pochi extends StatefulWidget {
  const Pochi({super.key});

  @override
  State<Pochi> createState() => _PochiState();
}

class _PochiState extends State<Pochi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pochi',
            textAlign: TextAlign.start,
          ),

        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color.fromRGBO( 122,102,86,23),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Salio kuu',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '0',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Thamani ya hisa',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '0',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Miadi ya kazi',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '0',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hisa zianzosubiri uthibitisho',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '0',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: Colors.black,
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jumla Kuu',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '0',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showDialogBox(context, 'Nunua Hisa');
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        color: Colors.green,
                        child: Row(
                          children: [
                            Icon(Icons.add, color: Colors.white),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                'Ongeza Salio',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showDialogBox(context, 'Uza hisa');
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        color: Colors.cyan,
                        child: Row(
                          children: [
                            Icon(Icons.send, color: Colors.white),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                'Tuma salio',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showDialogBox(context, 'Nunua Hisa');
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        color: Colors.green,
                        child: Row(
                          children: [
                            Icon(Icons.show_chart, color: Colors.white),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                'Nunua hisa',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showDialogBox(context, 'Uza hisa');
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        color: Colors.cyan,
                        child: Row(
                          children: [
                            Icon(Icons.show_chart, color: Colors.white),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                'Uza hisa',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),


                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showDialogBox(BuildContext context, String action) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hisa'),
        content: Text(
            'Ili uweze kufanya miamala ya $action lazima uwe umajisajili na uingie kwenye account yako '),
        actions: [
          TextButton(
            onPressed: () {
              // Implement your logic here when the first button is pressed
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement your logic here when the second button is pressed
              Navigator.pop(context);
            },
            child: Text('Ingia'),
          ),
          TextButton(
            onPressed: () {
              // Implement your logic here when the third button is pressed
              Navigator.pop(context);
            },
            child: Text('Jisajili'),
          ),
        ],
      );
    },
  );
}
