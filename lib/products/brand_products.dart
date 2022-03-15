import 'package:flutter/material.dart';

class BrandProducts extends StatefulWidget {
  const BrandProducts({Key? key}) : super(key: key);
  static const routeName = '/brands';

  @override
  State<BrandProducts> createState() => _BrandProductsState();
}

class _BrandProductsState extends State<BrandProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
                child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                  child: NavigationRail(
                minWidth: 56,
                groupAlignment: 1,
                selectedIndex: 1,
                onDestinationSelected: (index) {
                  print(index);
                },
                labelType: NavigationRailLabelType.all,
                leading: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                            "https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg"),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    selectedIcon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.search),
                    selectedIcon: Icon(Icons.search),
                    label: Text('Search'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    selectedIcon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    selectedIcon: Icon(Icons.person),
                    label: Text('Profile'),
                  ),
                ],
              )),
            ));
          }),
        ],
      ),
    );
  }
}
