import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/Routers/app_router.dart';
import 'package:social_app2/screens/add/add_new_baby_care.dart';
import 'package:social_app2/screens/widgets/category_widget.dart';
import '../../components/custom_app_bar.dart';
import '../../providers/admin_provider.dart';
import '../add/add_new_beverage.dart';

class AllBabyCareCategoriesScreen extends StatelessWidget {
  const AllBabyCareCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('Baby Care Categories'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            AppRouter.appRouter.goToWidget(AddNewBabyCare());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Consumer<AdminProvider>(builder: (context, provider, w) {
          return provider.allBabyCare == null
              ? const Center(
            child: Text('No Baby Care Category Found'),
          )
              : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: provider.allBabyCare!.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(provider.allBabyCare![index]);
                }),
          );
        }));
  }
}
