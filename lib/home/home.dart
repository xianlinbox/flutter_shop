import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter_shop/home/app_carousel.dart';
import 'package:flutter_shop/home/app_swiper.dart';

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
        frontLayer: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const AppCarousel(),
              Row(
                children: [
                  const Text(
                    "Popular Brands",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
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
        backLayer: BackdropNavigationBackLayer(
          items: const [
            ListTile(title: Text("Widget 1")),
            ListTile(title: Text("Widget 2")),
          ],
          onTap: (int position) => {},
        ),
      ),
    );
  }
}
