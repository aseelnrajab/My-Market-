import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../Routers/app_router.dart';
import '../firebase_helper.dart';
import '../models/categoryy.dart';
import '../models/product.dart';
import '../storage_helper.dart';

class AdminProvider extends ChangeNotifier {
  AdminProvider() {
    getAllCategories();
    // getAllSliders();
  }
  String? requiredValidation(String? content) {
    if (content == null || content.isEmpty) {
      return "Required field";
    }
  }
  TextEditingController categoryNameController = TextEditingController();
  GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();
  File? imageFile;
  List<Category>? allCategories;
  List<Product>? allProducts;

  getAllCategories() async {
    allCategories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  // add new category
  pickImageForCategory() async {
    XFile? pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  addNewCategory() async {
    if (imageFile != null) {
      if (categoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("cats_images", imageFile!);
        Category category = Category(
            imageUrl: imageUrl,
            name: categoryNameController.text,
        );
        String? id =
        await FirestoreHelper.firestoreHelper.addNewCategory(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allCategories?.add(category);
          notifyListeners();
          categoryNameController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialog('Success', 'Your category has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialog('Error', 'You have to pick image first');
    }
  }
//////////////////////
//   delete category
  deleteCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
    await FirestoreHelper.firestoreHelper.deleteCategoey(category.id!);
    if (deleteSuccess) {
      allCategories!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  goToEditCategoryPage(Category category) {
    categoryNameController.text = category.name;
    // AppRouter.appRouter.goToWidget(EditCategory(category));
  }

  updateCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("cats_images", imageFile!);
      category.imageUrl = imageUrl;
    }
    Category newCategory = Category(
        id: category.id,
        imageUrl: category.imageUrl,
        name: categoryNameController.text.isEmpty
            ? category.name
            : categoryNameController.text,
        );

    bool? isUpdated =
    await FirestoreHelper.firestoreHelper.updateCategory(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allCategories!.indexOf(category);
      allCategories![index] = newCategory;
      imageFile = null;
      categoryNameController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
      AppRouter.appRouter.hideDialoug();
    }
  }

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productWeightController = TextEditingController();
  GlobalKey<FormState> addProductKey = GlobalKey();

  addNewProduct(String catId) async {
    if (imageFile != null) {
      if (addProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("products_images", imageFile!);
        Product product = Product(
            imageUrl: imageUrl,
            name: productNameController.text,
            description: productDescriptionController.text,
            price: productPriceController.text,
            catId: catId, weight: '');

        String? id =
        await FirestoreHelper.firestoreHelper.addNewProduct(product);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          product.id = id;
          allProducts?.add(product);
          notifyListeners();
          productNameController.clear();
          productDescriptionController.clear();
          productPriceController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialog('Success', 'Your Product has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialog('Error', 'You have to pick image first');
    }
  }

  getAllProducts(String catId) async {
    allProducts = null;
    notifyListeners();
    List<Product>? products =
    await FirestoreHelper.firestoreHelper.getAllProducts(catId);

    allProducts = products;
    notifyListeners();
  }



}
