import 'package:flutter/cupertino.dart';

import '../utill/app_color.dart';
import '../utill/app_size.dart';

class TitleText extends StatelessWidget {

  final String title;
  const TitleText( {super.key,required this.title});



  @override
  Widget build(BuildContext context) {
    return Text(
     title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: screenHeight * 0.020,
          fontWeight: FontWeight.bold,
          color: AppColors.colorBlack
      ),

    );
  }
}
