import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:stacked_architecture/constants/theme.dart';
import 'package:stacked_architecture/ui/views/home/home_viewmodel.dart';
import 'package:stacked_architecture/ui/views/home/widgets/product_tile.dart';
import 'package:stacked_architecture/ui/views/home/widgets/story_tile.dart';

import '../product_details/product_details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeModel = Get.put(HomeViewModel());
    return Scaffold(
      backgroundColor: kPrimaryColor2,
      appBar: AppBar(
        backgroundColor: kPrimaryColor2,
        elevation: 0,
        title: Text(
          'HOME',
          style: GoogleFonts.sriracha(color: Colors.black),
        ),
        centerTitle: true,
        leading: const Icon(
          LineIcons.bellAlt,
          size: 25,
          color: Colors.black,
        ),
        actions: [
          InkWell(
            onTap: () => homeModel.signOut(),
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
      floatingActionButton: SpeedDial(
        closedBackgroundColor: kPrimaryColor,
        openBackgroundColor: kPrimaryColor,
        speedDialChildren: [
          SpeedDialChild(
            child: const Icon(LineIcons.memory),
            onPressed: () {},
          ),
        ],
        child: const Icon(LineIcons.plus),
      ),
      body: Stack(
        children: [
          // SizedBox.expand(  // BACKGROUND IMAGE
          //   child: BlurHash(
          //     hash:
          //         'yIKm;4Ri_NROIUM{aJ~Wjrxut6M{xufPE1ofIAR+R*ogozM{ofocRPt7WBozxus:M{ayoft6j[oLM|j?ozW=jYRPRjj[V@t7xuV@V@',
          //     image:
          //         'https://images.unsplash.com/photo-1623596305214-19f21cbf48ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80',
          //     imageFit: BoxFit.cover,
          //     errorBuilder: (context, object, n) {
          //       return const Center(
          //         child: Text('NO INTERNET'),
          //       );
          //     },
          //   ),
          // ),
          SafeArea(
            child: Column(
              children: [
                Expanded(flex: 2, child: StoryTile()),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 9,
                  child: ProductTile(
                    productDetailsPage: ProductDetailsView(),
                    productImage: homeModel.productImage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
