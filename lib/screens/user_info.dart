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
                title: Text(''),
                background: Image.asset(
                  'assets/images/user_info_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(child: userInfoColumns(context))
          ],
        )
      ]),
    );
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
