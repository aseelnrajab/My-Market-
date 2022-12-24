import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/components/custom_app_bar.dart';
import 'package:social_app2/screens/widgets/cart_widget.dart';

import '../providers/admin_provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Cart'),
        body: Consumer<AdminProvider>(builder: (context, provider, w) {
          return provider.CartProducts == null
              ? const Center(
            child: Text('No Product in car Found'),
          )
              : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: provider.CartProducts!.length,
                itemBuilder: (context, index) {
                  return CartWidget(provider.CartProducts![index]);
                }),
          );
        })
    );
  }
}
