import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:thietthach_app/routes/names.dart';
import 'package:thietthach_app/routes/pages.dart';

import 'colors/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions firebaseOptions = const FirebaseOptions(
      apiKey: "AIzaSyDsSDfkbfLH7mmTMY3FkPk85GaRjlXbGxE",
      appId: "1:628961127152:android:6676f101f18ffca7057035",
      messagingSenderId: "628961127152",
      projectId: "arhousepj",
      storageBucket: "arhousepj.appspot.com"
  );
  await Firebase.initializeApp(options:firebaseOptions);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      initialRoute: AppRoutes.SIGNIN,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
