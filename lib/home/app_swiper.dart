import 'package:flutter/material.dart';
import 'package:flutter_shop/products/models/product_filter.dart';
import 'package:flutter_shop/products/products.dart';
import 'package:flutter_shop/provider/brands_provider.dart';
import 'package:flutter_shop/shared/models/brand.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';

class AppSwiper extends StatelessWidget {
  const AppSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brandsProvider = Provider.of<BrandProvider>(context);
    List<Brand> _brands = brandsProvider.brands;

    return SizedBox(
      height: 210,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Swiper(
        onTap: (index) {
          Navigator.pushNamed(context, Products.routeName,
              arguments:
                  ProductFilter(key: 'brand', value: _brands[index].name));
        },
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white,
                child: Image.network(
                  _brands[index].image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
        itemCount: _brands.length,
      ),
    );
  }
}
