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
      width: 250,
      height: 290,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(6)),
      child: Column(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                    minHeight: 100,
                    maxHeight: MediaQuery.of(context).size.height * 0.3),
                child: Image.network(
                  "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-blue-select-2021?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1629842712000",
                  fit: BoxFit.fill,
                ))),
        Text('FeedItemsss'),
      ]),
    );
  }
}
