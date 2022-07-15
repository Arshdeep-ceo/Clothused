import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_architecture/constants/theme.dart';
import 'package:stacked_architecture/services/navigation_bar.dart';
import 'package:stacked_architecture/ui/views/home/home_view.dart';
import 'package:stacked_architecture/ui/views/product_details/product_details_view.dart';
import 'package:stacked_architecture/ui/views/profile/profile_view.dart';
import 'package:stacked_architecture/ui/views/signup/signup_view.dart';
import 'ui/views/login/login_view.dart';
import 'ui/views/startup/startup_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //? Checks if a user is logged in or not
  String checkUser() {
    if (FirebaseAuth.instance.currentUser != null) {
      return '/nav';
    } else {
      return '/signup_view';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior(
          androidOverscrollIndicator: AndroidOverscrollIndicator
              .stretch), //! Depercated and need another solution.
      debugShowCheckedModeBanner: false,
      initialRoute: checkUser(),
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
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
            Get.textTheme), // Overridden Get Text Theme
      ),
    );
  }
}
