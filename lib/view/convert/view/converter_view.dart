// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, sort_child_properties_last, prefer_const_constructors, use_build_context_synchronously

import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/bottomsheet/image_format_bottomsheet.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/image/image_body_widget.dart';
import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/base/widget/wait_dialog/wait_dialog.dart';
import 'package:enhance/core/constants/app_constants.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:enhance/view/convert/service/convert_and_save_to_gallery.dart';
import 'package:enhance/view/convert/vm/converter_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends BaseState<Converter> {
  ConverterViewModel _viewModel = ConverterViewModel();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BaseView<ConverterViewModel>(
        onPageBuilder: (BuildContext context, Store value) =>
            SafeArea(child: _body()),
        viewModel: ConverterViewModel(),
        onModelReady: () {
          _viewModel.onInit();
        },
      );
    });
  }

  Widget _body() {
    return Observer(builder: (context) {
      return Column(
        children: <Widget>[
          topBar(
              height: 60,
              width: 60,
              context: context,
              title: "Converter",
              lastIconPath: _viewModel.converterStatus != false ||
                      AppConst.converterStatus != false
                  ? AppIcons.APPLOTTIE_DOWNLOAD
                  : null,
              onTap: _viewModel.converterStatus != false ||
                      AppConst.converterStatus != false
                  ? () {
                      dialogBuilder(
                          context,
                          saveConvertedImage(
                              path: AppConst.convertedImagePath!));
                    }
                  : null),
          AppConst.imagePath != null
              ? GestureDetector(
                  onTap: () {
                    _viewModel.updateConvertedFilePath(
                        status: true, filePath: AppConst.convertedImagePath);
                    print(_viewModel.convertedFilePath);
                    print(AppConst.convertedImagePath);
                  },
                  child: imageBody(
                      context: context,
                      key: const Key("resizeImage"),
                      imagePath: AppConst.imagePath!),
                )
              : Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      vertical: dynamicHeight(.05),
                      horizontal: dynamicWidth(.05)),
                  child: nullImageBody(context: context)),
          _buildSizedBox(),
          _buildEnhanceStartButton
        ],
      );
    });
  }

  Observer _buildSizedBox() {
    return Observer(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _sizeBox(),
          const LottieCustomWidget(
              path: AppIcons.APPLOTTIE_RIGHT_ARROW, width: 45, height: 45),
          _toSizeBox(
              onTap: () => ImageFormatBottomSheet(
                  context: context, viewModel: _viewModel)),
        ],
      );
    });
  }

  Widget _sizeBox({Function()? onTap}) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: dynamicWidth(.2),
          height: dynamicHeight(.05),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.APPCOLOR_BLUE_2),
          child: Center(
              child: Text(
            _viewModel.fileKind,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          )),
        ),
      );
    });
  }

  Widget _toSizeBox({Function()? onTap}) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: dynamicWidth(.2),
          height: dynamicHeight(.05),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.APPCOLOR_COLORFUL_4),
          child: Center(
              child: Text(
            _viewModel.toFileKind,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          )),
        ),
      );
    });
  }

  Widget get _buildEnhanceStartButton => GestureDetector(
        onTap: () async {
          if (AppConst.imagePath != null || AppConst.enhangedImage != null) {
            await dialogBuilder(
              context,
              changeFileKind(
                  fileKind: _viewModel.toFileKind,
                  enhpath: AppConst.enhangedImage,
                  unenhpath: AppConst.imagePath),
            );
            _viewModel.updateConverterStatus(status: true);
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: dynamicHeight(.04)),
          height: dynamicHeight(.05),
          width: dynamicWidth(.2),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColors.APPCOLOR_BLUE_1,
              borderRadius: BorderRadius.circular(12)),
          child: const Center(
              child: Text(
            "Convert",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          )),
        ),
      );
}
