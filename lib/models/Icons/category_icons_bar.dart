import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app2/Routers/app_router.dart';

import '../../screens/beverage_categories.dart';
import 'icons_bar.dart';

class CategoryIconBar extends StatelessWidget {
  // const SideBarModel({Key? key}) : super(key: key);
  IconBar iconBar;

  CategoryIconBar(this.iconBar);
  


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.all(20),
      child: ListTile(
        title: Text(
          iconBar.name ?? '',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(
          iconBar.iconData,
          color: Colors.green,
          size: 40,
        ),
        trailing: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}
