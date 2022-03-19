import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/cart_screen.dart';
import 'package:flutter_shop/products/product_item.dart';
import 'package:flutter_shop/provider/cart_provider.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/provider/products_provider.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:flutter_shop/products/models/product.dart';
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
    final cartProvider = Provider.of<CartProvider>(context);
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
              _productInfo(context, product, themeState)
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(children: [
              Expanded(
                  child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: cartProvider.inCart(product)
                      ? () {}
                      : () {
                          cartProvider.addItem(product);
                        },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.redAccent.shade400),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(side: BorderSide.none)),
                  ),
                  child: Text(
                    cartProvider.inCart(product) ? 'In Cart' : 'Add to Cart',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).backgroundColor,
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(side: BorderSide.none)),
                  ),
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context)
                            .textSelectionTheme
                            .selectionColor),
                  ),
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.subTitle),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(side: BorderSide.none)),
                  ),
                  child: const Text(
                    'Add to Wishlist',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )),
            ]),
          ),
        )
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
          onPressed: () {
            Navigator.pushNamed(context, CartScreen.routeName);
          },
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

  Widget _productInfo(
      BuildContext context, Product product, DarkThemeProvider themeState) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final List _products = productsProvider.products;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.95,
              child: Text(
                product.name,
                maxLines: 2,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Text(
              '\$ ${product.price}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: themeState.darkTheme
                    ? Theme.of(context).disabledColor
                    : AppColors.subTitle,
              ),
            ),
          ),
          _divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.95,
              child: Text(
                product.description,
                maxLines: 4,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          _divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              children: [
                _productDetailItem('Category', product.category),
                const SizedBox(height: 3.0),
                _productDetailItem('Brand', product.brand),
                const SizedBox(height: 3.0),
                _productDetailItem('Quanity', '${product.quantity}'),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            height: 1,
          ),
          Container(
            color: Theme.of(context).backgroundColor,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'No reviews yet',
                    style: TextStyle(
                        color:
                            Theme.of(context).textSelectionTheme.selectionColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Be the first review!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: themeState.darkTheme
                          ? Theme.of(context).disabledColor
                          : AppColors.subTitle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                  height: 1,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Text(
                    'Suggested products:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 340,
                  child: ListView.builder(
                    itemCount: _products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                          width: 200,
                          height: 200,
                          padding: const EdgeInsets.only(left: 4.0),
                          child: ProductItem(product: _products[index]));
                    },
                  ),
                ),
              ],
            ),
          )
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
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Divider(
        thickness: 1,
        color: Colors.grey,
        height: 1,
      ),
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
