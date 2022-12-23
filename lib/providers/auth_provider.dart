import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:string_validator/string_validator.dart';
import '../Routers/app_router.dart';
import '../auth_helper.dart';
import '../firebase_helper.dart';
import '../models/app_user.dart';
import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import '../storage_helper.dart';

class AuthProvider with ChangeNotifier {
  GlobalKey<FormState> signInKey = GlobalKey();
  GlobalKey<FormState> signUpKey = GlobalKey();
  GlobalKey<FormState> editKey = GlobalKey();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumEditingController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  int selectedIndex = 0;

  AppUser? loggedUser;

  String? emailValidation(String email) {
    if (email == null || email.isEmpty) {
      return "Required field";
    } else if (!(isEmail(email))) {
      return "Incorrect email syntax";
    }
  }

  String? passwordValidation(String password) {
    if (password == null || password.isEmpty) {
      return "Required field";
    } else if (password.length <= 6) {
      return 'Error, the password must be larger than 6 letters';
    }
  }

  String? requiredField(String content) {
    if (content == null || content.isEmpty) {
      return "Required field";
    }
  }

  String? phoneValidation(String content) {
    if (!isNumeric(content)) {
      return "InCorrect phone number syntax";
    }
  }

  signIn() async {
    if (signInKey.currentState!.validate()) {
      signInKey.currentState!.save();
      String? userId = await AuthHelper.authHelper
          .signIn(loginEmailController.text, passwordLoginController.text);
      if (userId != null) {
        loggedUser =
            await FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
        notifyListeners();
        AppRouter.appRouter.goToWidgetAndReplace(MainScreen());
      }
    }
  }

  signUp() async {
    if (signUpKey.currentState!.validate()) {
      String? result = await AuthHelper.authHelper.createAccount(
          registerEmailController.text, passwordRegisterController.text);
      if (result != null) {
        log('hi');
        FirestoreHelper.firestoreHelper.addNewUser(AppUser(
            id: result,
            email: registerEmailController.text,
            userName: userNameController.text,
            phoneNumber: phoneNumEditingController.text));
        AppRouter.appRouter.goToWidgetAndReplace(MainScreen());
      }
    }
  }

  updateUser() async {
    log('Arrived!');
    if (editKey.currentState!.validate()) {
      editKey.currentState!.save();
      String? userId = AuthHelper.authHelper.checkUser();
      FirestoreHelper.firestoreHelper.updateTheUser(AppUser(
          id: userId,
          email: registerEmailController.text,
          userName: userNameController.text,
          phoneNumber: phoneNumEditingController.text));
      AppRouter.appRouter.goToWidgetAndReplace(MainScreen());
    }
  }

  signOut() {
    AuthHelper.authHelper.signOut();
    AppRouter.appRouter.goToWidgetAndReplace(SignInScreen());
  }

  checkUser() async {
    String? userId = AuthHelper.authHelper.checkUser();

    if (userId != null) {
      getUser(userId);
      AppRouter.appRouter.goToWidgetAndReplace(MainScreen());
    } else {
      AppRouter.appRouter.goToWidgetAndReplace(SignInScreen());
    }
  }

  getUser(String id) async {
    loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFirestore(id);
    loggedUser!.id = id;
    notifyListeners();
  }

  uploadNewFile() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    File file = File(pickedFile!.path);
    String imageUrl =
        await StorageHelper.storageHelper.uploadNewImage('user_images', file);

    loggedUser!.imageUrl = imageUrl;

    await FirestoreHelper.firestoreHelper.updateTheUser(loggedUser!);
    getUser(loggedUser!.id!);
  }
}
