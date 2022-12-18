import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/Routers/app_router.dart';
import 'package:social_app2/screens/widgets/category_widget.dart';

import '../providers/admin_provider.dart';
import 'add/add_new_category.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            AppRouter.appRouter.goToWidget(AddNewCategory());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Consumer<AdminProvider>(builder: (context, provider, w) {
          return provider.allCategories == null
              ? const Center(
                  child: Text('No Categories Found'),
                )
              : ListView.builder(
                  itemCount: provider.allCategories!.length,
                  itemBuilder: (context, index) {
                    return CategoryWidget(provider.allCategories![index]);
                  });
        }));
  }
}
