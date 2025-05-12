import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery/pages/account_page.dart';
import 'package:food_delivery/pages/favorites_page.dart';
import 'package:food_delivery/pages/home_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> with WidgetsBindingObserver{
  int selectedIndex = 0;

  void onItemTapped(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  List<Widget> bodyOptions = const [HomePage(), FavoritesPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    late final PreferredSizeWidget appBar;

    if (Platform.isAndroid) {
      appBar = AppBar(title: Text('Foodak'));
    } else if (Platform.isIOS) {
      appBar = CupertinoNavigationBar(
        middle: const Text('Foodak'),
      );
    } else {
      SizedBox();
    }

    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: bodyOptions[selectedIndex]),
      drawer: const Drawer(child: Center(child: Text('I am in the Drawer'))),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: onItemTapped,
      ),
    );
  }
}
