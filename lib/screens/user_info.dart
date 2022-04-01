import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import '../shared/app_icons.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  UserInfoState createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo> {
  late ScrollController _scrollViewController;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          controller: _scrollViewController,
          slivers: [
            SliverAppBar(
              elevation: 0,
              expandedHeight: 200,
              pinned: true,
              flexibleSpace:
                  LayoutBuilder(builder: sliverAppBarFlexSpaceBuilder),
            ),
            SliverToBoxAdapter(child: userInfoColumns(context)),
          ],
        ),
        fabButton()
      ]),
    );
  }

  Widget sliverAppBarFlexSpaceBuilder(
      BuildContext context, BoxConstraints constraints) {
    var top = constraints.biggest.height;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.starterColor,
              AppColors.endColor,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: FlexibleSpaceBar(
        centerTitle: true,
        title: AnimatedOpacity(
          opacity: top <= 110 ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Container(
                height: kToolbarHeight / 1.8,
                width: kToolbarHeight / 1.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: AppColors.white, blurRadius: 1.0),
                  ],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text('Guest',
                  style: TextStyle(fontSize: 20, color: AppColors.white)),
            ],
          ),
        ),
        background: const Image(
            image: NetworkImage(
                'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
            fit: BoxFit.fill),
      ),
    );
  }

  Widget fabButton() {
    const double defaulTopMargin = 220;
    const double scaleStart = 160;
    const double scaleEnd = scaleStart / 2;

    double top = defaulTopMargin;
    double scale = 1;

    if (_scrollViewController.hasClients) {
      double offset = _scrollViewController.offset;
      top -= offset;
      if (offset < defaulTopMargin - scaleStart) {
        scale = 1.0;
      } else if (offset < defaulTopMargin - scaleEnd) {
        scale = (defaulTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0;
      }
    }
    return Positioned(
        top: top,
        right: 16,
        child: Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: FloatingActionButton(
              heroTag: 'user_info_fab',
              onPressed: () {},
              backgroundColor: Colors.purple,
              child: Icon(AppIcons.camera)),
        ));
  }

  Widget userInfoColumns(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        title('User Bag'),
        userBagTile(
          'Wishlist',
          AppIcons.wishlist,
          () {
            Navigator.pushNamed(context, '/wishlist');
          },
          context,
        ),
        userBagTile(
          'Cart',
          AppIcons.cart,
          () {
            Navigator.pushNamed(context, '/cart');
          },
          context,
        ),
        title('User Info'),
        userListTile('Email', 'empty', AppIcons.email, context),
        userListTile('Phone Number', '3124589888', AppIcons.phone, context),
        userListTile(
            'Shipping Address', '123 Ave, Tx', AppIcons.shipping, context),
        title('User Settings'),
        userListTileSwitch(
            'Dark Mode', themeChange.darkTheme, AppIcons.darkMode, (value) {
          setState(() {
            themeChange.darkTheme = value;
          });
        }),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Theme.of(context).splashColor,
            child: ListTile(
              onTap: () async {
                // Navigator.canPop(context)? Navigator.pop(context):null;
                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: Icon(AppIcons.alert, color: Colors.red)),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Sign out'),
                            ),
                          ],
                        ),
                        content: const Text('Do you wanna Sign out?'),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                await _auth
                                    .signOut()
                                    .then((value) => Navigator.pop(context));
                              },
                              child: const Text(
                                'Ok',
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      );
                    });
              },
              title: const Text('Logout'),
              leading: Icon(AppIcons.logout),
            ),
          ),
        ),
      ],
    );
  }

  Widget title(String title) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold))),
          Divider(
            thickness: 1,
            color: AppColors.grey,
          ),
        ]);
  }

  Widget userListTile(
      String title, String subtitle, IconData icon, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: Text(subtitle),
          onTap: () {},
        ),
      ),
    );
  }

  Widget userBagTile(
      String title, IconData icon, Function onClick, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () {
            onClick();
          },
        ),
      ),
    );
  }

  Widget userListTileSwitch(
      String title, bool value, IconData icon, Function(bool) onChange) {
    return ListTileSwitch(
      value: value,
      leading: Icon(icon),
      onChanged: onChange,
      switchActiveColor: Colors.indigo,
      visualDensity: VisualDensity.comfortable,
      switchType: SwitchType.cupertino,
      title: Text(title),
    );
  }
}
