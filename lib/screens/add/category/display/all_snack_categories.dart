import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/Routers/app_router.dart';
import '../../../../components/custom_app_bar.dart';
import '../../../../providers/admin_provider.dart';
import '../../../widgets/snacks_category.dart';
import '../add/add_new_snack.dart';

class AllSnackCategoriesScreen extends StatelessWidget {
  const AllSnackCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('Snack Categories'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            AppRouter.appRouter.goToWidget(AddNewSnack());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Consumer<AdminProvider>(builder: (context, provider, w) {
          return provider.allsnack == null
              ? const Center(
            child: Text('No Snack Category Found'),
          )
              : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: provider.allsnack!.length,
                itemBuilder: (context, index) {
                  return SnacksCategoryWidget(provider.allsnack![index]);
                }),
          );
        }));
  }
}
