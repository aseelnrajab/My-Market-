import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_text_field.dart';
import '../../../../models/categoryy.dart';
import '../../../../providers/admin_provider.dart';

class EditSnackCategory extends StatelessWidget {
  Category category;

  EditSnackCategory(this.category);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,

        title: const Text("Update Snack Category"),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: provider.snackCategoryFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const SizedBox(
                  height: 30,
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
                        ? Image.network(
                      category.imageUrl,
                      fit: BoxFit.cover,
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
                const SizedBox(height: 30,),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(30))),
                    onPressed: () {
                      provider.updateSnackCategory(category);
                    },
                    child: const Text('Update Snack Category'),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
