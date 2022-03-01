import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  const CartFull({Key? key}) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Container(
        height: 140,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(children: [
          Container(
            width: 140,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-blue-select-2021?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1629842712000'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(
                          "iphone XR",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          onTap: () {},
                          child: const SizedBox(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ]),
                Row(
                  children: const [
                    Text(
                      'Price:',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("500\$",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Subtotal:',
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('500\$',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: themeChange.darkTheme
                              ? Colors.brown.shade900
                              : Theme.of(context).colorScheme.secondary,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Ships free'),
                    const Spacer(),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(32.0),
                        onTap: () {},
                        child: const SizedBox(
                          child: Icon(
                            Entypo.minus,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 12,
                      child: Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          AppColors.gradiendLStart,
                          AppColors.gradiendLEnd
                        ], stops: const [
                          0.0,
                          1.0
                        ])),
                        child: const Text(
                          '1',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(32.0),
                        onTap: () {},
                        child: const SizedBox(
                          child: Icon(
                            Entypo.plus,
                            color: Colors.green,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
