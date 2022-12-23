import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Routers/app_router.dart';
import '../../../../providers/admin_provider.dart';
import '../../../widgets/product_widget.dart';
import '../add/add_beverage_product.dart';

class AllBeverageProductsScreen extends StatelessWidget {
  String? catId;

  //
  AllBeverageProductsScreen(this.catId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewBeverageProduct(catId));
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('All Beverage Products'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allBeverageProducts == null
            ? const Center(
                child: Text('No Beverage Product was added yet!'),
              )
            : ListView.builder(
                itemCount: provider.allBeverageProducts!.length,
                itemBuilder: (context, index) {
                  return ProductWidget(provider.allBeverageProducts![index]);
                });
      }),
    );
  }
}
// provider.getAllProducts(catId);
