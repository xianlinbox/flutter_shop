import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:provider/provider.dart';

class WishListEmpty extends StatelessWidget {
  const WishListEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.only(top: 100),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/empty-wishlist.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Text('Your Wishlist Is Empty',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textSelectionTheme.selectionColor)),
      const SizedBox(height: 20),
      Text('Explore more and shortlist some items',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: themeChange.darkTheme
                ? Theme.of(context).disabledColor
                : AppColors.subTitle,
          )),
      const SizedBox(height: 20),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.15,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
            primary: Colors.redAccent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          child: Text('Add Now',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textSelectionTheme.selectionColor)),
        ),
      )
    ]);
  }
}
