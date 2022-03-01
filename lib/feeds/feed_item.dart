import 'package:flutter/material.dart';

class FeedItem extends StatefulWidget {
  const FeedItem({Key? key}) : super(key: key);

  @override
  _FeedItemState createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('FeedItemsss'),
    );
  }
}
