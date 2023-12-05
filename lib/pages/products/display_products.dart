import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/colors/colors.dart';
import 'package:thietthach_app/pages/products/products_controller.dart';

import '../application/application_controller.dart';

class DisplayProducts extends GetView<ProductsController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width,
      child: Obx(()=>GridView.builder(
        scrollDirection:Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 8, // Spacing between columns
          mainAxisSpacing: 8,
          mainAxisExtent: 325,// Spacing between rows
        ),
        itemCount: controller.listProducts.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index){
          return InkWell(
            onTap: (){/*controller.HandleDesgnDetail(controller.listData[index].id!);*/},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image(
                        image: CachedNetworkImageProvider(controller.listProducts[index].images[0]),
                        width: MediaQuery.sizeOf(context).width/2-1,
                        height: 180,
                        fit: BoxFit.fill,
                      ),

                      Positioned(
                        right: 15,
                        bottom: 20,
                        child:Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(73, 73, 73, 0.7),
                              shape: BoxShape.circle
                          ),
                          child: InkWell(
                            onTap: (){
                              controller.ClickItemHeart(index);
                            },
                            child:Center(
                              child: Icon(
                                controller.listProducts[index].userlike.contains(ApplicationController.id) ? CupertinoIcons.heart_solid:CupertinoIcons.heart,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: DotsIndicator(
                      dotsCount: 5,
                      position:1,
                      decorator: DotsDecorator(
                        color: AppColors.borderColor,
                        activeColor: AppColors.iconColor,
                        size: const Size.square(8.0),
                        activeSize: const Size(12.0, 8.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                     controller.listProducts[index].title.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: RatingBar.builder(
                      initialRating: 4.5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 18,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '\$${controller.listProducts[index].price}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
