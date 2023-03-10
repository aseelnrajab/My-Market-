import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app2/Routers/app_router.dart';

import '../components/custom_app_bar.dart';
import '../data/iconBarData.dart';
import '../models/Icons/category_icons_bar.dart';

class ExculsiveOffers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('Exclusive Offers'),
        body: Container(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: iconData!.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      // AppRouter.appRouter.goToWidget(path[index]);
                    },
                    child: CategoryIconBar(iconData[index]));
              }),
        ));
  }
}
