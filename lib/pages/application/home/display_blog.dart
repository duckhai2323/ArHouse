import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../colors/colors.dart';
import 'home_controller.dart';

class BlogList extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext contex,index){
            return  Container(
              color: Color.fromRGBO(244, 244, 244, 1),
              padding: EdgeInsets.only(top: 10),
              height: 495,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.backgroundColor,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
                    height: 50,
                    child: Text(
                      'Trending Story in Bathroom Of The Week',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Obx(() => Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: PageView(
                          controller: controller.pageController,
                          onPageChanged: (index){
                            controller.ChangePageView(index);
                          },
                          children: [
                            Image(
                              image: AssetImage('assets/images/2.jpg'),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),

                            Image(
                              image: AssetImage('assets/images/2.jpg'),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),

                            Image(
                              image: AssetImage('assets/images/2.jpg'),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),

                            Image(
                              image: AssetImage('assets/images/2.jpg'),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        bottom: 10,
                        left: 40,
                        right: 40,
                        child: DotsIndicator(
                          dotsCount: 4,
                          position:controller.statePageView.value,
                          decorator: DotsDecorator(
                            activeColor: Colors.white,
                            size: const Size.square(8.0),
                            activeSize: const Size(12.0, 8.0),
                            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                          ),
                        ),
                      ),

                      Positioned(
                        right: 15,
                        bottom: 20,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(73, 73, 73, 0.87),
                              shape: BoxShape.circle
                          ),
                          child: InkWell(
                            onTap: (){
                              controller.ClickItemHeart();
                            },
                            child: Center(
                              child: Icon(
                                controller.checkLove.isTrue ? CupertinoIcons.heart_solid:CupertinoIcons.heart,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),

                  Container(
                    color: AppColors.backgroundColor,
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Text(
                      'Bathroom of the Week: Clean Modern Style for a Master Bath',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Container(
                    color: AppColors.backgroundColor,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 15,bottom: 5),
                    child: Text(
                      'ngay 3 thang 11, 2020',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),

                  Container(
                    color: AppColors.backgroundColor,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                    ),
                  ),

                  Container(
                    color: AppColors.backgroundColor,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Comments 27',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),

                  Container(
                    color: AppColors.backgroundColor,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'KaiTaiYou26 ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: "of the printing and typesetting hhh hhh hhhh hhhh hhhh hhh hhh vvv industry fsnfsnfnsfns sfnskfnsnf",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            ),
                          ]),
                    ),
                  ),

                  Container(
                    color: AppColors.backgroundColor,
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(244, 244, 244, 1),
                      ),
                      child: Text(
                        'Comment...',
                        style: TextStyle(
                          color: AppColors.iconColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
          }
      ),
    );
  }
}