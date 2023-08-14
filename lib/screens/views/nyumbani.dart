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

class NyumbaniScreen extends StatefulWidget {
  NyumbaniScreen({Key? key}) : super(key: key);

  @override
  _NyumbaniScreenState createState() => _NyumbaniScreenState();
}

class _NyumbaniScreenState extends State<NyumbaniScreen> {
  // final featuredCardController = FeaturedCardController();
  final yaliyojiriCardController = YaliojiriCardController();
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    // Simulate delay of 2 seconds before showing content
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0070ac),
          title: const Text('WITO',textAlign: TextAlign.start,),
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
              delegate: SliverChildListDelegate(

                [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3, left: 8, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                               Text(
                                'Miradi ya vipaumbele',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 5),
                        transitionBuilder: (widget, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              child: widget,
                            ),
                          );
                        },
                        child: isLoading
                            ? SkeletonLoadingWidget() // Replace with your skeleton loading widget
                            : FeaturedCardWidget(),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(top: 3, left: 8, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Miradi mipya',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                          ],
                        ),
                      ),
                       SizedBox(height: 5,),
                       AnimatedSwitcher(
                        duration: const Duration(milliseconds: 5),
                        transitionBuilder: (widget, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              child: widget,
                            ),
                          );
                        },
                        child: isLoading
                            ? SkeletonLoadingWidget() // Replace with your skeleton loading widget
                            : InayoendeleaCardWidget(),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(top: 3, left: 8, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Miradi inayoendelea',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                       AnimatedSwitcher(
                        duration: const Duration(milliseconds: 5),
                        transitionBuilder: (widget, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              child: widget,
                            ),
                          );
                        },
                        child: isLoading
                            ? SkeletonLoadingWidget() // Replace with your skeleton loading widget
                            : FeaturedCardWidget(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SkeletonLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: 3, // Adjust the number of skeleton items as needed
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
          );
        },
      ),
    );
  }
}
