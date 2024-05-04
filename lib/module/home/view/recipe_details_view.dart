import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yummy_food/module/utill/app_color.dart';

import '../../bookmark/controllers/bookmark_controller.dart';
import '../../component/app_loder.dart';
import '../../component/custom_snackbar.dart';
import '../../component/title_text.dart';
import '../../utill/app_constant.dart';
import '../../utill/app_size.dart';
import '../controllers/home_controller.dart';

class RecipeDetailsView extends StatefulWidget {
   const RecipeDetailsView({super.key});



  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {

  final HomeController controller = Get.put(HomeController());
  final BookMarkController bookMarkController = Get.put(BookMarkController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
          body:
        Obx(() => controller.isRecipeDetailNetworkLoading.value == true ?
        const Center(child: AppLoader()) :
        CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              floating: false,
              stretch: true,
              expandedHeight: screenHeight * 0.70,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        child:
                        Container(
                          height: screenHeight * 0.30,
                          color: Colors.transparent,
                          child:
                          ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)),
                              child:
                              FadeInImage(
                                image: NetworkImage(
                                  controller.recipeDetail.value.image.toString(),
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
                        )

                    ),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () async {

                            if( bookMarkController.recipeList.any((element) => element["recipeId"].toString() == controller.recipeDetail.value.id.toString())){
                              showSnackBar("Warning", "Recipe Already Saved", AppColors.colorOrange, SnackPosition.BOTTOM);
                            }
                            else {
                              await controller.saveRecipe(
                                controller.recipeDetail.value.title.toString(),
                                controller.recipeDetail.value.image.toString(),
                                controller.recipeDetail.value.id,
                              );
                              await bookMarkController.fetchRecipeListFromLocal();

                            }

                          },
                          child: Container(
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
                                color: bookMarkController.recipeList.any((element) => element["recipeId"].toString() == controller.recipeDetail.value.id.toString()) == true ?
                                AppColors.colorOrange : AppColors.colorBlack,
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                      top: screenHeight * 0.22,
                      left: 15.0,
                      right: 15.0,
                      child: Container(
                        height: screenHeight * 0.40,
                        width: screenWidth,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0)
                            ),
                            color: AppColors.colorLightWhite
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0,top: 12.0),
                              child: TitleText(title: controller.recipeDetail.value.title.toString())
                            ),
                            Row(
                              children: [

                                const Padding(
                                    padding: EdgeInsets.only(left: 12.0,top: 12.0),
                                    child: Icon(
                                        Icons.timer_outlined,
                                        color: AppColors.colorLightGrey
                                    )
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,top: 12.0),
                                  child: Text(
                                    "${controller.recipeDetail.value.cookingMinutes} mins",
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.020,
                                        color: AppColors.colorLightGrey
                                    ),

                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0,top: 12.0),
                              child: Text(
                                "Ingredients",
                                style: TextStyle(
                                    fontSize: screenHeight * 0.020,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.colorBlack
                                ),

                              ),
                            ),
                            Expanded(child:


                            controller.recipeDetail.value.extendedIngredients!.isEmpty ?


                            Text("No Ingredients found !!!",
                              style: TextStyle(
                                  fontSize: screenHeight * 0.017,
                                  color: AppColors.colorLightGrey
                              ),
                            ) :

                            ListView.builder(
                                itemCount: controller.recipeDetail.value.extendedIngredients!.length,
                                itemBuilder: (context , index){
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 5.0,bottom: 5.0),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          height: 15,
                                          width: 3,
                                          color: AppColors.colorPaste,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(controller.recipeDetail.value.extendedIngredients![index].nameClean.toString(),
                                          style: TextStyle(
                                              fontSize: screenHeight * 0.017,
                                              color: AppColors.colorLightGrey
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            controller.recipeDetail.value.analyzedInstructions!.isEmpty ?

            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return  Center(
                    child: Text("No Instruction found !!!",
                      style: TextStyle(
                          fontSize: screenHeight * 0.017,
                          color: AppColors.colorOrange
                      ),
                    ),
                  );
                },
                childCount: 1, // Number of list items
              ),
            )

            :

            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Step ${controller.recipeDetail.value.analyzedInstructions![0].steps[index].number}",
                          style: TextStyle(
                              fontSize: screenHeight * 0.020,
                              color: index.isEven ? AppColors.colorPaste : AppColors.colorOrange,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          controller.recipeDetail.value.analyzedInstructions![0].steps[index].step.toString(),
                          style: TextStyle(
                              fontSize: screenHeight * 0.020,
                              color: AppColors.colorBlack
                          ),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.recipeDetail.value.analyzedInstructions![0].steps![index].ingredients!.length,
                          itemBuilder: (context , stepIndex){
                            return
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                    child:
                                    FadeInImage(
                                      image: NetworkImage(
                                        controller.recipeDetail.value.analyzedInstructions![0].steps![index].ingredients![stepIndex].image.toString(),
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
                              );
                          }),
                      const SizedBox(
                        height: 15,
                      )

                    ],
                  );
                },
                childCount: controller.recipeDetail.value.analyzedInstructions![0].steps.length, // Number of list items
              ),
            )

          ],
        ),)
    ));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     await controller.getRecipeDetail();
    });
    super.initState();
  }
}
