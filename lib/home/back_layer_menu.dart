import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';

class BlackLayerMenu extends StatelessWidget {
  const BlackLayerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _menuItems = [
      {
        "name": "Feeds",
        "icon": AppIcons.feeds,
        "routerName": "/feeds",
      },
      {
        "name": "Carts",
        "icon": AppIcons.cart,
        "routerName": "/cart",
      },
      {
        "name": "Wishlist",
        "icon": AppIcons.wishlist,
        "routerName": "/wishlist",
      },
      {
        "name": "Upload a new product",
        "icon": AppIcons.upload,
        "routerName": "/upload_product",
      },
    ];
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.starterColor, AppColors.endColor],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: 140,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: 40,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 140,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 40,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _menuItem(context, _menuItems[0]['name'], _menuItems[0]['icon'],
                    _menuItems[0]['routerName']),
                _menuItem(context, _menuItems[1]['name'], _menuItems[1]['icon'],
                    _menuItems[0]['routerName']),
                _menuItem(context, _menuItems[2]['name'], _menuItems[2]['icon'],
                    _menuItems[0]['routerName']),
                _menuItem(context, _menuItems[3]['name'], _menuItems[3]['icon'],
                    _menuItems[0]['routerName']),
              ],
            ),
          ),
        )
      ],
    );
  }

  void navigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  Widget _menuItem(
      BuildContext context, String title, IconData icon, String routerName) {
    return InkWell(
        onTap: () {
          navigateTo(context, routerName);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.black),
              const SizedBox(width: 10),
              Text(title, style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ));
  }
}
