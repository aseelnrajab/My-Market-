import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_text_field.dart';
import '../../providers/admin_provider.dart';

class AddNewSliderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Add New Slider'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  provider.pickImageForCategory();
                },
                child: Container(
                    height: 200,
                    width: 300,
                    color: Colors.grey,
                    child: provider.imageFile == null
                        ? const Center(
                            child: Icon(Icons.camera),
                          )
                        : Image.file(
                            provider.imageFile!,
                            fit: BoxFit.cover,
                          )),
              ),
              Container(
                margin: const EdgeInsets.all(40),
                child: Column(
                  children: [

                    CustomTextfield(
                      controller: provider.sliderTitleController,
                      label: 'Slider Title',
                      validation: provider.requiredValidation,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextfield(
                      controller: provider.sliderUrlController,
                      label: 'Slider Url',
                      validation: provider.requiredValidation,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            provider.AddNewSlider();
                          },
                          child: const Text('Add New Slider')),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
