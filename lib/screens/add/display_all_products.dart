
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/models/categoryy.dart';

import '../../Routers/app_router.dart';
import '../../providers/admin_provider.dart';
import '../widgets/product_widget.dart';
import 'add_product.dart';

class AllProductsScreen extends StatelessWidget {
  Category category;
  //
  AllProductsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewProduct(
                    category.id
                ));
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('All Products'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allProducts == null
            ? const Center(
                child: Text('No Product was added yet!'),
              )
            : ListView.builder(
                itemCount: provider.allProducts!.length,
                itemBuilder: (context, index) {
                  return ProductWidget(provider.allProducts![index]);
                });
      }),
    );
  }
}
