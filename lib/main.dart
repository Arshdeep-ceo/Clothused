import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_architecture/services/navigation_bar.dart';
import 'package:stacked_architecture/ui/views/home/home_view.dart';
import 'package:stacked_architecture/ui/views/product/product_details_viewmodel.dart';
import 'package:stacked_architecture/ui/views/profile/profile_view.dart';
import 'package:stacked_architecture/ui/views/signup/signup_view.dart';
import 'ui/views/login/login_view.dart';
import 'ui/views/startup/startup_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior(
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
      debugShowCheckedModeBanner: false,
      initialRoute: '/signup_view',
      defaultTransition: Transition.cupertino,
      getPages: [
        GetPage(name: '/', page: () => StartupView()),
        GetPage(name: '/home_view', page: () => HomeView()),
        GetPage(name: '/nav', page: () => WaterNavigationBar()),
        GetPage(name: '/profile_view', page: () => ProfileView()),
        GetPage(name: '/login_view', page: () => LoginView()),
        GetPage(name: '/signup_view', page: () => SignupView()),
        GetPage(name: '/product_details_view', page: () => ProductDetailsView())
      ],
      theme: ThemeData.light().copyWith(primaryColor: Colors.lightGreen),
    );
  }
}