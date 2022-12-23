import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_text_field.dart';
import '../../../../providers/admin_provider.dart';

class AddNewSweetProduct extends StatelessWidget {
  String? catId;

  AddNewSweetProduct(this.catId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Sweet Product"),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.keyboard_backspace_outlined)),
        backgroundColor: Colors.green,
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: provider.addSweetProductKey,
            child: SingleChildScrollView(
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
                            log(catId!);
                            provider.addNewSweetProduct(catId!);
                          },
                          child: const Text('Add New Sweet Product'),
                        ),
                      )),
                  // Padding(
                  //     padding: const EdgeInsets.all(50.0),
                  //     child: SizedBox(
                  //       width: double.infinity,
                  //       height: 50,
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 20.0, vertical: 10.0),
                  //             backgroundColor: Colors.green,
                  //             shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(30))),
                  //         onPressed: () {
                  //          AppRouter.appRouter.goToWidget(AllProductsScreen(catId));
                  //
                  //         },
                  //         child: const Text('Display Product'),
                  //       ),
                  //     ))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
