import 'package:flutter/material.dart';
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
              elevation: 4,
              automaticallyImplyLeading: false,
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Test'),
                background: Image.asset(
                  'lib/assets/images/user_info_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(child: userInfoColumns(context)),
          ],
        ),
        fabButton()
      ]),
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
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Text(title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
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
