import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class AppSwiper extends StatelessWidget {
  const AppSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _swiperImages = [
      'https://media.idownloadblog.com/wp-content/uploads/2018/07/Apple-logo-black-and-white.png',
      'https://cdn.vox-cdn.com/thumbor/Pkmq1nm3skO0-j693JTMd7RL0Zk=/0x0:2012x1341/1200x800/filters:focal(0x0:2012x1341)/cdn.vox-cdn.com/uploads/chorus_image/image/47070706/google2.0.0.jpg',
      'http://familysupportivehousing.org/wp-content/uploads/2019/04/microsoft.jpg',
      'https://logos-world.net/wp-content/uploads/2020/08/Burberry-Logo-1999-2018.png',
      'https://blog.logomyway.com/wp-content/uploads/2016/12/gucci-logo-gold.jpg'
    ];

    return SizedBox(
      height: 210,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Swiper(
        onTap: (index) {},
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white,
                child: Image.network(
                  _swiperImages[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
        itemCount: _swiperImages.length,
      ),
    );
  }
}
