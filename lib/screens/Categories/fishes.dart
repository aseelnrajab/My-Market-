import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/Routers/app_router.dart';
import 'package:social_app2/screens/widgets/category_widget.dart';
import '../../components/custom_app_bar.dart';
import '../../providers/admin_provider.dart';
import '../add/add_new_bakeries.dart';
import '../add/add_new_fishes.dart';

class AllFishesCategoryScreen extends StatelessWidget {
  const AllFishesCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('Fishes Categories'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            AppRouter.appRouter.goToWidget(AddNewFishes());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Consumer<AdminProvider>(builder: (context, provider, w) {
          return provider.allFishes == null
              ? const Center(
            child: Text('No Fish Category Found'),
          )
              : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: provider.allFishes!.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(provider.allFishes![index]);
                }),
          );
        }));
  }
}
