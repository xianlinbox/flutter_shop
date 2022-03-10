import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:flutter_shop/shared/models/product.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/product-detail';

  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: _appBar(context),
      body: Stack(children: [
        Container(
          foregroundDecoration: const BoxDecoration(color: Colors.black12),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.35,
          child: Image.network(product.imageUrl),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15, bottom: 20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 225),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _stackButton(Icons.save),
                      _stackButton(Icons.share),
                    ],
                  ),
                ),
                _productInfo(product, themeState)
              ],
            ),
          ),
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

  Widget _stackButton(IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () {},
          splashColor: Colors.purple.shade200,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(icon, size: 23, color: AppColors.white),
          )),
    );
  }

  Widget _productInfo(Product product, DarkThemeProvider themeState) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width * 0.95,
            child: Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$ ${product.price}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: themeState.darkTheme
                  ? Theme.of(context).disabledColor
                  : AppColors.subTitle,
            ),
          ),
          const SizedBox(height: 3.0),
          _divider(),
          Container(
            padding: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.95,
            child: Text(
              product.description,
              maxLines: 4,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 3.0),
          _divider(),
          const SizedBox(height: 10.0),
          _productDetailItem('Category', product.category),
          const SizedBox(height: 3.0),
          _productDetailItem('Brand', product.brand),
          const SizedBox(height: 3.0),
          _productDetailItem('Quanity', '${product.quantity}'),
          const SizedBox(height: 3.0),
          _divider(),
          // Text(
          //   product.description,
          //   maxLines: 4,
          //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          // ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      thickness: 1,
      color: Colors.grey,
      height: 1,
    );
  }

  Widget _productDetailItem(String title, String value) {
    return Row(children: [
      Text(
        '$title:',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
      ),
      const SizedBox(width: 10),
      Text(
        value,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    ]);
  }
}
