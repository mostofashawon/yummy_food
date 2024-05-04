import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yummy_food/module/component/custom_snackbar.dart';
import 'package:yummy_food/module/home/controllers/home_controller.dart';
import 'package:yummy_food/module/home/view/recipe_details_view.dart';
import 'package:yummy_food/module/utill/app_constant.dart';
import 'package:yummy_food/module/utill/app_size.dart';

import '../../bookmark/controllers/bookmark_controller.dart';
import '../../component/app_loder.dart';
import '../../component/title_text.dart';
import '../../utill/app_color.dart';

class HomeView extends GetView<HomeController> {
   HomeView({super.key});

   final HomeController controller = Get.put(HomeController());
   final BookMarkController bookMarkController = Get.put(BookMarkController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorLightWhite.withOpacity(0.5),
      appBar: AppBar(
        title: Image.asset(kAppLogo),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                  height: 60,
                  width: screenWidth,
                  margin: const EdgeInsets.only(
                      left: 10,
                      right: 10
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.colorLightGrey.withOpacity(0.3),

                      ),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 5.0),
                    child: TextFormField(
                      controller: controller.searchController,
                      decoration: const InputDecoration(
                        hintText: "Write Recipe Name",
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(left: 8.0,top: 8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        border: InputBorder.none,

                      ),
                      onChanged: (value){
                        controller.getRecipeList();
                      },
                    ),
                  )

              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => (controller.recipe.value.results?.length ?? 0) == 0 ?
              Container(): Expanded(child:
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.recipe.value.results!.length,
                  itemBuilder: (context , index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: GestureDetector(
                        onTap: () async {
                          controller.recipeId.value =
                          controller.recipe.value.results![index].id.toString();
                          Get.to(
                              () =>  const RecipeDetailsView(),
                          );
                        },
                        child: Container(
                          height: screenHeight * 0.25,
                          width: screenWidth,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight:Radius.circular(15.0),
                                topLeft :Radius.circular(15.0),
                              ),

                          ),
                          child:
                           Stack(
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   ClipRRect(
                                       borderRadius: const BorderRadius.only(
                                           topRight:Radius.circular(15.0),
                                           topLeft :Radius.circular(15.0)
                                       ),
                                       child:  FadeInImage(
                                         image: NetworkImage(
                                           controller.recipe.value.results![index].image.toString(),
                                         ),
                                         placeholder: const AssetImage(
                                           kAppDefaultImage,
                                         ),
                                         height: 150,
                                         width: screenWidth,
                                         fit: BoxFit.cover,
                                         imageErrorBuilder: (context,
                                             error, stackTrace) {
                                           return Image(
                                             height: 150,
                                             width: screenWidth,
                                             fit: BoxFit.cover,
                                             image: const AssetImage(kAppDefaultImage),
                                           );
                                         },
                                       )
                                   ),
                                   const SizedBox(
                                     height: 10,
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 12.0),
                                     child: TitleText(title: controller.recipe.value.results![index].title.toString())

                                   )
                                 ],
                               ),
                               Positioned(
                                 top: 10,
                                   right: 10,
                                   child: GestureDetector(
                                     onTap: () async {
                                       if( bookMarkController.recipeList.any((element) => element["recipeId"].toString() ==  controller.recipe.value.results![index].id.toString(),)){

                                         showSnackBar("Warning", "Recipe Already Saved", AppColors.colorOrange, SnackPosition.BOTTOM);

                                       }
                                       else {
                                         await controller.saveRecipe(
                                           controller.recipe.value.results![index].title.toString(),
                                           controller.recipe.value.results![index].image.toString(),
                                           controller.recipe.value.results![index].id,
                                         );
                                         await bookMarkController.fetchRecipeListFromLocal();
                                       }
                                     },
                                     child:
                                      Obx(() => Container(
                                        height: 45,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color:  AppColors.colorLightWhite,
                                            borderRadius: BorderRadius.circular(12.0)
                                        ),
                                        child:  Center(
                                          child: Icon(
                                            Icons.bookmark,
                                            size: 24,
                                            color: bookMarkController.recipeList.value.any((element) => element["recipeId"].toString() == controller.recipe.value.results![index].id.toString()) == true ?
                                            AppColors.colorOrange : AppColors.colorBlack,

                                          ),
                                        ),
                                      ),)
                                   ))
                             ],
                           )
                        ),
                      ),
                    );
                  })
              )
              )
            ],
          ),
          Obx(() => controller.isRecipeNetworkLoading.value == true ?
          const Align(
            alignment: Alignment.center,
            child: AppLoader(),
          ) : Container()
          )
        ],
      )
    ));
  }
}
