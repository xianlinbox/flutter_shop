import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class FeedItem extends StatefulWidget {
  const FeedItem({Key? key}) : super(key: key);

  @override
  _FeedItemState createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/product_details');
        },
        child: Container(
          width: 250,
          height: 350,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(6)),
          child: Column(children: [
            Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                          minHeight: 100,
                          maxHeight: MediaQuery.of(context).size.height * 0.3),
                      child: Image.network(
                        "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-blue-select-2021?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1629842712000",
                        fit: BoxFit.fitWidth,
                      ))),
              Positioned(
                right: 0,
                child: Badge(
                  toAnimate: false,
                  shape: BadgeShape.square,
                  badgeColor: Colors.purple,
                  borderRadius: BorderRadius.circular(4),
                  badgeContent:
                      const Text('New', style: TextStyle(color: Colors.white)),
                ),
              ),
            ]),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 3),
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('iPhone XR',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('\$999.99',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Quantity: 12 left',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w800)),
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(16),
                              child: const Icon(Icons.more_horiz,
                                  color: Colors.grey),
                            ))
                      ],
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
