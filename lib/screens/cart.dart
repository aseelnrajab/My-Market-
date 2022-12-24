import 'package:flutter/material.dart';
import 'package:social_app2/components/custom_app_bar.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Cart'),
    );
  }
}
