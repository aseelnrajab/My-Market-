import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Routers/app_router.dart';
import '../providers/auth_provider.dart';
import '../providers/bottom_navigation_bar_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  late String text;

  CustomAppBar(this.text);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return AppBar(
        title: Text(text),
        leading: InkWell(
            onTap: () {
              AppRouter.appRouter
                  .goToWidget(
                  Provider.of<AuthProvider>(context, listen: false).signOut());
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
        ]);

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
