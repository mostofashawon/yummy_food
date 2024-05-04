import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yummy_food/module/base/controllers/base_controller.dart';
import 'package:yummy_food/module/utill/app_size.dart';

import '../../bookmark/view/bookmark_view.dart';
import '../../home/view/home_view.dart';
import '../../utill/app_color.dart';

class BaseView extends GetView<BaseController> {
   BaseView({super.key});


  final screens = [
    HomeView(),
    BookMarkView()
  ];

   final BaseController controller = Get.put(BaseController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      bottomNavigationBar: SizedBox(
        height: Platform.isIOS ? screenHeight * 0.10 : screenHeight * 0.08,
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                controller.currentIndex.value = 0;
             
              },
              child: 
             Obx(() => Container(
               height: 50,
               width: 50,
               decoration: BoxDecoration(
                   color:   controller.currentIndex.value == 0 ? AppColors.colorOrange : AppColors.colorLightWhite,
                   borderRadius: BorderRadius.circular(15.0)
               ),
               child: Center(
                 child: Icon(
                   Icons.home,
                   color:   controller.currentIndex.value == 0 ? AppColors.colorLightWhite : AppColors.colorBlack,
                 ),
               ),

             ),)
            ),
            GestureDetector(
              onTap: (){
                controller.currentIndex.value = 1;
              
              },
              child: 
               Obx(() =>  Container(
                 height: 50,
                 width: 50,
                 decoration: BoxDecoration(
                     color: controller.currentIndex.value == 1 ? AppColors.colorOrange : AppColors.colorLightWhite,
                     borderRadius: BorderRadius.circular(15.0)
                 ),
                 child: Center(
                   child: Icon(
                     Icons.save_as_outlined,
                     color: controller.currentIndex.value == 1 ? AppColors.colorLightWhite : AppColors.colorBlack,
                   ),
                 ),

               ),)
            ),
          ],
        ),
      ),
      body: Obx(() => screens[controller.currentIndex.value]),
    ));
  }
}

