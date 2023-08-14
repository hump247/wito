import 'package:flutter/material.dart';

class TaasisiScreen extends StatefulWidget {
  const TaasisiScreen({super.key});

  @override
  State<TaasisiScreen> createState() => _TaasisiScreenState();
}

class _TaasisiScreenState extends State<TaasisiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          children: [
            SizedBox(height: 50,),
            Image.asset(
              'assets/logo/taasisi_icon.png',
              height: 180,
            ),
            SizedBox(height: 30,),
            Text('Nunua Bidhaa Mbali Mbali zinazouzwa '),
            Text('na Taasis kwa Bei nafuu'),
            SizedBox(height: 20,),

            Text('Inakuja hivi punde!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          ],
        ),
      ),
    );

  }
}