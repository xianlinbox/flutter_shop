import 'package:flutter/material.dart';
import 'package:flutter_shop/products/models/product.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';
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
            constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height * 0.5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Image.network(
              product.imageUrl,
            ),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(children: [
              _dialogButton(context, AppIcons.wishlist, 'Add to wishlist'),
              _dialogButton(context, AppIcons.view, 'View Details'),
              _dialogButton(context, AppIcons.cart, 'Add to cart'),
            ]),
          ),
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

  Widget _dialogButton(BuildContext context, IconData icon, String title) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return FittedBox(
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.grey,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25,
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                    child: ClipOval(
                        child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        icon,
                        color:
                            Theme.of(context).textSelectionTheme.selectionColor,
                        size: 25,
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FittedBox(
                      child: Text(
                        title,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: themeChange.darkTheme
                              ? Theme.of(context).disabledColor
                              : AppColors.subTitle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
