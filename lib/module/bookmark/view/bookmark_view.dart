import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../component/app_loder.dart';
import '../../component/title_text.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/view/recipe_details_view.dart';
import '../../utill/app_color.dart';
import '../../utill/app_constant.dart';
import '../../utill/app_size.dart';
import '../controllers/bookmark_controller.dart';

class BookMarkView extends GetView<BookMarkController> {
   BookMarkView({super.key});


  final BookMarkController controller = Get.put(BookMarkController());

  final HomeController homeController = Get.put(HomeController());




  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Saved Recipe",
            style: TextStyle(
                fontSize: screenHeight * 0.020,
                color:  AppColors.colorPaste ,
                fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(() => controller.isRecipeFetchLoading.value == true ?
        const Center(child: AppLoader()) :

        controller.recipeList.isEmpty ?
        Center(
          child: Text("No Save Recipe found !!!",
            style: TextStyle(
                fontSize: screenHeight * 0.017,
                color: AppColors.colorOrange
            ),
          ),
        ) :
        ListView.builder(
            shrinkWrap: true,
            itemCount: controller.recipeList.length,
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: GestureDetector(
                  onTap: () async {
                    homeController.recipeId.value =
                        controller.recipeList[index]["recipeId"].toString();
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
                                      controller.recipeList![index]["image"].toString(),
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
                                child: TitleText(title: controller.recipeList![index]["title"].toString())

                              )
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              );
            }),)

    ));
  }

}

