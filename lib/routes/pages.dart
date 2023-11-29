import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thietthach_app/pages/alldesign/alldesign_bidings.dart';
import 'package:thietthach_app/pages/alldesign/alldesign_view.dart';
import 'package:thietthach_app/pages/application/application_bindings.dart';
import 'package:thietthach_app/pages/chat/chat_view.dart';
import 'package:thietthach_app/pages/commentblog/comment_bindings.dart';
import 'package:thietthach_app/pages/commentblog/comment_view.dart';
import 'package:thietthach_app/pages/design_detail/designdetail_bindings.dart';
import 'package:thietthach_app/pages/design_detail/designdetail_view.dart';
import 'package:thietthach_app/pages/design_detail/image_view/imageview_bindings.dart';
import 'package:thietthach_app/pages/design_detail/image_view/imageview_page.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_bindings.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_view.dart';
import 'package:thietthach_app/pages/knowledge/knowledge_bindings.dart';
import 'package:thietthach_app/pages/knowledge/knowledge_view.dart';
import 'package:thietthach_app/pages/news/list/list_binding.dart';
import 'package:thietthach_app/pages/news/list/list_view.dart';
import 'package:thietthach_app/pages/news/news_bindings.dart';
import 'package:thietthach_app/pages/news/news_view.dart';
import 'package:thietthach_app/pages/signin_signup/signin/signin_bindings.dart';
import 'package:thietthach_app/pages/signin_signup/signin/signin_view.dart';
import 'package:thietthach_app/pages/signin_signup/signup/signup_view.dart';

import '../pages/application/application_view.dart';
import '../pages/chat/chat_bindings.dart';
import '../pages/library/library_bidings.dart';
import '../pages/library/library_view.dart';
import '../pages/signin_signup/signup/signup_bindings.dart';
import 'names.dart';

class AppPages {
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.APPLICATION,
      page: ()=>ApplicationPage(),
      binding: ApplicationBindings(),
    ),

    GetPage(
      name: AppRoutes.LIBRARYHOUSE,
      page: ()=>LibraryPage(),
      binding: LibraryBinding(),
    ),

    GetPage(
      name: AppRoutes.ALLDESIGN,
      page: ()=>AllDesignPage(),
      binding: AllDesigBinding(),
    ),

    GetPage(
      name: AppRoutes.DESIGNDETAIL,
      page: ()=>DesignDetailPage(),
      binding: DesignDeatailBiding(),
    ),

    GetPage(
      name: AppRoutes.IMAGEVIEW,
      page: ()=>ImageViewPage(),
      binding: ImageViewBiding(),
    ),

    GetPage(
      name: AppRoutes.VIEWALLPHOTOS,
      page: ()=>ViewAllPhotosPage(),
      binding: ViewAllPhotosBinding(),
    ),

    GetPage(
      name: AppRoutes.CHAT,
      page: ()=>ChatPage(),
      binding: ChatBinding(),
    ),

    GetPage(
      name: AppRoutes.SIGNIN,
      page: ()=>SignInPage(),
      binding: SignInBinding(),
    ),

    GetPage(
      name: AppRoutes.SIGNUP,
      page: ()=>SignUpPage(),
      binding: SignUpBinding(),
    ),

    GetPage(
      name: AppRoutes.KNOWLEDGE,
      page: ()=>KnowledgePage(),
      binding: KnowledgeBinding(),
    ),

    GetPage(
      name: AppRoutes.NEWS,
      page: ()=>NewsPage(),
      binding: NewsBindings(),
    ),

    GetPage(
      name: AppRoutes.LISTNEWS,
      page: ()=>ListNewsPage(),
      binding: ListNewsBindings(),
    ),

    GetPage(
      name: AppRoutes.COMMENT,
      page: ()=>CommentPage(),
      binding: CommentBindings(),
    ),
  ];
}