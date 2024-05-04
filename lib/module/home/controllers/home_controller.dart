import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:yummy_food/module/db_helper/sqflite_helper.dart';

import '../model/receipe_model.dart';
import '../model/recipe_details_model.dart';
import '../repository/home_repository.dart';

class HomeController extends GetxController{

  TextEditingController searchController = TextEditingController();
  RxBool isRecipeNetworkLoading = false.obs;
  var recipe = ReceipeModel().obs;


  RxBool isRecipeDetailNetworkLoading = false.obs;
  var recipeDetail = ReceipeDetailModel().obs;
  RxString recipeId = "".obs;



  // Fetch Recipe Based on User Search

  Future<void> getRecipeList() async {

    isRecipeNetworkLoading.value = true;
    try {
      await HomeRepository().fetchRecipeList(searchController.text).then((result) async {

        recipe.value = result!;

        isRecipeNetworkLoading.value = false;

      }).catchError((error) {
        isRecipeNetworkLoading.value = false;
        debugPrint(" catchError $error");
      });
    } on HttpException {
      debugPrint("catchError");
    } finally {
      isRecipeNetworkLoading.value = false;
    }
  }


  // Fetch Recipe Detail Based on recipe

  Future<void> getRecipeDetail() async {

    isRecipeDetailNetworkLoading.value = true;
    try {
      await HomeRepository().fetchRecipeDetail(recipeId.value).then((result) async {

        recipeDetail.value = result!;
        isRecipeDetailNetworkLoading.value = false;


      }).catchError((error) {
        isRecipeDetailNetworkLoading.value = false;
        debugPrint(" catchError $error");
      });
    } on HttpException {
      debugPrint("catchError");
    } finally {
      isRecipeDetailNetworkLoading.value = false;
    }
  }

  // Save Recipe in Local DB

  Future<void> saveRecipe(
      String title,
      String image,
      int? recipeId
      ) async {

    Map<String, dynamic> recipeInfo = {
      "recipeId" : recipeId,
      "title" : title,
      "image" : image
    };
    await SQLHelper.insertRecipe(recipeInfo);
  }
}