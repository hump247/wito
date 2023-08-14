import 'package:flutter/material.dart';
import '../views/pages/project_details_dialog.dart';
import '../../controllers/featuredCardController.dart';


class IliyokamilikaWidget extends StatefulWidget {
  const IliyokamilikaWidget({
    super.key,
  });

  @override
  State<IliyokamilikaWidget> createState() => _IliyokamilikaWidgetState();
}

class _IliyokamilikaWidgetState extends State<IliyokamilikaWidget> {
  // final featuredCardController = FeaturedCardController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SizedBox(
          height: 230,
          child: ListView.builder(
              itemCount:23,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // final feturedcarddetails =
                //     featuredCardController.featuredCardDetails[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Card(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: 300.0,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => ProjectDetailDialog(
                          //             featuredCardDetail: feturedcarddetails)));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/logo/image1.jpg',
                                      height: 222,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width: 300,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black87.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'SGR Railway Construction',
                                                overflow:
                                                TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(height: 5,),
                                                Text(
                                                  'Ujenzi wa reli ya kisasa ya Standard Gauge Railway',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
