import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/providers/auth_provider.dart';

import 'package:social_app2/screens/home_screen.dart';
import 'package:social_app2/screens/profile/profile.dart';

import '../providers/bottom_navigation_bar_provider.dart';
import 'categories_screen.dart';

class MainScreen extends StatelessWidget {
  var currentTab = [HomeScreen(), AllCategories(), Profile()];
  List HIcon = [Icons.home, Icons.category, Icons.shopping_cart, Icons.person];
  List NIcon = ['Home', 'Category', 'Cart', 'Profile'];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
        key: provider.scaffoldKey,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: currentTab[provider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(HIcon[0]),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(HIcon[1]),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(HIcon[3]),
              label: 'Profile',
            ),
          ],
          currentIndex: provider.currentIndex,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          selectedItemColor: Colors.green,
          onTap: provider.setIndex,
        ));
  }
}
