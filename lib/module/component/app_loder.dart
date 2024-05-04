
import 'package:flutter/material.dart';

import '../utill/app_color.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.colorOrange,
    );
  }
}
