import 'package:flutter/material.dart';
import '../../services/service.dart';
import '../views/pages/project_details_dialog.dart';

class FeaturedCardDetails {
  final List picha;
  final String jina;
  final String maelezo;
  final String video;

  FeaturedCardDetails({
    required this.picha,
    required this.jina,
    required this.maelezo,
    required this.video,
  });
}

class FeaturedCardWidget extends StatefulWidget {
  const FeaturedCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FeaturedCardWidget> createState() => _FeaturedCardWidgetState();
}

class _FeaturedCardWidgetState extends State<FeaturedCardWidget> {
  final GetData _getData = GetData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SizedBox(
        height: 250,
        child: StreamBuilder<List<Map<String, dynamic>>>(
          stream: _getData.getMiradiStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final featuredCardDetails = snapshot.data!;
              return ListView.builder(
                itemCount: featuredCardDetails.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final featuredCardDetail = featuredCardDetails[index];
                  final List<dynamic> pichaImages =
                      featuredCardDetail['picha'] ?? [];
                  final String jina = featuredCardDetail['jina'] ?? '';
                  final String maelezo = featuredCardDetail['maelezo'] ?? '';
                  final String videourl = featuredCardDetail['video'] ?? '';

                  return Container(
                    width: 300,
                    child: GestureDetector(
                      onTap: () {
                        FeaturedCardDetails cardDetails = FeaturedCardDetails(
                          picha: pichaImages,
                          jina: jina,
                          maelezo: maelezo,
                          video: videourl.isNotEmpty ? videourl : '',
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProjectDetailDialog(
                              featuredCardDetail: cardDetails,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15.0),
                                  ),
                                  child: Container(
                                    height: 160,
                                    width: double.infinity,
                                    child: Image.network(
                                      pichaImages.isNotEmpty
                                          ? pichaImages[1]
                                          : 'fallback_image_url',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(182, 0, 0, 0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          jina,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          maelezo,
                                          style: TextStyle(
                                            color:  Colors.white,
                                            fontSize: 8,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
