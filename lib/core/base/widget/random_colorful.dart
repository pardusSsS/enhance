import 'dart:math';

import 'package:enhance/core/constants/color_constans.dart';
import 'package:flutter/material.dart';

List<Color> get _color => [
      AppColors.APPCOLOR_COLORFUL_1,
      AppColors.APPCOLOR_COLORFUL_2,
      AppColors.APPCOLOR_COLORFUL_3,
      AppColors.APPCOLOR_COLORFUL_4,
    ];

Color randomColorful() {
  Random random = Random();
  int randomNumber = random.nextInt(4);
  return _color[randomNumber];
}
