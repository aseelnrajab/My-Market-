import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/models/product.dart';

import '../../../Routers/app_router.dart';
import '../../../models/categoryy.dart';
import '../../../providers/admin_provider.dart';

class CartWidget extends StatelessWidget {
  Product product;

  CartWidget(this.product);

  @override
  Widget build(BuildContext context) {
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
            Stack(
              children: [
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
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                provider.removeFromCart(product);
                              },
                              icon: const Icon(Icons.delete)),
                        ),


                      ],
                    ))
              ],
            ),
            Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Product Name' + ': ' + product.name,
                      ),
                    ])),
          ],
        ),
      ),
    );
  }
}
