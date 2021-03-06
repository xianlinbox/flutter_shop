import 'package:flutter/material.dart';
import 'package:flutter_shop/feeds/feeds.dart';
import 'package:flutter_shop/screens/app.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/emptycart.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Text('Your Cart Is Empty',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textSelectionTheme.selectionColor)),
      const SizedBox(height: 20),
      Text('Looks like you didn\'t add anything to your cart yet.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).disabledColor)),
      const SizedBox(height: 20),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.15,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Feeds.routeName);
          },
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
            primary: Colors.redAccent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          child: Text('Shopping Now',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textSelectionTheme.selectionColor)),
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.15,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => const App(),
              ),
              (route) => false,
            );
          },
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
            primary: Colors.redAccent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          child: Text('Back to Home',
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
