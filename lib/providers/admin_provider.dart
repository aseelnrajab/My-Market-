import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app2/models/offers/offers_menu.dart';

import '../Routers/app_router.dart';
import '../firebase_helper.dart';
import '../models/categoryy.dart';
import '../models/product.dart';
import '../storage_helper.dart';

class AdminProvider extends ChangeNotifier {
  // late Category category;

  AdminProvider() {
    getAllCategories();
    // getAllProducts(pro);
    // getAllSliders();
  }

  String? requiredValidation(String? content) {
    if (content == null || content.isEmpty) {
      return "Required field";
    }
  }

  TextEditingController categoryNameController = TextEditingController();
  GlobalKey<FormState> beverageCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> babyCareCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> bakeriesCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> fishesCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> coffeeCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> sweetCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> offerFormKey = GlobalKey<FormState>();
  File? imageFile;
  List<Category>? allBeverage;
  List<Category>? allBabyCare;
  List<Product>? allProducts;
  List<Category>? allBakeries;
  List<Category>? allFishes;
  List<Category>? allCoffee;
  List<Category>? allSweets;
  List<OffersMenu>? allOffers;

  getAllCategories() async {
    allBeverage = await FirestoreHelper.firestoreHelper.getAllBeverages();
    allBabyCare = await FirestoreHelper.firestoreHelper.getAllBabyCares();
    allBakeries = await FirestoreHelper.firestoreHelper.getAllBakeries();
    allFishes = await FirestoreHelper.firestoreHelper.getAllFishes();
    allCoffee = await FirestoreHelper.firestoreHelper.getAllCoffees();
    allSweets = await FirestoreHelper.firestoreHelper.getAllSweets();
    allOffers = await FirestoreHelper.firestoreHelper.getAllOffer();

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

  addNewBeverage() async {
    if (imageFile != null) {
      if (beverageCategoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("beverage_images", imageFile!);
        Category category = Category(
          imageUrl: imageUrl,
          name: categoryNameController.text,
        );
        String? id =
            await FirestoreHelper.firestoreHelper.addNewBeverage(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allBeverage?.add(category);
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

  addNewBabyCare() async {
    if (imageFile != null) {
      if (babyCareCategoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("babyCare_images", imageFile!);
        Category category = Category(
          imageUrl: imageUrl,
          name: categoryNameController.text,
        );
        String? id =
            await FirestoreHelper.firestoreHelper.addNewBabyCare(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allBabyCare?.add(category);
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

  addNewBakeries() async {
    if (imageFile != null) {
      if (bakeriesCategoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("bakery_images", imageFile!);
        Category category = Category(
          imageUrl: imageUrl,
          name: categoryNameController.text,
        );
        String? id =
            await FirestoreHelper.firestoreHelper.addNewBakery(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allBakeries?.add(category);
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

  addNewFishes() async {
    if (imageFile != null) {
      if (fishesCategoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("fishes_images", imageFile!);
        Category category = Category(
          imageUrl: imageUrl,
          name: categoryNameController.text,
        );
        String? id = await FirestoreHelper.firestoreHelper.addNewFish(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allFishes?.add(category);
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

  addNewCoffee() async {
    if (imageFile != null) {
      if (coffeeCategoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("coffee_category", imageFile!);
        Category category = Category(
          imageUrl: imageUrl,
          name: categoryNameController.text,
        );
        String? id =
            await FirestoreHelper.firestoreHelper.addNewCoffee(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allCoffee?.add(category);
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

  addNewSweet() async {
    if (imageFile != null) {
      if (sweetCategoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("sweet_category", imageFile!);
        Category category = Category(
          imageUrl: imageUrl,
          name: categoryNameController.text,
        );
        String? id =
            await FirestoreHelper.firestoreHelper.addNewSweet(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allSweets?.add(category);
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

  addNewOffer() async {
    if (imageFile != null) {
      if (offerFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("offer_images", imageFile!);
        OffersMenu offersMenu = OffersMenu(
          imageUrl: imageUrl,
        );
        String? id =
            await FirestoreHelper.firestoreHelper.addNewOffer(offersMenu);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          offersMenu.id = id;
          allOffers?.add(offersMenu);
          notifyListeners();
          categoryNameController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialog('Success', 'Your Offer has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialog('Error', 'You have to pick image first');
    }
  }

//////////////////////
//   delete category
//   deleteCategory(Category category) async {
//     AppRouter.appRouter.showLoadingDialoug();
//     bool deleteSuccess =
//         await FirestoreHelper.firestoreHelper.deleteBeverage(category.id!);
//     if (deleteSuccess) {
//       allBeverage!.remove(category);
//       notifyListeners();
//     }
//     AppRouter.appRouter.hideDialoug();
//   }

  // goToEditCategoryPage(Category category) {
  //   categoryNameController.text = category.name;
  //   // AppRouter.appRouter.goToWidget(EditCategory(category));
  // }
  //
  // updateCategory(Category category) async {
  //   AppRouter.appRouter.showLoadingDialoug();
  //   if (imageFile != null) {
  //     String imageUrl = await StorageHelper.storageHelper
  //         .uploadNewImage("cats_images", imageFile!);
  //     category.imageUrl = imageUrl;
  //   }
  //   Category newCategory = Category(
  //     id: category.id,
  //     imageUrl: category.imageUrl,
  //     name: categoryNameController.text.isEmpty
  //         ? category.name
  //         : categoryNameController.text,
  //   );
  //
  //   bool? isUpdated =
  //       await FirestoreHelper.firestoreHelper.updateBeverage(newCategory);
  //
  //   if (isUpdated != null && isUpdated) {
  //     int index = allBeverage!.indexOf(category);
  //     allBeverage![index] = newCategory;
  //     imageFile = null;
  //     categoryNameController.clear();
  //     notifyListeners();
  //     AppRouter.appRouter.hideDialoug();
  //     AppRouter.appRouter.hideDialoug();
  //   }
  // }

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
            catId: catId,
            weight: '');

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
          // log(catId);
          // AppRouter.appRouter.goToWidget(AllProductsScreen(catId));
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialog('Error', 'You have to pick image first');
    }
  }

  getAllProducts(String catId) async {
    // log('234567898765432345');
    allProducts = null;
    notifyListeners();
    // log(catId);
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllProducts(catId);

    allProducts = products;
    notifyListeners();
  }
}
