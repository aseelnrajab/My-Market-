import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static AppRouter appRouter = AppRouter._();

  GlobalKey<NavigatorState> navigaterkey = GlobalKey();

  showCustomDialog(String title, String content) {
    showDialog(
        context: navigaterkey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  navigaterkey.currentState?.pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        });
  }

  showLoadingDialoug() {
    showDialog(
      barrierDismissible: false,
      context: navigaterkey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          content:   Row(
            children:  [
              const  CircularProgressIndicator(),
              Container(
                  margin: const EdgeInsets.only(left: 7), child:const Text("Loading...")),
            ],
          ),
        );
      },
    );
  }

  goToWidgetAndReplace(Widget widget) {
    navigaterkey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  goToWidget(Widget widget) {
    navigaterkey.currentState!.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  hideDialoug() {
    navigaterkey.currentState!.pop();
  }
}
