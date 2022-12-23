import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Routers/app_router.dart';
import '../../../../providers/admin_provider.dart';
import '../../../widgets/product_widget.dart';
import '../add/add_beverage_product.dart';
import '../add/add_new_sweet_product.dart';

class AllSweetProductsScreen extends StatelessWidget {
  String? catId;

  //
  AllSweetProductsScreen(this.catId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewSweetProduct(catId));
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('All Sweet Products'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allSweetProducts == null
            ? const Center(
          child: Text('No Sweet Product was added yet!'),
        )
            : ListView.builder(
            itemCount: provider.allSweetProducts!.length,
            itemBuilder: (context, index) {
              return ProductWidget(provider.allSweetProducts![index]);
            });
      }),
    );
  }
}
// provider.getAllProducts(catId);
