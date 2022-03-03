import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter_shop/home/app_carousel.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BackdropScaffold(
          headerHeight: MediaQuery.of(context).size.height * 0.15,
          appBar: BackdropAppBar(
            title: const Text("Home"),
            leading: const BackdropToggleButton(
              icon: AnimatedIcons.home_menu,
            ),
          ),
          stickyFrontLayer: true,
          frontLayer: const AppCarousel(),
          backLayer: BackdropNavigationBackLayer(
            items: const [
              ListTile(title: Text("Widget 1")),
              ListTile(title: Text("Widget 2")),
            ],
            onTap: (int position) => {},
          ),
        ),
      ),
    );
  }
}
