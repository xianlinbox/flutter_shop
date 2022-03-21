import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_shop/feeds/feed_product_dialog.dart';
import 'package:flutter_shop/products/product_detail.dart';
import 'package:flutter_shop/products/models/product.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetail.routeName,
              arguments: widget.product);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(6)),
          child: Column(children: [
            Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Container(
                      constraints: BoxConstraints(
                          minHeight: 100,
                          maxHeight: MediaQuery.of(context).size.height * 0.3),
                      child: Image.network(
                        widget.product.imageUrl,
                        fit: BoxFit.fitWidth,
                      ))),
              _favoriteTag()
            ]),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 3),
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text('\$ ${widget.product.price}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Quantity: ${widget.product.quantity} left',
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w800)),
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const FeedProductDialog(),
                                );
                              },
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

  Widget _favoriteTag() {
    return widget.product.isFavourite
        ? Positioned(
            right: 0,
            child: Badge(
              toAnimate: false,
              shape: BadgeShape.square,
              badgeColor: Colors.purple,
              badgeContent:
                  const Text('Favorite', style: TextStyle(color: Colors.white)),
            ),
          )
        : Container();
  }
}
