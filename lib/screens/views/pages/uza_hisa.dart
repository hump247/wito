import 'package:flutter/material.dart';

import '../../../themes/colors.dart';

class uzaHisaWidget extends StatelessWidget {
  const uzaHisaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.sell,
          size: 48.0,
          color: Colors.greenAccent,
        ),
        const SizedBox(height: 16.0),
        const Text(
          ' Fusce a metus vel lacus dictum molestie vel a urna.',
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Weka Kiasi',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 6.0),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Weka NenoSiri',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Rudia NenoSiri',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Styles.primaryColor,
            ),
            child: const Text('Kamilisha'),
          ),
        ),
      ],
    );
  }
}


