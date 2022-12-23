import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Routers/app_router.dart';
import '../../components/custom_app_bar.dart';
import '../../providers/auth_provider.dart';
import '../../providers/bottom_navigation_bar_provider.dart';
import 'edit_profile.dart';
import '../login_screen.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    var provider1 = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text('Profile'),
            leading: InkWell(
                onTap: () {
                  provider1.signOut();
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
        body: Container(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 50),
            color: Colors.grey.shade100,
            alignment: Alignment.center,
            height: double.infinity,
            child: ListView(shrinkWrap: true, children: [
              Column(children: [
                Stack(children: [
                  Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),

                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2017/04/01/21/06/portrait-2194457_960_720.jpg')),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 100),
                    child: InkWell(
                      onTap: () {
                        AppRouter.appRouter.goToWidget(EditProfile());
                      },
                      child: const Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    provider1.loggedUser?.userName ?? '',
                    style: const TextStyle(fontSize: 20, letterSpacing: 1),
                  ),
                )
              ]),

              // Align(
              //   alignment: Alignment.center,
              //   child: Row(mainAxisSize: MainAxisSize.min, children: const [
              //     Text(
              //       'Edit Your Profile',
              //       style: TextStyle(
              //           fontFamily: 'Tajawal',
              //           fontSize: 20,
              //           fontWeight: FontWeight.w300,
              //           color: Colors.black),
              //     ),
              //     SizedBox(width: 10),
              //   ]),
              // )
            ])));
  }
}
