import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import '../shared/AppIcons.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  UserInfoState createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo> {
  bool _isDarkMode = false;
  late ScrollController _scrollViewController;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        title('User Info'),
        userListTile('Email', 'empty', AppIcons.email, context),
        userListTile('Phone Number', '3124589888', AppIcons.phone, context),
        userListTile(
            'Shipping Address', '123 Ave, Tx', AppIcons.shipping, context),
        userListTile('Join Date', 'Dec 12 2021', AppIcons.date, context),
        title('User Info'),
        userListTile('Email', 'empty', AppIcons.email, context),
        userListTile('Phone Number', '3124589888', AppIcons.phone, context),
        userListTile(
            'Shipping Address', '123 Ave, Tx', AppIcons.shipping, context),
        userListTile('Join Date', 'Dec 12 2021', AppIcons.date, context),
        title('User Info'),
        userListTile('Email', 'empty', AppIcons.email, context),
        userListTile('Phone Number', '3124589888', AppIcons.phone, context),
        userListTile(
            'Shipping Address', '123 Ave, Tx', AppIcons.shipping, context),
        userListTile('Join Date', 'Dec 12 2021', AppIcons.date, context),
        title('User Settings'),
        userListTileSwitch('Dark Mode', AppIcons.darkMode),
      ],
    );
  }

  Widget title(String title) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.all(8),
          child: Text(title,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
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

  Widget userListTileSwitch(String title, IconData icon) {
    return ListTileSwitch(
      value: _isDarkMode,
      leading: Icon(icon),
      onChanged: (value) {
        setState(() {
          _isDarkMode = value;
        });
      },
      switchActiveColor: Colors.indigo,
      title: Text(title),
    );
  }
}
