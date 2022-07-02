import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked_architecture/services/navigation_bar_model.dart';
import 'package:stacked_architecture/ui/views/favourites/favourites_view.dart';
import 'package:stacked_architecture/ui/views/home/home_view.dart';
import 'package:stacked_architecture/ui/views/profile/profile_view.dart';
import 'package:stacked_architecture/ui/views/rent/rent_view.dart';
import 'package:stacked_architecture/widgets/keep_alive_page_widget.dart';

class WaterNavigationBar extends StatelessWidget {
  const WaterNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationBarModel navModel = Get.put(NavigationBarModel());
    final PageController pageController = PageController();
    return Scaffold(
        bottomNavigationBar: GNav(
          // color: Colors.black54,
          // activeColor: Colors.white,
          // backgroundColor: kPrimaryColor,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: LineIcons.heart,
              text: 'Likes',
            ),
            GButton(
              icon: LineIcons.search,
              text: 'Search',
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profile',
            ),
          ],
          selectedIndex: navModel.selectedIndex,
          duration: const Duration(milliseconds: 200),
          onTabChange: (index) {
            navModel.changeIndex(index);
            pageController.animateToPage(navModel.selectedIndex,
                duration: const Duration(milliseconds: 200),
                curve: Curves.fastLinearToSlowEaseIn);
          },
        ),
        // body: Obx(() {
        //   return IndexedStack(
        //     index: navModel.selectedIndex,
        //     children: [
        //       HomeView(),
        //       FavouritesView(),
        //       RentView(),
        //       ProfileView(),
        //       KeepAlive(keepAlive: true, child: child)
        //     ],
        //   );
        // }),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            KeepAlivePage(child: HomeView()),
            KeepAlivePage(child: FavouritesView()),
            KeepAlivePage(child: RentView()),
            KeepAlivePage(child: ProfileView())
          ],
        ));
  }
}
