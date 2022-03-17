import 'package:flutter/material.dart';
import 'package:flutter_shop/products/models/product.dart';
import 'package:provider/provider.dart';

class BrandProductItem extends StatelessWidget {
  const BrandProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return InkWell(
      onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
