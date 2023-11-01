import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thietthach_app/pages/application/application_bindings.dart';

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
  ];
}