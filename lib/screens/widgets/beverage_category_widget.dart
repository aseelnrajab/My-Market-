import 'package:flutter/material.dart';

import '../../Routers/app_router.dart';
import '../../models/categoryy.dart';
import '../add/products/display/display_all_beverage_products.dart';

class BeverageCategoryWidget extends StatelessWidget {
  Category category;

  BeverageCategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
                title: Text(category.name ?? ''),
                trailing: InkWell(
                    onTap: () {
                      AppRouter.appRouter
                          .goToWidget(AllBeverageProductsScreen(category.id));
                    },
                    child: const Icon(Icons.arrow_drop_down)),
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
    );
  }
}
