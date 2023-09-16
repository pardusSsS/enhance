import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/contants/app_icons_constants.dart';
import 'package:enhance/core/contants/color_constans.dart';
import 'package:flutter/material.dart';

dialogBuilder(BuildContext context) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: AppColors.APPCOLOR_BLUE_4.withOpacity(.8),
        title: const LottieCustomWidget(
          path: AppIcons.APPLOTTIE_AI,
          width: 80,
          height: 80,
        ),
        content: const Text(
          'Lütfen Bekleyiniz\n'
          'Uygulamadan çıkmayınız...',
          textAlign: TextAlign.center,
        ),
      );
    },
  );
}
