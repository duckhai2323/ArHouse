import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thietthach_app/pages/alldesign/alldesign_bidings.dart';
import 'package:thietthach_app/pages/alldesign/alldesign_view.dart';
import 'package:thietthach_app/pages/application/application_bindings.dart';
import 'package:thietthach_app/pages/design_detail/designdetail_bindings.dart';
import 'package:thietthach_app/pages/design_detail/designdetail_view.dart';
import 'package:thietthach_app/pages/design_detail/image_view/imageview_bindings.dart';
import 'package:thietthach_app/pages/design_detail/image_view/imageview_page.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_bindings.dart';
import 'package:thietthach_app/pages/design_detail/viewallphotos/viewallphotos_view.dart';

import '../pages/application/application_view.dart';
import '../pages/library/library_bidings.dart';
import '../pages/library/library_view.dart';
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
  ];
}