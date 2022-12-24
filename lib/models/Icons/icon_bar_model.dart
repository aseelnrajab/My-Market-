import 'package:flutter/material.dart';

import 'icons_bar.dart';

class IconBarModel extends StatelessWidget {
  // const SideBarModel({Key? key}) : super(key: key);
  IconBar iconBar;


  IconBarModel(this.iconBar);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        child: Column(children: [
          Icon(iconBar.iconData, color: Colors.green,size: 40,),
          const SizedBox( height: 15,),
          Text(iconBar.name ?? '', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, ),),
        ]),
      ),
    );
  }
}
