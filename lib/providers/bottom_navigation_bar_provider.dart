import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 0;
  List appBarTitle = [
    'Home', 'Categories',
    // 'Cart',
    'Profile'
  ];

  // currentIndex => _currentIndex;

  setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
