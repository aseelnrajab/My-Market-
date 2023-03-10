import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app2/models/offers/offers_menu.dart';

import '../Routers/app_router.dart';
import '../firebase_helper.dart';
import '../models/categoryy.dart';
import '../models/product.dart';
import '../screens/sliders/slider.dart';
import '../storage_helper.dart';

class AdminProvider extends ChangeNotifier {
  // late Category category;

  AdminProvider() {
    getAllCategories();
    getAllProducts();
    getAllSliders();
    // getAllSliders();
  }

  String? requiredValidation(String? content) {
    if (content == null || content.isEmpty) {
      return "Required field";
    }
  }

  TextEditingController categoryNameController = TextEditingController();
  GlobalKey<FormState> beverageCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> snackCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> bakeriesCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> fishesCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> coffeeCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> sweetCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> offerFormKey = GlobalKey<FormState>();

  File? imageFile;
  List<Category>? allBeverage;
  List<Category>? allsnack;
  List<Category>? allBakeries;
  List<Category>? allFishes;
  List<Category>? allCoffee;
  List<Category>? allSweets;
  List<OffersMenu>? allOffers;

  getAllCategories() async {
    allBeverage = await FirestoreHelper.firestoreHelper.getAllBeverages();
    allsnack = await FirestoreHelper.firestoreHelper.getAllBabyCares();
    allBakeries = await FirestoreHelper.firestoreHelper.getAllBakeries();
    allFishes = await FirestoreHelper.firestoreHelper.getAllFishes();
    allCoffee = await FirestoreHelper.firestoreHelper.getAllCoffees();
    allSweets = await FirestoreHelper.firestoreHelper.getAllSweets();
    allOffers = await FirestoreHelper.firestoreHelper.getAllOffer();
    CartProducts = await FirestoreHelper.firestoreHelper.getCartProducts();
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


//Add Category
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

  addNewSnack() async {
    if (imageFile != null) {
      if (snackCategoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("snack_images", imageFile!);
        Category category = Category(
          imageUrl: imageUrl,
          name: categoryNameController.text,
        );
        String? id =
            await FirestoreHelper.firestoreHelper.addNewBabyCare(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allsnack?.add(category);
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
//   delete Beverage category
  deleteBeverageCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteBeverage(category.id!);
    if (deleteSuccess) {
      allBeverage!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  //   delete Coffee category
  deleteCoffeeCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteCoffee(category.id!);
    if (deleteSuccess) {
      allCoffee!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  //   delete Sweet category
  deleteSweetCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteSweet(category.id!);
    if (deleteSuccess) {
      allSweets!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  //   delete Bakeries category
  deleteBakeryCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteBakeries(category.id!);
    if (deleteSuccess) {
      allBakeries!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  //   delete Fish category
  deleteFishCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteFishes(category.id!);
    if (deleteSuccess) {
      allFishes!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  //   delete Snack category
  deleteSnackCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteBabyCare(category.id!);
    if (deleteSuccess) {
      allsnack!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

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

  GlobalKey<FormState> addBeverageProductKey = GlobalKey();
  GlobalKey<FormState> addSnackProductKey = GlobalKey();
  GlobalKey<FormState> addBakeryProductKey = GlobalKey();
  GlobalKey<FormState> addFishProductKey = GlobalKey();
  GlobalKey<FormState> addSweetProductKey = GlobalKey();
  GlobalKey<FormState> addCoffeeProductKey = GlobalKey();

  //Add Product

  addNewBeverageProduct(String catId) async {
    if (imageFile != null) {
      if (addBeverageProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("beverage_products_images", imageFile!);
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
          allBeverageProducts?.add(product);
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

  addNewSnackProduct(String catId) async {
    if (imageFile != null) {
      if (addSnackProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("snack_products_images", imageFile!);
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
          allSnackProducts?.add(product);
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

  addNewBakeryProduct(String catId) async {
    if (imageFile != null) {
      if (addBakeryProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("bakery_products_images", imageFile!);
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
          allBakeryProducts?.add(product);
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

  addNewFishesProduct(String catId) async {
    if (imageFile != null) {
      if (addFishProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("fishes_images", imageFile!);
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
          allFishProducts?.add(product);
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

  addNewCoffeeProduct(String catId) async {
    if (imageFile != null) {
      if (addCoffeeProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("coffee_images", imageFile!);
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
          allCoffeeProducts?.add(product);
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

  addNewSweetProduct(String catId) async {
    if (imageFile != null) {
      if (addSweetProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("sweet_images", imageFile!);
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
          allSweetProducts?.add(product);
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

  List<Product>? allBeverageProducts;
  List<Product>? allSnackProducts;
  List<Product>? allBakeryProducts;
  List<Product>? allFishProducts;
  List<Product>? allCoffeeProducts;
  List<Product>? allSweetProducts;
  List<Product>? CartProducts;
  List<Product>? payment;

  //get Products
  getAllProducts() async {
    getAllBeverageProducts();
    getAllSnacksProducts();
    getAllBakeryProducts();
    getAllFishProducts();
    getAllCoffeeProducts();
    getAllSweetProducts();
  }

  getAllBeverageProducts() async {
    // log('234567898765432345');
    allBeverageProducts = null;
    notifyListeners();
    // log(catId);
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllBeverageProducts();

    allBeverageProducts = products;
    notifyListeners();
  }

  getAllSnacksProducts() async {
    // log('234567898765432345');
    allSnackProducts = null;
    notifyListeners();
    // log(catId);
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllBabyCareProducts();

    allSnackProducts = products;
    notifyListeners();
  }

  getAllBakeryProducts() async {
    // log('234567898765432345');
    allBakeryProducts = null;
    notifyListeners();
    // log(catId);
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllBakeryProducts();

    allBakeryProducts = products;
    notifyListeners();
  }

  getAllFishProducts() async {
    // log('234567898765432345');
    allFishProducts = null;
    notifyListeners();
    // log(catId);
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllfishProducts();

    allFishProducts = products;
    notifyListeners();
  }

  getAllCoffeeProducts() async {
    // log('234567898765432345');
    allCoffeeProducts = null;
    notifyListeners();
    // log(catId);
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllCoffeeProducts();

    allCoffeeProducts = products;
    notifyListeners();
  }

  getAllSweetProducts() async {
    // log('234567898765432345');
    allSweetProducts = null;
    notifyListeners();
    // log(catId);
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllSweetProducts();

    allSweetProducts = products;
    notifyListeners();
  }

  addToCart(Product product) async {
    // add product to cart process
    AppRouter.appRouter.showLoadingDialoug();
    String? id = await FirestoreHelper.firestoreHelper.addToCart(product);

    AppRouter.appRouter.hideDialoug();
    if (id != null) {
      product.id = id;
      CartProducts?.add(product);
      notifyListeners();
      AppRouter.appRouter
          .showCustomDialog('Success', 'Your product has been added to cart');
    } else {
      AppRouter.appRouter.showCustomDialog('Error', 'You have to try again');
    }
  }

  removeFromCart(Product product) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.removeFromCart(product);
    if (deleteSuccess) {
      CartProducts!.remove(product);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

// addToPayment(Product product) async {
//   // add product to payment process
//   AppRouter.appRouter.showLoadingDialoug();
//   String? id = await FirestoreHelper.firestoreHelper.addToPayment(product);
//
//   AppRouter.appRouter.hideDialoug();
//   if (id != null) {
//     product.id = id;
//     payment?.add(product);
//     notifyListeners();
//     AppRouter.appRouter.showCustomDialog(
//         'Success', 'Your product has been added to payment ');
//   } else {
//     AppRouter.appRouter.showCustomDialog('Error', 'You have to try again');
//   }
// }

// Future<int>
// Future<double> getAllPaymentAnCalculate() async {
//   double price=
//       await FirestoreHelper.firestoreHelper.calculatePayment();
//   notifyListeners();
//   return price;

//
// int? length = payment?.length;
//
// for (int i = 0; i < length!; i++) {
//   totalPrice += payment![i].price as int;
// }
// return totalPrice;

// deleteProduct(String? productId) async {
//   log('Arrived');
//   AppRouter.appRouter.showLoadingDialoug();
//   bool deleteSuccess =
//       await FirestoreHelper.firestoreHelper.deleteBeverageProduct(productId);
//   if (deleteSuccess) {
//     allBeverageProducts!.remove(productId);
//     notifyListeners();
//   }
//   AppRouter.appRouter.hideDialoug();
// }

  //update categories

  updateBeverageCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("beverage_images", imageFile!);
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
        await FirestoreHelper.firestoreHelper.updateBeverage(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allBeverage!.indexOf(category);
      allBeverage![index] = newCategory;
      imageFile = null;
      categoryNameController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
    }
  }

  updateSnackCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("snack_images", imageFile!);
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
        await FirestoreHelper.firestoreHelper.updateBabyCare(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allsnack!.indexOf(category);
      allsnack![index] = newCategory;
      imageFile = null;
      categoryNameController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
    }
  }

  updateCofeeCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("coffee_category", imageFile!);
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
        await FirestoreHelper.firestoreHelper.updateCoffee(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allCoffee!.indexOf(category);
      allCoffee![index] = newCategory;
      imageFile = null;
      categoryNameController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
    }
  }

  updateFishCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("fishes_images", imageFile!);
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
        await FirestoreHelper.firestoreHelper.updateFishes(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allFishes!.indexOf(category);
      allFishes![index] = newCategory;
      imageFile = null;
      categoryNameController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
    }
  }

  updateSweetCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("sweet_category", imageFile!);
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
        await FirestoreHelper.firestoreHelper.updateSweet(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allSweets!.indexOf(category);
      allSweets![index] = newCategory;
      imageFile = null;
      categoryNameController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
    }
  }

  updateBakeryCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("bakery_images", imageFile!);
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
        await FirestoreHelper.firestoreHelper.updateBakeries(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allBakeries!.indexOf(category);
      allBakeries![index] = newCategory;
      imageFile = null;
      categoryNameController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
    }
  }

  List<Slider>? allSliders;
  TextEditingController sliderTitleController = TextEditingController();
  TextEditingController sliderUrlController = TextEditingController();

  getAllSliders() async {
    allSliders = await FirestoreHelper.firestoreHelper.getAllSliders();
  }

  AddNewSlider() async {
    if (imageFile != null) {
      AppRouter.appRouter.showLoadingDialoug();
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("Slider_images", imageFile!);
      Slider slider = Slider(
          imageUrl: imageUrl,
          title: sliderTitleController.text,
          url: sliderUrlController.text);

      String? id = await FirestoreHelper.firestoreHelper.addNewSlider(slider);

      AppRouter.appRouter.hideDialoug();
      if (id != null) {
        slider.id = id;
        allSliders?.add(slider);
        notifyListeners();
        sliderTitleController.clear();
        sliderUrlController.clear();

        imageFile = null;
        notifyListeners();
        AppRouter.appRouter
            .showCustomDialog('Success', 'Your Slider has been added');
      }
    } else {
      AppRouter.appRouter
          .showCustomDialog('Error', 'You have to pick image first');
    }
  }

}
