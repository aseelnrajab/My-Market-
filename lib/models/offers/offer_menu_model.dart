import 'package:flutter/material.dart';
import 'offers_menu.dart';

class OfferModel extends StatelessWidget {
  OffersMenu offersMenu;

  OfferModel(this.offersMenu);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 370,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Image.network(
        offersMenu.imageUrl ?? '',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
