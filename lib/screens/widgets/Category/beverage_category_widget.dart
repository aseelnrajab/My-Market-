import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Routers/app_router.dart';
import '../../../models/categoryy.dart';
import '../../../providers/admin_provider.dart';
import '../../add/products/display/display_all_beverage_products.dart';
import '../../add/category/edit /edit_beverage_category.dart';

class BeverageCategoryWidget extends StatelessWidget {
  Category category;

  BeverageCategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AdminProvider>(context);
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 2)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(13)),
                    child: SizedBox(
                      width: double.infinity,
                      height: 170,
                      child: Image.network(
                        category.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )),
                Positioned(
                    right: 15,
                    top: 10,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                provider.deleteBeverageCategory(category);
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                AppRouter.appRouter
                                    .goToWidget(EditBeverageCategory(category));
                              },
                              icon: const Icon(Icons.edit)),
                        ),
                      ],
                    ))
              ],
            ),
            Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Category Name' + ': ' + category.name,
                      ),
                      const SizedBox(
                        width: 140,
                      ),
                      InkWell(
                          onTap: () {
                            AppRouter.appRouter.goToWidget(
                                AllBeverageProductsScreen(category.id));
                          },
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                            size: 40,
                          )),
                    ])),
          ],
        ),
      ),
    );
  }
}
