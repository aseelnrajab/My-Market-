import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/providers/admin_provider.dart';
import 'package:social_app2/providers/auth_provider.dart';
import 'package:social_app2/providers/bottom_navigation_bar_provider.dart';
import 'package:social_app2/screens/register_screen.dart';

import 'Routers/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AuthProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return BottomNavigationBarProvider();
          },
        ),
        ChangeNotifierProvider<AdminProvider>(
          create: (context) {
            return AdminProvider();
          },
        ),
      ],
      child: MaterialApp(
        navigatorKey: AppRouter.appRouter.navigaterkey,
        debugShowCheckedModeBanner: false,
        home: SignUpScreen(),
      ),
    );
  }
}
