import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Routers/app_router.dart';
import '../../../../providers/admin_provider.dart';
import '../../../widgets/product_widget.dart';
import '../add/add_beverage_product.dart';
import '../add/add_new_fish_product.dart';

class AllFishProductsScreen extends StatelessWidget {
  String? catId;

  //
  AllFishProductsScreen(this.catId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewFishProduct(catId));
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('All Fish Products'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allBakeryProducts == null
            ? const Center(
          child: Text('No Fish Product was added yet!'),
        )
            : ListView.builder(
            itemCount: provider.allFishProducts!.length,
            itemBuilder: (context, index) {
              return ProductWidget(provider.allFishProducts![index]);
            });
      }),
    );
  }
}
// provider.getAllProducts(catId);
