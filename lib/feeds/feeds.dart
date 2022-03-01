import 'package:flutter/material.dart';
import 'package:flutter_shop/feeds/feed_item.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FeedItem(),
      ),
    );
  }
}
