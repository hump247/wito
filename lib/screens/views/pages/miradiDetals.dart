import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'miadi.dart';
import 'nunua_hisa.dart';
import 'package:wito_app/themes/colors.dart';
import 'package:wito_app/screens/views/pages/uza_hisa.dart';
import '../../../controllers/inayoendeleaCardController.dart';

class MiradiDetailDialog extends StatefulWidget {
  final InayoendeleaCardDetails inayoendeleaCardDetails;

  const MiradiDetailDialog({
    Key? key,
    required this.inayoendeleaCardDetails,
  }) : super(key: key);

  @override
  State<MiradiDetailDialog> createState() => _MiradiDetailDialogState();
}

class _MiradiDetailDialogState extends State<MiradiDetailDialog> {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Ili uweze kufanya miamala ya  lazima uwe umajisajili na uingie kwenye account yako '),
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

  late VideoPlayerController _controller;
  int _pageindex = 0;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/govw-fab38.appspot.com/o/Top%206%20Underrated%20Notebooks%20You%20Need%20to%20Check%20Out.mp4?alt=media&token=e396eb4d-4554-48aa-b5a8-14d9bb12573f')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.lightCOlor,
        elevation: 0,
        title: Text(
          widget.inayoendeleaCardDetails.inayoendeleaCard_details.last.title,
          style: TextStyle(color: Styles.darkCOlor),
        ),
        iconTheme: IconThemeData(color: Styles.primaryColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : Center(child: CircularProgressIndicator()),
            ),
            const SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: SizedBox(
                      width: 190.0,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 5, right: 5),
                            child: Image.asset(
                              'assets/icon/Stationary.jpeg',
                              height: 110,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: SizedBox(
                      width: 190.0,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 5, right: 5),
                            child: Image.asset(
                              widget.inayoendeleaCardDetails
                                  .inayoendeleaCard_details.last.imageUrl,
                              height: 110,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Madaftari ya kujifunzia Hisabati',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: SizedBox(
                height: 0.5,
                child: Container(
                  color: Styles.darkCOlor,
                ),
              ),
            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.only(top: 5, left: 10),
                minVerticalPadding: 5.5,
                title: Text('Mhutasari',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                       )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                 child:Text( 'Vitabu vya Mazoezi ya Hisabati ni zana muhimu kwa wanafunzi kujifunza hisabati. Vitabu hivi vina maudhui tofauti yanayofunika masomo ya hisabati kuanzia darasa la kwanza hadi kidato cha nne.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify, // Align text in paragraph format
                  ),



                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.blue, // Change the color if needed
                  width: 120, // Adjust the width of the divider
                  height: 1, // Adjust the height of the divider
                ),
                TextButton(
                  onPressed: () => _showDialog(context),
                  child: Text('Soma Zaidi'),
                ),
                Container(
                  color: Colors.blue, // Change the color if needed
                  width: 120, // Adjust the width of the divider
                  height: 1, // Adjust the height of the divider
                ),
              ],
            )

          ],
        ),
      ),


    );
  }
}
