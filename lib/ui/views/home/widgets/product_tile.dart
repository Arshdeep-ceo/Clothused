import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {Key? key, required this.productImage, required this.productDetailsPage})
      : super(key: key);
  final String productImage;
  final Widget productDetailsPage;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 4, right: 8, left: 5),
            child: Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4, left: 4),
                      child: OpenContainer(
                        closedElevation: 0,
                        closedBuilder: (context, action) => Card(
                          elevation: 0,
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.network(
                            productImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        openBuilder: (context, action) => productDetailsPage,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            CircleAvatar(
                              backgroundImage: ResizeImage(
                                  NetworkImage(
                                    'https://images.unsplash.com/photo-1652487343800-de99be6a2b3a?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500',
                                  ),
                                  width: 120,
                                  height: 120),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Denim Shirt for girls'),
                            ),
                          ],
                        ),
                        const Icon(
                          FontAwesomeIcons.bookmark,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
