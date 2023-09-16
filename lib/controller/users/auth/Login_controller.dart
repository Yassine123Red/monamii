import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monami/core/class/statusrequest.dart';
import 'package:monami/core/constant/routes.dart';
import 'package:monami/core/function/handlingDatacontroller.dart';
import 'package:monami/core/services/services.dart';
import 'package:monami/data/datasource/remote/auth/login.dart';

abstract class Logincontroller extends GetxController {
  login();
  goToSingUp();
  goToForgetPassword();
  logouat();
}

class LogincontrollerImp extends Logincontroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  LoginData loginData = LoginData(Get.find());
  List data = [];

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;
  StatusRequest? statusRequest;

  MyServices myServices = Get.find();

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(password.text, email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          // if (response['data']['users_approve'] == "1") {
            // myServices.sharedPreferences
            //     .setInt("id", response['data']['id']);
            // myServices.sharedPreferences
            //     .setString("username", response['data']['users_name']);
            // myServices.sharedPreferences
            //     .setString("email", response['data']['users_email']);
            myServices.sharedPreferences.setString("step", "4");
            Get.offNamed(AppRoutes.homepage);
          // } 
        } else {
          Get.defaultDialog(title: 'Warning', middleText: 'not connect');
          statusRequest = StatusRequest.failute;
        }
      }
      update();
    }
  }

  @override
  goToSingUp() {
    Get.toNamed(AppRoutes.singUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  logouat() {
    myServices.sharedPreferences.clear();
    Get.toNamed(AppRoutes.chesirLogin);
  }
}
