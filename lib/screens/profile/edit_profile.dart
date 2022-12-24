import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/components/custom_app_bar.dart';
import '../../components/custom_text_field.dart';
import '../../providers/auth_provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('Edit My Profile!'),
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Consumer<AuthProvider>(builder: ((context, provider, x) {
              return Form(
                  key: provider.editKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Your Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextfield(
                        validation: provider.requiredField,
                        label: 'Aseel',
                        icon: Icons.text_format,
                        // saveFun: provider.saveEmail,
                        controller: provider.userNameController,
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Your Phone Number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextfield(
                          validation: provider.phoneValidation,
                          label: '059226587',
                          icon: Icons.phone,
                          textInputType: TextInputType.phone,
                          // saveFun: provider.saveEmail,
                          controller: provider.phoneNumEditingController),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextfield(
                        textInputType: TextInputType.visiblePassword,
                        validation: provider.passwordValidation,
                        label: 'password',
                        icon: Icons.lock,
                        // saveFun: provider.savePassword,
                        controller: provider.passwordRegisterController,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 15.0),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            provider.updateUser();
                          },
                          child: const Text(
                            'Update your information',
                            style: TextStyle(color: Colors.white,letterSpacing: 1, fontSize: 15),
                          )),
                    ],
                  ));
            }))));
  }
}
