import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:flutter/material.dart';

Center buildEmptyLottie({required double width, required double height}) {
  return Center(
    child: LottieCustomWidget(
        path: AppIcons.APPLOTTIE_EMPTY, width: width, height: height),
  );
}
