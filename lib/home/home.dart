import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        title: 'Backdrop Demo',
        home: BackdropScaffold(
          appBar: BackdropAppBar(
            title: const Text("Navigation Example"),
            actions: <Widget>[
              BackdropToggleButton(
                icon: AnimatedIcons.list_view,
              )
            ],
          ),
          stickyFrontLayer: true,
          frontLayer: const Text("font Alayer"),
          backLayer: BackdropNavigationBackLayer(
            items: [
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
