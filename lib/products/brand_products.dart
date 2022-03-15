import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/brands_provider.dart';
import 'package:flutter_shop/shared/models/brand.dart';
import 'package:provider/provider.dart';

class BrandProducts extends StatefulWidget {
  const BrandProducts({Key? key}) : super(key: key);
  static const routeName = '/brands';

  @override
  State<BrandProducts> createState() => _BrandProductsState();
}

class _BrandProductsState extends State<BrandProducts> {
  @override
  Widget build(BuildContext context) {
    final brandsProvider = Provider.of<BrandProvider>(context);
    List<Brand> _brands = brandsProvider.brands;
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands',
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textSelectionTheme.selectionColor,
                fontWeight: FontWeight.w600)),
      ),
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
                      destinations: _brands
                          .map((brand) =>
                              buildRotatedTextRailDestination(brand.name, 8))
                          .toList())),
            ));
          }),
        ],
      ),
    );
  }

  NavigationRailDestination buildRotatedTextRailDestination(
      String text, double padding) {
    return NavigationRailDestination(
      icon: const SizedBox.shrink(),
      label: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(text),
        ),
      ),
    );
  }
}
