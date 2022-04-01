import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/cart_screen.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/feeds/feeds.dart';
import 'package:flutter_shop/screens/search.dart';
import 'package:flutter_shop/screens/user_info.dart';

import '../home/home.dart';

class Main extends StatefulWidget {
  static const routeName = '/app';

  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {"page": const Home(), "title": "Home"},
      {"page": const Feeds(), "title": "Feeds"},
      {"page": const Search(), "title": "Seach"},
      {"page": const CartScreen(), "title": "Cart"},
      {"page": const UserInfo(), "title": "Users"}
    ];
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
