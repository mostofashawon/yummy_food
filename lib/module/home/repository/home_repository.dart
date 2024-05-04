import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/connect.dart';

import '../../utill/app_constant.dart';
import '../model/receipe_model.dart';
import 'package:http/http.dart' as http;

import '../model/recipe_details_model.dart';

class HomeRepository extends GetConnect {


  Future<ReceipeModel?> fetchRecipeList(String searchRecipe) async {

    final url = Uri.parse('${BASE_URL}complexSearch?query=$searchRecipe');
    var response = await http.get(
      url,
      headers: {
        "X-RapidAPI-Key" : "1a2bd7d529msh513ba3b70195a79p1acf77jsned01ab52cffa"
      }
    );


    debugPrint("status code....."+response.statusCode.toString());
    debugPrint('log me'+response.body);


    if (response.statusCode == 200) {
      debugPrint("log me ....."+response.body);
      return receipeModelFromJson(response.body.toString());
    } else if (response.statusCode == 400) {
      throw const HttpException('Error');
    } else {
      throw const HttpException('Error');
    }
  }


  Future<ReceipeDetailModel?> fetchRecipeDetail(String recipeId) async {

    final url = Uri.parse('${BASE_URL}$recipeId/information');
    var response = await http.get(
        url,
        headers: {
          "X-RapidAPI-Key" : "1a2bd7d529msh513ba3b70195a79p1acf77jsned01ab52cffa"
        }
    );


    debugPrint("status code....."+response.statusCode.toString());
    debugPrint('log me '+response.body);


    if (response.statusCode == 200) {
      debugPrint("log me .."+response.body);
      return receipeDetailModelFromJson(response.body.toString());
    } else if (response.statusCode == 400) {
      throw const HttpException('Error');
    } else {
      throw const HttpException('Error');
    }
  }
}