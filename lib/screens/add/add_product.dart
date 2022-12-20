import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Routers/app_router.dart';
import '../../components/custom_text_field.dart';
import '../../providers/admin_provider.dart';
import '../../providers/auth_provider.dart';

class AddNewProduct extends StatelessWidget {
  String? catId;

  AddNewProduct(this.catId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Product"),
        leading: InkWell(
            onTap: () {
              AppRouter.appRouter.goToWidget(
                  Provider.of<AuthProvider>(context, listen: false).signOut());
            },
            child: const Icon(Icons.logout)),
        backgroundColor: Colors.green,
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: provider.addProductKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
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
                  controller: provider.productNameController,
                  label: 'Product name',
                  validation: provider.requiredValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfield(
                  controller: provider.productDescriptionController,
                  label: 'Product Description',
                  validation: provider.requiredValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfield(
                  controller: provider.productPriceController,
                  label: 'Product Price',
                  validation: provider.requiredValidation,
                ),
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
                          provider.addNewProduct(catId!);
                        },
                        child: const Text('Add New Product'),
                      ),
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
