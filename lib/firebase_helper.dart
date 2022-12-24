import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app2/models/offers/offers_menu.dart';

import 'models/categoryy.dart';
import 'models/app_user.dart';
import 'models/product.dart';

class FirestoreHelper {
  FirestoreHelper._();

  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //register
  addNewUser(AppUser appUser) async {
    await firestore.collection('users').doc(appUser.id).set(appUser.toMap());
  }

  //login
  Future<AppUser> getUserFromFirestore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firestore.collection('users').doc(id).get();
    Map<String, dynamic>? data = documentSnapshot.data();
    AppUser appUser = AppUser.fromMap(data!);
    return appUser;
  }

  updateTheUser(AppUser appUser) async {
    await firestore.collection('users').doc(appUser.id).update(appUser.toMap());
  }

  //Beverages Category Collection:
  Future<String?> addNewBeverage(Category category) async {
    try {
      DocumentReference<Map<String, dynamic>> categoryDocument =
          await firestore.collection('beverage_category').add(category.toMap());

      return categoryDocument.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Category>?> getAllBeverages() async {
    try {
      QuerySnapshot<Map<String, dynamic>> catsSnapshot =
          await firestore.collection('beverage_category').get();
      List<Category> categories = catsSnapshot.docs.map((doc) {
        Category category = Category.fromMap(doc.data());
        category.id = doc.id;
        return category;
      }).toList();
      return categories;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<bool> deleteBeverage(String catId) async {
    try {
      await firestore.collection('beverage_category').doc(catId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool?> updateBeverage(Category category) async {
    try {
      await firestore
          .collection('beverage_category')
          .doc(category.id)
          .update(category.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  /// Beverage's products functions
  Future<String?> addNewProduct(Product product) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          await firestore
              .collection('beverage_category')
              .doc(product.catId)
              .collection('products')
              .add(product.toMap());
      return documentReference.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Product>?> getAllBeverageProducts() async {
    // log('wsdefrytjkjlkhghfg');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('beverage_category').get();
    return querySnapshot.docs.map((e) {
      Product product = Product.fromMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
  }

  //Baby Care Category Collection:
  Future<String?> addNewBabyCare(Category category) async {
    try {
      DocumentReference<Map<String, dynamic>> categoryDocument = await firestore
          .collection('baby_care_category')
          .add(category.toMap());

      return categoryDocument.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Category>?> getAllBabyCares() async {
    try {
      QuerySnapshot<Map<String, dynamic>> catsSnapshot =
          await firestore.collection('baby_care_category').get();
      List<Category> categories = catsSnapshot.docs.map((doc) {
        Category category = Category.fromMap(doc.data());
        category.id = doc.id;
        return category;
      }).toList();
      return categories;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Product>?> getAllBabyCareProducts() async {
    // log('wsdefrytjkjlkhghfg');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('baby_care_category').get();
    return querySnapshot.docs.map((e) {
      Product product = Product.fromMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
  }

  Future<bool> deleteBabyCare(String catId) async {
    try {
      await firestore.collection('baby_care_category').doc(catId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool?> updateBabyCare(Category category) async {
    try {
      await firestore
          .collection('baby_care_category')
          .doc(category.id)
          .update(category.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  //Bakery Category Collection:
  Future<String?> addNewBakery(Category category) async {
    try {
      DocumentReference<Map<String, dynamic>> categoryDocument =
          await firestore.collection('bakery_category').add(category.toMap());

      return categoryDocument.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Category>?> getAllBakeries() async {
    try {
      QuerySnapshot<Map<String, dynamic>> catsSnapshot =
          await firestore.collection('bakery_category').get();
      List<Category> categories = catsSnapshot.docs.map((doc) {
        Category category = Category.fromMap(doc.data());
        category.id = doc.id;
        return category;
      }).toList();
      return categories;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Product>?> getAllBakeryProducts() async {
    // log('wsdefrytjkjlkhghfg');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('bakery_category').get();
    return querySnapshot.docs.map((e) {
      Product product = Product.fromMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
  }

  Future<bool> deleteBakeries(String catId) async {
    try {
      await firestore.collection('bakery_category').doc(catId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool?> updateBakeries(Category category) async {
    try {
      await firestore
          .collection('bakery_category')
          .doc(category.id)
          .update(category.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  //Fish Category Collection:
  Future<String?> addNewFish(Category category) async {
    try {
      DocumentReference<Map<String, dynamic>> categoryDocument =
          await firestore.collection('fish_category').add(category.toMap());

      return categoryDocument.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Category>?> getAllFishes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> catsSnapshot =
          await firestore.collection('fish_category').get();
      List<Category> categories = catsSnapshot.docs.map((doc) {
        Category category = Category.fromMap(doc.data());
        category.id = doc.id;
        return category;
      }).toList();
      return categories;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Product>?> getAllfishProducts() async {
    // log('wsdefrytjkjlkhghfg');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('fish_category').get();
    return querySnapshot.docs.map((e) {
      Product product = Product.fromMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
  }

  Future<bool> deleteFishes(String catId) async {
    try {
      await firestore.collection('fish_category').doc(catId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool?> updateFishes(Category category) async {
    try {
      await firestore
          .collection('fish_category')
          .doc(category.id)
          .update(category.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  //Coffee Category Collection:
  Future<String?> addNewCoffee(Category category) async {
    try {
      DocumentReference<Map<String, dynamic>> categoryDocument =
          await firestore.collection('coffee_category').add(category.toMap());

      return categoryDocument.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Category>?> getAllCoffees() async {
    try {
      QuerySnapshot<Map<String, dynamic>> catsSnapshot =
          await firestore.collection('coffee_category').get();
      List<Category> categories = catsSnapshot.docs.map((doc) {
        Category category = Category.fromMap(doc.data());
        category.id = doc.id;
        return category;
      }).toList();
      return categories;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Product>?> getAllCoffeeProducts() async {
    // log('wsdefrytjkjlkhghfg');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('coffee_category').get();
    return querySnapshot.docs.map((e) {
      Product product = Product.fromMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
  }

  Future<bool> deleteCoffee(String catId) async {
    try {
      await firestore.collection('coffee_category').doc(catId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool?> updateCoffee(Category category) async {
    try {
      await firestore
          .collection('coffee_category')
          .doc(category.id)
          .update(category.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  //Sweet Category Collection:
  Future<String?> addNewSweet(Category category) async {
    try {
      DocumentReference<Map<String, dynamic>> categoryDocument =
          await firestore.collection('sweet_category').add(category.toMap());

      return categoryDocument.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Category>?> getAllSweets() async {
    try {
      QuerySnapshot<Map<String, dynamic>> catsSnapshot =
          await firestore.collection('sweet_category').get();
      List<Category> categories = catsSnapshot.docs.map((doc) {
        Category category = Category.fromMap(doc.data());
        category.id = doc.id;
        return category;
      }).toList();
      return categories;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Product>?> getAllSweetProducts() async {
    // log('wsdefrytjkjlkhghfg');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('sweet_category').get();
    return querySnapshot.docs.map((e) {
      Product product = Product.fromMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
  }

  Future<bool> deleteSweet(String catId) async {
    try {
      await firestore.collection('sweet_category').doc(catId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool?> updateSweet(Category category) async {
    try {
      await firestore
          .collection('sweet_category')
          .doc(category.id)
          .update(category.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  //Offer Collection:
  Future<String?> addNewOffer(OffersMenu offersMenu) async {
    try {
      DocumentReference<Map<String, dynamic>> categoryDocument =
          await firestore.collection('offer').add(offersMenu.toMap());

      return categoryDocument.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<OffersMenu>?> getAllOffer() async {
    try {
      QuerySnapshot<Map<String, dynamic>> catsSnapshot =
          await firestore.collection('offer').get();
      List<OffersMenu> offersMenu = catsSnapshot.docs.map((doc) {
        OffersMenu offersMenu = OffersMenu.fromMap(doc.data());
        offersMenu.id = doc.id;
        return offersMenu;
      }).toList();
      return offersMenu;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<bool> deleteOffer(String catId) async {
    try {
      await firestore.collection('offer').doc(catId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool?> updateOffer(OffersMenu offersMenu) async {
    try {
      await firestore
          .collection('offer')
          .doc(offersMenu.id)
          .update(offersMenu.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  // Future<bool> deleteBeverageProduct(String? productId) async {
  //   try {
  //     await firestore
  //         .collection('beverage_category').doc()
  //         .collection('products')
  //         .doc(productId)
  //         .delete();
  //     return true;
  //   } on Exception catch (e) {
  //     log(e.toString());
  //     return false;
  //   }
  // }
}
