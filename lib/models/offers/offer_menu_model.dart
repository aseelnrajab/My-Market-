import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'offers_menu.dart';

class OfferMenuModel extends StatelessWidget {
  // const SideBarModel({Key? key}) : super(key: key);
  OffersMenu offersMenu;

  OfferMenuModel(this.offersMenu);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width:370,
      child: Image.network(
        offersMenu.path!,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
