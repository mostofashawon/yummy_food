


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utill/app_color.dart';

showSnackBar(String title,String message,Color backgroundColor,SnackPosition snackPosition){
  return  Get.snackbar(
    title,
    message,
    colorText:AppColors.colorLightWhite,
    backgroundColor: backgroundColor,
    snackPosition: snackPosition,
  );
}