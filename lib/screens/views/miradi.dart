import '../../minada.dart';
import '../../notification.dart';
import '../../themes/colors.dart';
import 'package:flutter/material.dart';
import '../../wallet.dart';

import '../widgets/ilioyokamilika.dart';
import '../widgets/inayoendelea_widget.dart';
import '../widgets/featured_card_widget.dart';
import '../../controllers/yaliojiriController.dart';
import '../../controllers/featuredCardController.dart';

class MiradiScreen extends StatefulWidget {
  const MiradiScreen({super.key});

  @override
  State<MiradiScreen> createState() => _MiradiScreenState();
}

class _MiradiScreenState extends State<MiradiScreen> {
  //final user = FirebaseAuth.instance.currentUser!;
  // final featuredCardController = FeaturedCardController();

  final yaliyojiriCardController = YaliojiriCardController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0070ac),
          elevation: 0,
          title: const Text(
            'Miradi',
            textAlign: TextAlign.start,
          ),
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
        backgroundColor: Styles.lightCOlor,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // TextButton(
                        //     onPressed: () {}
                        //     child: const Row(
                        //       children: [
                        //         Text(
                        //           'Tazama Zaidi ',
                        //           style: TextStyle(
                        //               color: Color(0xFF1798D1),
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         Icon(
                        //           Icons.chevron_right,
                        //         ),
                        //       ],
                        //     ))
                      ],
                    ),
                  ),
                  const FeaturedCardWidget(),
                  SizedBox(
                    height: 30,
                  ),
                  const InayoendeleaCardWidget(),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 8, right: 10),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const IliyokamilikaWidget(),
                ],
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
