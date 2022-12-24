import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/Routers/app_router.dart';
import '../../../../components/custom_app_bar.dart';
import '../../../../providers/admin_provider.dart';
import '../../../widgets/Category/coffee_category_widget.dart';
import '../add/add_new_coffee.dart';

class AlCoffeeCategoryScreen extends StatelessWidget {
  const AlCoffeeCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('Coffee Categories'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            AppRouter.appRouter.goToWidget(AddNewCoffee());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Consumer<AdminProvider>(builder: (context, provider, w) {
          return provider.allCoffee == null
              ? const Center(
            child: Text('No Coffee Category Found'),
          )
              : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: provider.allCoffee!.length,
                itemBuilder: (context, index) {
                  return CoffeeCategoryWidget(provider.allCoffee![index]);
                }),
          );
        }));
  }
}
