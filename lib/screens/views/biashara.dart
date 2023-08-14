
import 'package:wito_app/screens/views/pages/binafsi.dart';
import 'package:wito_app/screens/views/pages/taasisi.dart';
import 'package:flutter/material.dart';
import 'package:wito_app/themes/colors.dart';
import '../../controllers/yaliojiriController.dart';
import '../../minada.dart';
import '../../notification.dart';
import '../../wallet.dart';


class BiasharaSCreen extends StatefulWidget {
  const BiasharaSCreen({super.key});

  @override
  State<BiasharaSCreen> createState() => _MiradiScreenState();
}

class _MiradiScreenState extends State<BiasharaSCreen> with SingleTickerProviderStateMixin {
  // final featuredCardController = FeaturedCardController();
  final yaliyojiriCardController = YaliojiriCardController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0070ac),
          title: const Text(
            'Biashara',
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
          bottom: TabBar(
            controller: _tabController, // Pass the TabController here
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Taasisi'),
              Tab(text: 'Binafsi')
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController, // Pass the same TabController here
          children: [TaasisiScreen(), BinafsiScreen()],
        ),
      ),
    );
  }
}




