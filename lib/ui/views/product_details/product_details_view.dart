import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked_architecture/constants/theme.dart';
import 'package:stacked_architecture/widgets/rounded_button_widget.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageViewController = PageController(initialPage: 0);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        // Main Stack dividing whole column(Image and details) and bottom row(price and buy button).
        alignment: Alignment.bottomCenter,
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              // Column containing images and details except price and buy button.
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  // Stack with Images and pageindicator.
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    SizedBox(
                      height: size.height / 1.7,
                      width: size.width,
                      child: PageView.builder(
                        controller: pageViewController,
                        itemCount: 5,
                        itemBuilder: ((context, index) => Image.network(
                              'https://images.unsplash.com/photo-1496440737103-cd596325d314?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500',
                              fit: BoxFit.cover,
                            )),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmoothPageIndicator(
                        // External Package
                        controller: pageViewController,
                        count: 5,
                        key: const Key('page_key'),
                        effect: const ExpandingDotsEffect(
                          activeDotColor: kPrimaryColor2,
                          dotWidth: 6,
                          dotHeight: 6,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Denim Shirt',
                              style: Get.textTheme.headline5!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 27,
                              )),
                          const SizedBox(height: 20),
                          Text(
                            'Description',
                            style: Get.textTheme.subtitle1!.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'In publishing anvailable. d graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is a',
                            style: Get.textTheme.bodyText2!,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Description',
                            style: Get.textTheme.subtitle1!.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            //? Contains white background container and Row(Price,BuyButton) on top.
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 80,
                child: Container(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 15, left: 15, right: 15),
                child: Row(
                  //? Row with Price and Buy button.
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹310',
                      style: Get.textTheme.headline3!.copyWith(
                        color: Colors.black87,
                        fontSize: 35,
                      ),
                    ),
                    RoundedButtonWidget(
                      backgroundColor: kPrimaryColor,
                      borderRadius: 20,
                      width: 130,
                      height: 50,
                      onPressed: () {},
                      text: 'ORDER NOW',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
