import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

class AppCarousel extends StatefulWidget {
  const AppCarousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<AppCarousel> {
  final List<String> _carouselImages = [
    'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp-spacegray-select-202011_GEO_US?wid=986&hei=980&fmt=jpeg&qlt=80&.v=1632948875000',
    'https://imageio.forbes.com/specials-images/imageserve/5d99ed25793bd50006e9ef76/0x0.jpg?format=jpg&width=1200&fit=bounds',
    'https://consumer-img.huawei.com/content/dam/huawei-cbg-site/common/mkt/pdp/phones/y6p/img/pc/huawei-y6p-kv.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.0,
        width: double.infinity,
        child: Carousel(
          images: [
            Image.network(_carouselImages[0]),
            Image.network(_carouselImages[1]),
            Image.network(_carouselImages[2]),
            Image.network(_carouselImages[3]),
          ],
          dotSize: 4.0,
          dotSpacing: 15.0,
          dotColor: Colors.lightGreenAccent,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.purple.withOpacity(0.5),
          borderRadius: true,
        ));
  }
}
