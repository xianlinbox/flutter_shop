import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/cart.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/feeds/feeds.dart';
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
      {"page": const Home(), "title": "Home"},
      {"page": const Feeds(), "title": "Feeds"},
      {"page": const Search(), "title": "Seach"},
      {"page": const Cart(), "title": "Cart"},
      {"page": const UserInfo(), "title": "Users"}
    ];
    super.initState();
  }

  int _selectedPageIndex = 1;

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomAppBar(
          notchMargin: 3,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
                currentIndex: _selectedPageIndex,
                onTap: selectPage,
                backgroundColor: Theme.of(context).primaryColor,
                selectedItemColor: Colors.purple,
                unselectedItemColor:
                    Theme.of(context).textSelectionTheme.selectionColor,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(AppIcons.home),
                      label: 'Home',
                      tooltip: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(AppIcons.feeds),
                      label: 'Feeds',
                      tooltip: 'Feeds'),
                  const BottomNavigationBarItem(
                      activeIcon: null,
                      icon: Icon(null),
                      label: 'Search',
                      tooltip: 'Search'),
                  BottomNavigationBarItem(
                      icon: Icon(AppIcons.cart),
                      label: 'Cart',
                      tooltip: 'Cart'),
                  BottomNavigationBarItem(
                      icon: Icon(AppIcons.user),
                      label: 'User',
                      tooltip: 'User'),
                ]),
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        elevation: 5,
        tooltip: 'Search',
        onPressed: () {
          setState(() {
            _selectedPageIndex = 2;
          });
        },
        child: Icon(AppIcons.search),
      ),
    );
  }
}
