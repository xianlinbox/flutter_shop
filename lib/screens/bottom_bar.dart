import 'package:flutter/material.dart';
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
  final List _pages = [
    const Home(),
    const Feeds(),
    const Search(),
    const Cart(),
    const UserInfo()    
  ];
  int _selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.purple,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              tooltip: 'Home'
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed),
              label: 'Feeds',
              tooltip: 'Feeds'
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              tooltip: 'Search'
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              tooltip: 'Cart'
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
              tooltip: 'User'
              ),
          ]
          ),
      )
    );
  }
}