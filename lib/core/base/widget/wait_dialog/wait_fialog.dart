import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/contants/color_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:ndialog/ndialog.dart';

import '../../../contants/app_icons_constants.dart';

dialogBuilder(BuildContext context, Future onInit) {
  DefaultCacheManager().emptyCache();
  CustomProgressDialog.future(
    context,
    future: onInit,
    loadingWidget: AlertDialog(
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
    ),
    onProgressError: (error) => print("Do something onProgressError"),
    onProgressFinish: (data) => print("Do something onProgressFinish"),
    onDismiss: () => print("Dismissed"),
  );
}
