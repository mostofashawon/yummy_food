import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:yummy_food/module/db_helper/sqflite_helper.dart';

class BookMarkController extends GetxController{


  RxList recipeList = <Map<String,dynamic>>[].obs;
  RxBool isRecipeFetchLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchRecipeListFromLocal();
  }


  // Fetch Recipe from Local DB
  Future<void> fetchRecipeListFromLocal() async {
    isRecipeFetchLoading.value = true;
      final data = await SQLHelper.getRecipe();
      recipeList.value = data;
    isRecipeFetchLoading.value = false;
  }
}