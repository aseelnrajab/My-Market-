import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/screens/register_screen.dart';

import '../Routers/app_router.dart';
import '../components/custom_text_field.dart';
import '../providers/auth_provider.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Consumer<AuthProvider>(builder: ((context, provider, x) {
            return Form(
                key: provider.signInKey,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        const Text(
                          'Welcome back !',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'User your account and email to login',
                          style: TextStyle(fontSize: 13),
                        ),
                       const SizedBox(height: 40,),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                            const SizedBox(height: 40,),
                              const Text(
                                'Your email address',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextfield(
                                textInputType: TextInputType.emailAddress,
                                controller: provider.loginEmailController,
                                validation: provider.emailValidation,
                                icon: Icons.person,
                                label: 'example@gmail.com',
                                // saveFun: provider.saveEmail,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Your Password',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextfield(
                                textInputType: TextInputType.visiblePassword,
                                controller: provider.passwordLoginController,
                                validation: provider.passwordValidation,
                                label: 'password',
                                icon: Icons.lock,
                                isPassword: true,
                                // saveFun: provider.savePassword)
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      backgroundColor:
                                         Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  onPressed: () {
                                    provider.signIn();
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(color: Colors.black),
                                  )),
                             const SizedBox(height: 10,),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(30))),
                                  onPressed: () {
                                    AppRouter.appRouter
                                        .goToWidgetAndReplace(SignUpScreen());
                                  },
                                  child: const Text(
                                    'Go to Sign Up Screen',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ]),
















                        // SizedBox(
                        //   height: 90,
                        //   child: Row(
                        //     children: [
                        //      const SizedBox(width: 40,),
                        //       Expanded(
                        //         flex: 2,
                        //         child: Material(
                        //           child: Container(
                        //             color: Colors.white,
                        //             padding: const EdgeInsets.only(
                        //                 left:80, bottom: 20),
                        //             width: double.infinity,
                        //             child: const Text(
                        //               'Sign up',
                        //               style: TextStyle(
                        //                 letterSpacing: 1,
                        //                   fontSize: 15,
                        //                   fontFamily: 'Tajawal',
                        //                   fontWeight: FontWeight.w700,
                        //                   color: Colors.black),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Material(
                        //           child: InkWell(
                        //             onTap: () {
                        //               AppRouter.appRouter
                        //                   .goToWidget(SignUpScreen());
                        //             },
                        //             child: Container(
                        //               color: Colors.white,
                        //               padding: const EdgeInsets.only(
                        //                   right: 120, bottom: 20),
                        //               width: 100,
                        //               child: const Center(
                        //                 child: Text(
                        //                   'Sign up',
                        //                   style: TextStyle(
                        //                       letterSpacing: 1,
                        //                       fontSize: 15,
                        //                       fontFamily: 'Tajawal',
                        //                       fontWeight: FontWeight.w700,
                        //                       color: Colors.black),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ]),
                ));
          }))),

    );
  }
}
