import 'package:flutter/material.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Feeds', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
      ),
    );
  }
}
