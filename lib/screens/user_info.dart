import 'package:flutter/material.dart';
import '../shared/AppIcons.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          title('User Info'),
          userListTile('Email', 'empty', AppIcons.email, context),
          userListTile('Phone Number', '3124589888', AppIcons.phone, context),
          userListTile(
              'Shipping Address', '123 Ave, Tx', AppIcons.shipping, context),
          userListTile('Join Date', 'Dec 12 2021', AppIcons.date, context),
        ],
      ),
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
}
