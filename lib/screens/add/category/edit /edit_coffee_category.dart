import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_text_field.dart';
import '../../../../models/categoryy.dart';
import '../../../../providers/admin_provider.dart';

class EditCoffeeCategory extends StatelessWidget {
  Category category;

  EditCoffeeCategory(this.category);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Coffee Category"),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: provider.snackCategoryFormKey,
            child: Column(
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
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.updateCofeeCategory(category);
                    },
                    child: const Text('Update Coffee Category'),
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
