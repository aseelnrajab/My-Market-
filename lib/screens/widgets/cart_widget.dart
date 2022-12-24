import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/models/product.dart';

import '../../../providers/admin_provider.dart';

class CartWidget extends StatelessWidget {
  Product product;

  CartWidget(this.product);

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    var provider = Provider.of<AdminProvider>(context);
    return InkWell(
        onTap: () {},
        child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 2)),
            child: Column(
              children: [
                Stack(children: [
                  ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(13)),
                      child: SizedBox(
                        width: double.infinity,
                        height: 170,
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                      right: 15,
                      top: 10,
                      child: Column(children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                provider.removeFromCart(product);
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                      ])),
                ]),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                              ),
                              Row(children: [
                                Text(
                                  'Price' + ': ' + product.price,
                                  style: const TextStyle(color: Colors.red),
                                ),
                                const Text(
                                  '\$',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ])
                            ],
                          ),
                          // const SizedBox(
                          //   width: 210,
                          // ),
                          // Column(children: [
                          //   ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //           padding: const EdgeInsets.symmetric(
                          //               horizontal: 20.0, vertical: 10.0),
                          //           backgroundColor: Colors.green,
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius:
                          //                   BorderRadius.circular(20))),
                          //       onPressed: () {
                          //         AppRouter.appRouter
                          //             .goToWidget(PaymentScreen(product));
                          //       },
                          //       child: const Text('buy')),
                          // ])
                        ])),
              ],
            )));
  }
}
