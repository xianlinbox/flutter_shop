import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutter_shop/screens/cart.dart';
import 'package:flutter_shop/screens/feeds.dart';
import 'package:flutter_shop/screens/search.dart';
import 'package:flutter_shop/screens/user_info.dart';

import 'home.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/bottomBar';

  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        "page": const Home(),
        "title": "Home"
      },
      {
        "page": const Feeds(),
        "title": "Feeds"
      },
      {
        "page": const Search(),
        "title": "Seach"
      },
      {
        "page": const Cart(),
        "title": "Cart"
      },
      {
        "page": const UserInfo(),
        "title": "Users"
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]["page"] as Widget,
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"] as String),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.purple,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesome5.home),
              label: 'Home',
              tooltip: 'Home'
              ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome5.rss),
              label: 'Feeds',
              tooltip: 'Feeds'
              ),
            BottomNavigationBarItem(
              activeIcon: Icon(null),
              icon: Icon(null),
              label: 'Search',
              tooltip: 'Search'
              ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome5.shopping_cart),
              label: 'Cart',
              tooltip: 'Cart'
              ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome5.user),
              label: 'User',
              tooltip: 'User'
              ),
          ]
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        elevation: 5,
        tooltip: 'Search',
        onPressed: () {
          setState(() {
            _selectedPageIndex = 2;
          });
        },
        child: const Icon(FontAwesome5.search),
        ),
    );
  }
}