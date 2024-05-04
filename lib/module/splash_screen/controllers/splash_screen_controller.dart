import 'dart:async';

import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashScreenController extends GetxController{



  void splashScreenDuration(){
    Timer(const Duration(milliseconds: 3000), () {
      Get.offNamed(Routes.BASE);
    });
  }
}