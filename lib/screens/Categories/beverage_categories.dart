import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/Routers/app_router.dart';
import 'package:social_app2/screens/widgets/category_widget.dart';
import '../../components/custom_app_bar.dart';
import '../../providers/admin_provider.dart';
import '../add/add_new_beverage.dart';

class AllBeveragesScreen extends StatelessWidget {
  const AllBeveragesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar('Beverage Categories'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            AppRouter.appRouter.goToWidget(AddNewBeverage());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Consumer<AdminProvider>(builder: (context, provider, w) {
          return provider.allBeverage == null
              ? const Center(
                  child: Text('No Beverage Category Found'),
                )
              : Padding(
            padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    itemCount: provider.allBeverage!.length,
                    itemBuilder: (context, index) {
                      return CategoryWidget(provider.allBeverage![index]);
                    }),
              );
        }));
  }
}
