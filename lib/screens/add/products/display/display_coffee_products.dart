import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Routers/app_router.dart';
import '../../../../providers/admin_provider.dart';
import '../../../widgets/product_widget.dart';
import '../add/add_beverage_product.dart';
import '../add/add_new_cofee_product.dart';

class AllCoffeeProductsScreen extends StatelessWidget {
  String? catId;

  //
  AllCoffeeProductsScreen(this.catId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewCoffeeProduct(catId));
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('All Coffee Products'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allCoffeeProducts == null
            ? const Center(
                child: Text('No Coffe Product was added yet!'),
              )
            : ListView.builder(
                itemCount: provider.allCoffeeProducts!.length,
                itemBuilder: (context, index) {
                  return ProductWidget(provider.allCoffeeProducts![index]);
                });
      }),
    );
  }
}
// provider.getAllProducts(catId);
