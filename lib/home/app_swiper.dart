import 'package:flutter/material.dart';
import 'package:flutter_shop/products/models/product_filter.dart';
import 'package:flutter_shop/products/products.dart';
import 'package:flutter_shop/shared/models/brand.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class AppSwiper extends StatelessWidget {
  const AppSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Brand> _brands = [
      Brand(
          name: 'apple',
          image:
              'https://media.idownloadblog.com/wp-content/uploads/2018/07/Apple-logo-black-and-white.png'),
      Brand(
          name: 'microsoft',
          image:
              'http://familysupportivehousing.org/wp-content/uploads/2019/04/microsoft.jpg'),
      Brand(
          name: 'burberry',
          image:
              'https://logos-world.net/wp-content/uploads/2020/08/Burberry-Logo-1999-2018.png'),
      Brand(
          name: 'gucci',
          image:
              'https://blog.logomyway.com/wp-content/uploads/2016/12/gucci-logo-gold.jpg'),
      Brand(
          name: 'google',
          image:
              'https://cdn.vox-cdn.com/thumbor/Pkmq1nm3skO0-j693JTMd7RL0Zk=/0x0:2012x1341/1200x800/filters:focal(0x0:2012x1341)/cdn.vox-cdn.com/uploads/chorus_image/image/47070706/google2.0.0.jpg'),
    ];

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
