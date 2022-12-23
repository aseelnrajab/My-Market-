import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/Routers/app_router.dart';
import 'package:social_app2/screens/widgets/beverage_category_widget.dart';

import '../../../../components/custom_app_bar.dart';
import '../../../../providers/admin_provider.dart';
import '../../../widgets/sweet_category_widget.dart';
import '../add/add_new_sweet.dart';


class AllSweetsCategoryScreen extends StatelessWidget {
  const AllSweetsCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('Sweets Categories'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            AppRouter.appRouter.goToWidget(AddNewSweet());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Consumer<AdminProvider>(builder: (context, provider, w) {
          return provider.allSweets == null
              ? const Center(
            child: Text('No Sweet Category Found'),
          )
              : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: provider.allSweets!.length,
                itemBuilder: (context, index) {
                  return SweetCategoryWidget(provider.allSweets![index]);
                }),
          );
        }));
  }
}
