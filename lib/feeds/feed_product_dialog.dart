import 'package:flutter/material.dart';
import 'package:flutter_shop/products/models/product.dart';
import 'package:provider/provider.dart';

class FeedProductDialog extends StatelessWidget {
  const FeedProductDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Image.network(
              product.imageUrl,
            ),
          ),
          Row(children: const [
            Text("name"),
            Spacer(),
            Text("price"),
          ]),
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.3),
                shape: BoxShape.circle),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.grey,
                onTap: () =>
                    Navigator.canPop(context) ? Navigator.pop(context) : null,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.close, size: 28, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
