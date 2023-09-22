import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/base/widget/snackbars/app_snackbars.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:enhance/view/convert/vm/converter_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:ndialog/ndialog.dart';

Future dialogBuilder(BuildContext context, Future onInit) async {
  DefaultCacheManager().emptyCache();
  CustomProgressDialog.future(
    context,
    dismissable: false,
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
    onProgressError: (error) => print("Do something onProgressError: $error"),
    onProgressFinish: (data) => print("Do something onProgressFinish"),
    onDismiss: () => print("Dismissed"),
  ).then((value) {
    if (value != false && value != true) {
      ConverterViewModel _viewModel = ConverterViewModel();
      _viewModel.updateConvertedFilePath(filePath: value, status: true);
    }
    value != false
        ? AppSnackBars.successSnackBar(context)
        : AppSnackBars.unSuccessSnackBar(context);

    return value;
  });
}
