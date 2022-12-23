import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Routers/app_router.dart';
import '../../../../providers/admin_provider.dart';
import '../../../widgets/product_widget.dart';
import '../add/add_beverage_product.dart';
import '../add/add_new_bakery_products.dart';
class AllBakeryProductsScreen extends StatelessWidget {
  String? catId;

  //
  AllBakeryProductsScreen(this.catId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewBakeryProduct(catId));
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('All Bakery Products'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allBakeryProducts == null
            ? const Center(
          child: Text('No Bakery Product was added yet!'),
        )
            : ListView.builder(
            itemCount: provider.allBakeryProducts!.length,
            itemBuilder: (context, index) {
              return ProductWidget(provider.allBakeryProducts![index]);
            });
      }),
    );
  }
}
// provider.getAllProducts(catId);
