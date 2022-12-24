import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/Routers/app_router.dart';
import 'package:social_app2/data/iconBarData.dart';
import 'package:social_app2/providers/admin_provider.dart';
import 'package:social_app2/screens/categories_screen.dart';
import 'package:social_app2/screens/login_screen.dart';
import '../models/Icons/icon_bar_model.dart';
import '../models/offers/offer_menu_model.dart';
import '../providers/auth_provider.dart';
import 'add/category/add/add_new_offer.dart';
import 'add/category/display/all_snack_categories.dart';
import 'add/category/display/bakery.dart';
import 'add/category/display/beverage_categories.dart';
import 'add/category/display/coffee.dart';
import 'add/category/display/fishes.dart';
import 'add/category/display/sweet.dart';
import 'cart.dart';

class HomeScreen extends StatelessWidget {
  List path = const [
    AllBeveragesScreen(),
    AllSnackCategoriesScreen(),
    AllBakeriesCategoryScreen(),
    AllFishesCategoryScreen(),
    AlCoffeeCategoryScreen(),
    AllSweetsCategoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<AdminProvider>(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text('Home'),
            leading: InkWell(
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false).signOut();
                  AppRouter.appRouter.goToWidget(SignInScreen());
                },
                child: const Icon(Icons.logout)),
            backgroundColor: Colors.green,
            actions: [
              IconButton(
                  onPressed: () {
                    AppRouter.appRouter.goToWidget(Cart());
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                  ))
            ]),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const SizedBox(height:20 ,),
              //  Stack(children: [
              //    Container(
              //        height: 100,
              //        width: double.infinity,
              //        decoration:  BoxDecoration(
              //          gradient: const LinearGradient(
              //              colors: [Colors.green, Colors.green]),
              //          borderRadius: BorderRadius.circular(20)
              //
              //        ),
              //        child:
              Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        // height: 80,
                        width: 500,
                        // color: Colors.green,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Huge market!',
                                style: TextStyle(
                                    color: Colors.black87,
                                    letterSpacing: 10,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 25),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Enjoy Easy Life',
                                style: TextStyle(
                                    color: Colors.black87,
                                    letterSpacing: 5,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20),
                              ),
                            ])),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        const Text(
                          'All Categories',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          width: 200,
                        ),
                        InkWell(
                          onTap: () {
                            AppRouter.appRouter.goToWidget(AllCategories());
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: SizedBox(
                              height: 120.0,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  itemCount: iconData.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          AppRouter.appRouter
                                              .goToWidget(path[index]);
                                        },
                                        child: IconBarModel(iconData[index]));
                                  })))
                    ]),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Exclusive Offers',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          width: 150,
                        ),
                        InkWell(
                          onTap: () {
                            AppRouter.appRouter.goToWidget(AddNewOffer());
                          },
                          child: const Text(
                            'Add New Offer',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: SizedBox(
                              height: 240.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    // physics:const NeverScrollableScrollPhysics(),
                                    itemCount: provider1.allOffers!.length,
                                    itemBuilder: (context, index) {
                                      return OfferModel(
                                          provider1.allOffers![index]);
                                    }),
                              )))
                    ])
                  ])
            ])));
  }
// const SizedBox(
//   height: 25,
// ),
// Row(
//   children: [
//     const Text(
//       'Top Picked',
//       style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           letterSpacing: 1,
//           fontSize: 13),
//     ),
//     const SizedBox(
//       width: 220,
//     ),
//     InkWell(
//       onTap: () {},
//       child: const Text(
//         'View All',
//         style: TextStyle(
//             color: Colors.green,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1,
//             fontSize: 13),
//       ),
//     ),
//   ],
// ),
// const SizedBox(
//   height: 25,
// ),
// Row(children: <Widget>[
//   Expanded(
//       child: SizedBox(
//           height: 300.0,
//           child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               // physics: const NeverScrollableScrollPhysics(),
//               itemCount: topPicked.length,
//               itemBuilder: (context, index) {
//                 return TopPickedModel(topPicked[index]);
//               })))
// ]),
// const SizedBox(
//   height: 25,
// ),
// Row(
//   children: [
//     const Text(
//       'Product For You',
//       style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           letterSpacing: 1,
//           fontSize: 13),
//     ),
//     const SizedBox(
//       width: 210,
//     ),
//     InkWell(
//       onTap: () {},
//       child: const Text(
//         'View All',
//         style: TextStyle(
//             color: Colors.green,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1,
//             fontSize: 12),
//       ),
//     ),
//   ],
// ),
// const SizedBox(
//   height: 25,
// ),
// Row(children: <Widget>[
//   Expanded(
//       child: SizedBox(
//           height: 300.0,
//           child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               // physics: const NeverScrollableScrollPhysics(),
//               itemCount: topPicked.length,
//               itemBuilder: (context, index) {
//                 return TopPickedModel(topPicked[index]);
//               })))
// ]),
}
