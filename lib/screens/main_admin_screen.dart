import 'package:flutter/material.dart';
import 'package:social_app2/screens/categories_screen.dart';
import 'package:social_app2/screens/home_screen.dart';
import 'package:social_app2/screens/register_screen.dart';
import 'package:social_app2/screens/sliders/all_slider.dart';

import '../Routers/app_router.dart';

class MainAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  AppRouter.appRouter.goToWidget(SignUpScreen());
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green),
                  child: const Text(
                    'Go To Categories',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  AppRouter.appRouter.goToWidget(AllSliderScreen());
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green),
                  child:const  Text(
                    'Go To Sliders',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
