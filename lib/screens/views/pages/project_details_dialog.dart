// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wito_app/controllers/featuredCardController.dart';
import 'package:wito_app/themes/colors.dart';
import 'package:wito_app/screens/views/pages/uza_hisa.dart';
import 'package:wito_app/screens/widgets/featured_card_widget.dart';

import '../../widgets/Miradi_inayoendelea.dart';

class ProjectDetailDialog extends StatefulWidget {
  final FeaturedCardDetails featuredCardDetail;
  const ProjectDetailDialog({Key? key, required this.featuredCardDetail})
      : super(key: key);

  @override
  State<ProjectDetailDialog> createState() => _ProjectDetailDialogState();
}

class _ProjectDetailDialogState extends State<ProjectDetailDialog> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.featuredCardDetail.video)
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(() {
      if (!_controller.value.hasError && !_controller.value.isPlaying) {
        setState(() {
          _isPlaying = false;
        });
      } else if (_controller.value.isPlaying) {
        setState(() {
          _isPlaying = true;
        });
      }
    });
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      _controller.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog Box'),
          content: Text('This is a dialog box content.'),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDialog1(BuildContext context, String dialogText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog'),
          content: Text(dialogText),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.lightColor,
        elevation: 0,
        title: Text(
          widget.featuredCardDetail.jina,
          style: TextStyle(color: Styles.darkColor),
        ),
        iconTheme: IconThemeData(color: Styles.primaryColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _controller.value.isInitialized
                  ? GestureDetector(
                onTap: _togglePlayPause,
                child: Stack(
                  children: [
                    VideoPlayer(_controller),
                    if (!_isPlaying)
                      Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              )
                  : Center(child: CircularProgressIndicator()),
            ),
            const SizedBox(
              height: 0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (String imageUrl in widget.featuredCardDetail.picha
                      .where((url) => url != null && url.isNotEmpty))
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: SizedBox(
                        width: 210.0,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.all(8.0), // Adjust padding
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  imageUrl,
                                  height: 110,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2, // Adjust this value to reduce space
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
                      Text(
                        widget.featuredCardDetail.jina,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: SizedBox(
                height: 0.5,
                child: Container(
                  color: Styles.darkColor,
                ),
              ),
            ),
            Container(
              child: ListTile(
                contentPadding: const EdgeInsets.only(top: 5, left: 10),
                minVerticalPadding: 5.5,
                title: Text('Mhutasari', style: TextStyle()),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    widget.featuredCardDetail.maelezo,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    textAlign:
                    TextAlign.justify, // Align text in paragraph format
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
            ),
            SizedBox(height: 60),

          ],
        ),
      ),
    );
  }
}

class Styles {
  static const Color lightColor = Colors.white;
  static const Color darkColor = Colors.black;
  static const Color primaryColor = Colors.blue;
}
