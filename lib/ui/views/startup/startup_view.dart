import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:stacked_architecture/ui/views/home/home_viewmodel.dart';
import 'package:stacked_architecture/ui/views/startup/startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StartupViewModel model = Get.put(StartupViewModel());
    final HomeViewModel homeViewModel = Get.put(HomeViewModel());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeViewModel.increment();
        },
        child: const Icon(FontAwesomeIcons.plus),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () => Get.changeTheme(ThemeData.dark()),
                    child: Icon(
                      FontAwesomeIcons.sun,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(model.title),
                  Obx(() {
                    return Text(
                      homeViewModel.counter.toString(),
                      style: Get.theme.textTheme.displayLarge,
                    );
                  }),
                  FloatingActionButton.large(
                    heroTag: '',
                    onPressed: () {
                      model.navigateToHome();
                    },
                    child: const Icon(FontAwesomeIcons.arrowRight),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
