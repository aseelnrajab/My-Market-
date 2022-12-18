import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Routers/app_router.dart';
import '../../models/categoryy.dart';
import '../../providers/admin_provider.dart';
import '../add/display_all_products.dart';

class CategoryWidget extends StatelessWidget {
  Category category;

  CategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        // Provider.of<AdminProvider>(context, listen: false)
        //     .getAllProducts(category.id!);
        // AppRouter.appRouter.goToWidget(AllProductsScreen());
      },
      child: Container(
        // padding: EdgeInsets.all(1),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black)),
        child: Column(
          children: [
            Stack(
              children: [
                ListTile(
                  iconColor: Colors.black,
                  leading: Image.network(
                    category.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Category' + ': ' + category.name ?? ''),
                  trailing: InkWell(
                      onTap: () {
                        AppRouter.appRouter.goToWidget(AllProductsScreen());
                      }, child: const Icon(Icons.arrow_drop_down)),
                ),

                // Positioned(
                //     right: 15,
                //     top: 10,
                //     child: Column(
                //       children: [
                //         CircleAvatar(
                //           radius: 20,
                //           backgroundColor: Colors.white,
                //           child: IconButton(
                //               onPressed: () {
                //                 Provider.of<AdminProvider>(context,
                //                     listen: false)
                //                     .deleteCategory(category);
                //               },
                //               icon: Icon(Icons.delete)),
                //         ),
                //        const SizedBox(
                //           height: 10,
                //         ),
                //         CircleAvatar(
                //           radius: 20,
                //           backgroundColor: Colors.white,
                //           child: IconButton(
                //               onPressed: () {
                //                 Provider.of<AdminProvider>(context,
                //                     listen: false)
                //                     .goToEditCategoryPage(category);
                //               },
                //               icon: Icon(Icons.edit)),
                //         ),
                //       ],
                //     ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
