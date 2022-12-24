
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/components/custom_app_bar.dart';
import 'package:social_app2/screens/widgets/cart_widget.dart';

import '../providers/admin_provider.dart';

class Cart extends StatelessWidget {
  // Product product;
  //
  // Cart({required this.product});
  var totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<AdminProvider>(context);
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
      }),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Column(children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                // Future<double> price = provider1.getAllPaymentAnCalculate();
                // totalPrice = price as int;
                // log(totalPrice.toString());
                // AppRouter.appRouter.goToWidget(PaymentScreen((provider1.CartProducts));
              },
              child: const Text(
                'Go To Payment',
                style: TextStyle(fontSize: 20),
              )),
        ]),
      ),
    );
  }
}
