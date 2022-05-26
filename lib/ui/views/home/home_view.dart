import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked_architecture/constants/theme.dart';
import 'package:stacked_architecture/ui/views/home/home_viewmodel.dart';
import 'package:stacked_architecture/ui/views/home/widgets/product_tile.dart';
import 'package:stacked_architecture/ui/views/home/widgets/story_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel model = Get.find();
    return Scaffold(
      backgroundColor: kPrimaryColor2,
      appBar: AppBar(
        backgroundColor: kPrimaryColor2,
        elevation: 0,
        title: Text('HOME', style: Get.textTheme.headline6),
        centerTitle: true,
        leading: const Icon(
          LineIcons.bellAlt,
          size: 25,
          color: Colors.black,
        ),
        actions: [
          InkWell(
            onTap: () => model.signOut(),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(
                LineIcons.shoppingBag,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          model.backToHome();
        },
        child: const Icon(
          LineIcons.plus,
          // color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 2, child: StoryTile()),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 9,
              child: ProductTile(
                productImage: model.productImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
