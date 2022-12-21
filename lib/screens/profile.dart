import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Routers/app_router.dart';
import '../components/custom_app_bar.dart';
import '../providers/auth_provider.dart';
import '../providers/bottom_navigation_bar_provider.dart';
import 'login_screen.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profile'),
          leading: InkWell(
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).signOut();
                AppRouter.appRouter.goToWidget(SignInScreen());
              },
              child: const Icon(Icons.logout)),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
                onPressed: () {
                  provider.scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                ))
          ]),
    );
  }
}
