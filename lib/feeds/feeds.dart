import 'package:flutter/material.dart';
import 'package:flutter_shop/feeds/feed_item.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 250 / 420,
          children: List.generate(20, (index) => const FeedItem()),
        ),
      ),
    );
  }
}
