import 'package:flutter/material.dart';
import 'package:flutter_shop/products/brand_product_item.dart';
import 'package:flutter_shop/products/models/product_filter.dart';
import 'package:flutter_shop/provider/brands_provider.dart';
import 'package:flutter_shop/provider/products_provider.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/models/brand.dart';
import 'package:provider/provider.dart';

class BrandProducts extends StatefulWidget {
  const BrandProducts({Key? key}) : super(key: key);
  static const routeName = '/brands';

  @override
  State<BrandProducts> createState() => _BrandProductsState();
}

class _BrandProductsState extends State<BrandProducts> {
  int _selectedIndex = 1;

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
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
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
                      destinations: [
                    buildRotatedTextRailDestination('All', 8),
                    ..._brands
                        .map((brand) =>
                            buildRotatedTextRailDestination(brand.name, 8))
                        .toList()
                  ])),
            ));
          }),
          _contentSpace(context,
              _selectedIndex == 0 ? 'all' : _brands[_selectedIndex - 1].name),
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

  Widget _contentSpace(BuildContext context, String brand) {
    final productsData = Provider.of<ProductsProvider>(context, listen: false);
    final products =
        productsData.filterProducts(ProductFilter(key: 'brand', value: brand));

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: products.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    AppIcons.database,
                    size: 80,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'No products related to this brand',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: products[index],
                  child: const BrandProductItem(),
                ),
              ),
      ),
    ));
  }
}
