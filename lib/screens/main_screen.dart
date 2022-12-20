import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:social_app2/screens/Home.dart';
import 'package:social_app2/screens/profile.dart';

import '../providers/bottom_navigation_bar_provider.dart';
import 'categories.dart';

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
        drawer: Drawer(
          backgroundColor: Colors.green,
          child: ListView(children: [
            const SizedBox(
              height: 50,
            ),
            DrawerHeader(
                child: Column(
              children: const [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 70,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Ultimate Shopping',
                  style: TextStyle(color: Colors.white, letterSpacing: 2),
                )
              ],
            )),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              leading: Icon(HIcon[0]),
              trailing: const Icon(Icons.arrow_forward),
              title: Text(NIcon[0]),
              onTap: () {
                currentTab[provider.currentIndex];
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              leading: Icon(HIcon[1]),
              title: Text(NIcon[1]),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                currentTab[provider.currentIndex];
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              leading: Icon(HIcon[2]),
              title: Text(NIcon[2]),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                currentTab[provider.currentIndex];
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              leading: Icon(HIcon[3]),
              title: Text(NIcon[3]),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                currentTab[provider.currentIndex];
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              leading: const Icon(Icons.contact_support),
              title: const Text('Contact Us'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                currentTab[provider.currentIndex];
              },
            ),
          ]),
        ),
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
