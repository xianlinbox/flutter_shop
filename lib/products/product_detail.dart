import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:flutter_shop/shared/models/product.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/product-detail';

  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: _appBar(context),
      body: Stack(children: [
        Container(
          foregroundDecoration: BoxDecoration(color: Colors.black12),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.35,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: const Text('Product Detail'),
        ),
      ]),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text('Detail',
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontWeight: FontWeight.w600)),
      actions: [
        IconButton(
          icon: Icon(AppIcons.wishlist),
          color: AppColors.favColor,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(AppIcons.cart),
          color: AppColors.cartColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
