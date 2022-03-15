import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/models/brand.dart';

class BrandProvider with ChangeNotifier {
  final List<Brand> _brands = [
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
        name: 'lululemon',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Lululemon_Athletica_logo.svg/1200px-Lululemon_Athletica_logo.svg.png'),
    Brand(
        name: 'google',
        image:
            'https://cdn.vox-cdn.com/thumbor/Pkmq1nm3skO0-j693JTMd7RL0Zk=/0x0:2012x1341/1200x800/filters:focal(0x0:2012x1341)/cdn.vox-cdn.com/uploads/chorus_image/image/47070706/google2.0.0.jpg'),
  ];

  List<Brand> get brands => _brands;
}
