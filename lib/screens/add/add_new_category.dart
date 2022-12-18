import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Routers/app_router.dart';
import '../../components/custom_text_field.dart';
import '../../providers/admin_provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/bottom_navigation_bar_provider.dart';

class AddNewCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    // TODO: implement build
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text("New Category"),
          leading: InkWell(
              onTap: () {
                AppRouter.appRouter.goToWidget(
                    Provider.of<AuthProvider>(context, listen: false)
                        .signOut());
              },
              child: const Icon(Icons.logout)),
          backgroundColor: Colors.green,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         provider.scaffoldKey.currentState?.openDrawer();
          //       },
          //       icon: const Icon(
          //         Icons.menu,
          //       ))
          // ]
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: provider.categoryFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 180,
                  ),
                  InkWell(
                    onTap: () {
                      provider.pickImageForCategory();
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.grey,
                      child: provider.imageFile == null
                          ? const Center(
                              child: Icon(Icons.camera),
                            )
                          : Image.file(
                              provider.imageFile!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextfield(
                    controller: provider.categoryNameController,
                    label: 'Category name',
                    validation: provider.requiredValidation,
                  ),
                  // const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          provider.addNewCategory();
                        },
                        child: const Text('Add New Category'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
