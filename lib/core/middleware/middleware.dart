import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monami/core/constant/routes.dart';
import 'package:monami/core/services/services.dart';

class MyMiddleware extends GetMiddleware {
  int? get priority => 1;

  MyServices myServices = Get.find();

  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == "3") {
      return RouteSettings(name: AppRoutes.add_edata_users);
    }
    
     if (myServices.sharedPreferences.getString('step') == "4") {
      return RouteSettings(name: AppRoutes.homepage);
    }
    
     if (myServices.sharedPreferences.getString('step') == "5") {
      return RouteSettings(name: AppRoutes.Homescreenprof);
    }


    if (myServices.sharedPreferences.getString('step') == "1") {
      return RouteSettings(name: AppRoutes.login);
    }
    
    if (myServices.sharedPreferences.getString('step') == "2") {
      return RouteSettings(name: AppRoutes.LoginProf);
    
    }
    return null;
  }
}
