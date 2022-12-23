import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Routers/app_router.dart';
import '../../../../providers/admin_provider.dart';
import '../../../widgets/product_widget.dart';
import '../add/add_new_sncak_product.dart';

class AllSnacksProductsScreen extends StatelessWidget {
  String? catId;

  //
  AllSnacksProductsScreen(this.catId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewSnackProduct(catId));
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('All Snack Products'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allSnackProducts == null
            ? const Center(
          child: Text('No Snack Product was added yet!'),
        )
            : ListView.builder(
            itemCount: provider.allSnackProducts!.length,
            itemBuilder: (context, index) {
              return ProductWidget(provider.allSnackProducts![index]);
            });
      }),
    );
  }
}
// provider.getAllProducts(catId);
