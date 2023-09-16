import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monami/bindings/initialBinding.dart';
import 'package:monami/core/localization/changelocal.dart';
import 'package:monami/core/services/services.dart';
import 'package:monami/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/localization/translation.dart';

late SharedPreferences sharedPref ; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await InitialiServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      // home: depar(),
      // initialBinding: Mybinding(),
      initialBinding:  initialBindings(),
      // routes: routes,
      getPages: routes,
    );
  }
}
