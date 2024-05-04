import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_food/module/splash_screen/controllers/splash_screen_controller.dart';
import 'package:yummy_food/module/utill/app_constant.dart';

import '../../utill/app_size.dart';

class SplashScreenView extends GetView<SplashScreenController> {
   SplashScreenView({super.key});

   final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    controller.splashScreenDuration();
    return const Scaffold(
          body:  Center(
            child:
            Image(
              image: AssetImage(kAppLogo),
              height: 100,
              width: 100,
            ),
          ),
    );
  }
}
