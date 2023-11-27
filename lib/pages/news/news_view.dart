import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thietthach_app/pages/news/listimage.dart';
import 'package:thietthach_app/pages/news/listnews.dart';
import 'package:thietthach_app/pages/news/news_controller.dart';

import '../../colors/colors.dart';

class NewsPage extends GetView<NewsController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:AppColors.backgroundColor,
          leading: InkWell(onTap:(){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios, size: 25,color: Colors.black,)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Container(
              color: Colors.grey.shade300,
              height: 1,
            ),
          ),
          flexibleSpace: const Center(
            child: Text(
              'News ArHouse',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: const AssetImage('assets/images/2.jpg'),
                width: MediaQuery.of(context).size.width,
                height: 200,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text(
                  'Khai mac giai cau long mo rong df sse aaa eee www ff ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Divider(),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: Text(
                  'Nhớ nhất là khi tôi lên năm tuổi, anh trai đã đưa tôi đi câu cá ở con sông gần làng. Đây là lần đầu tiên tôi được đi câu cá. Chính vì vậy, tôi cảm thấy rất háo hức. Đầu tiên, hai anh em đã đi ra vườn để đào giun đất làm mồi câu. Sau đó, cả hai cùng nhau ra sông câu cá. Anh Tùng đã dạy tôi cách gắn mồi câu, cách câu cá. Khi nhìn anh làm, tôi cảm thấy vô cùng khâm phục. Anh trai của tôi thật giỏi. Chúng tôi đã ngồi câu rất lâu.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),

              ListImage(),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  'ArHouse Group',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  '20 nam xay dung sieu to khong lo',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  'He thong chi nhanh rong khap the gioi voi nhung du an sieu to khong lo',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(
                  'Hotline: 0987897678 - 8765567567',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black
                  ),
                ),
              ),

              const SizedBox(height: 15,),

              Container(
                height: 15,
                width: MediaQuery.sizeOf(context).width,
                color: Color.fromRGBO(244, 244, 244, 1),
              ),

              Container(
                height: 140,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Comments 26',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),

                        Text(
                          'See All',
                          style: TextStyle(
                            color: AppColors.backgroundIntro,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Icon(Icons.arrow_forward_ios,size: 16,color: AppColors.backgroundIntro,)
                      ],
                    ),

                    const SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 23,
                          backgroundImage: AssetImage('assets/images/avatar0.jpg')
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 15,top: 10,bottom: 15),
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromRGBO(244, 244, 244, 1),
                            ),
                            child: const Text(
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
                  ],
                ),
              ),
              Container(
                height: 15,
                width: MediaQuery.sizeOf(context).width,
                color: const Color.fromRGBO(244, 244, 244, 1),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Recommended articles',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),

              ListNews(),
            ],
          ),
        ),
      ),
    );
  }
}