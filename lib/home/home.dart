import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter_shop/home/app_carousel.dart';
import 'package:flutter_shop/home/app_swiper.dart';
import 'package:flutter_shop/home/back_layer_menu.dart';
import 'package:flutter_shop/home/category.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropScaffold(
        headerHeight: MediaQuery.of(context).size.height * 0.15,
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: BackdropAppBar(
          title: const Text("Home"),
          leading: const BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
        ),
        stickyFrontLayer: true,
        frontLayer: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const AppCarousel(),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Category",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                const Category(),
                Row(
                  children: [
                    const Text(
                      "Popular Brands",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All...",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
                const AppSwiper(),
              ],
            ),
          ),
        ),
        backLayer: const BlackLayerMenu(),
      ),
    );
  }
}
