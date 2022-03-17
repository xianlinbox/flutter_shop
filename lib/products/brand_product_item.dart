import 'package:flutter/material.dart';
import 'package:flutter_shop/products/models/product.dart';
import 'package:flutter_shop/products/product_detail.dart';
import 'package:provider/provider.dart';

class BrandProductItem extends StatelessWidget {
  const BrandProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetail.routeName,
            arguments: product);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        margin: const EdgeInsets.only(right: 20.0, bottom: 5, top: 18),
        constraints: const BoxConstraints(
            minHeight: 150, minWidth: double.infinity, maxHeight: 180),
        child: Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  image: DecorationImage(image: NetworkImage(product.imageUrl)),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(2, 2), blurRadius: 2)
                  ]),
            )),
            FittedBox(
              child: Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0)
                    ]),
                width: 160,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 4,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context)
                                .textSelectionTheme
                                .selectionColor),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      FittedBox(
                        child: Text('US ${product.price} \$',
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 30.0,
                            )),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(product.category,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 18.0)),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
