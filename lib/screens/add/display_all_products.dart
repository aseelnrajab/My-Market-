import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Routers/app_router.dart';
import '../../providers/admin_provider.dart';
import '../widgets/product_widget.dart';
import 'add_new_category.dart';

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewCategory());
              },
              icon:const Icon(Icons.add))
        ],
        title: const Text('All Products'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allProducts == null
            ? const Center(
          child: CircularProgressIndicator(),
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
