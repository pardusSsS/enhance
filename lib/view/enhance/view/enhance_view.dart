// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, prefer_final_fields, sort_child_properties_last, use_build_context_synchronously, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/image/enhance_image_body_widget.dart';
import 'package:enhance/core/base/widget/image/image_body_widget.dart';
import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/base/widget/random_colorful.dart';
import 'package:enhance/core/base/widget/wait_dialog/wait_dialog.dart';
import 'package:enhance/core/constants/app_constants.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:enhance/core/init/save_image/save_image_to_gallery.dart';
import 'package:enhance/view/enhance/vm/enhance_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class Enhance extends StatefulWidget {
  const Enhance({super.key});

  @override
  _EnhanceState createState() => _EnhanceState();
}

class _EnhanceState extends BaseState<Enhance> {
  EnhanceViewModel _viewModel = EnhanceViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView<EnhanceViewModel>(
        onPageBuilder: (BuildContext context, Store value) => _body,
        onModelReady: () async {
          if (AppConst.imagePath != null) {
            await _viewModel.onInit();
          }
        },
        viewModel: EnhanceViewModel());
  }

  Widget get _body => Observer(builder: (context) {
        return Column(
          children: <Widget>[
            topBar(
                leadingOnTap: () {
                  _viewModel.removeImage();
                  setState(() {});

                  if (_viewModel.editImage == null) {}
                },
                onTap: () {
                  if (AppConst.enhangedImage != null) {
                    dialogBuilder(
                        context, saveImageToGallery(AppConst.enhangedImage!));
                  }
                },
                width: 60,
                height: 60,
                context: context,
                title: "Enhance",
                lastIconPath: AppConst.enhangedImage != null
                    ? AppIcons.APPLOTTIE_DOWNLOAD
                    : null,
                leadingIconPath: AppConst.imagePath != null
                    ? AppIcons.APPLOTTIE_CROSS
                    : null),
            //start image body
            _viewModel.editImage != null || AppConst.imagePath != null
                ? _buildImage(context)
                : buildChooseImageButton,
            //end image body

            _viewModel.editImage != null || AppConst.imagePath != null
                ? _buildSizedBox()
                : const SizedBox(
                    width: 0,
                  ),
            SizedBox(
              height: dynamicHeight(.01),
            ),
            _viewModel.editImage != null || AppConst.imagePath != null
                ? _buildInterpolationBox()
                : const SizedBox(
                    width: 0,
                  ),
            _viewModel.editImage != null || AppConst.imagePath != null
                ? _buildEnhanceStartButton
                : const SizedBox(
                    width: 0,
                  ),
          ],
        );
      });

  Widget _buildImage(BuildContext context) {
    return SizedBox(
      child:
          _viewModel.enhancedEditImage != null || AppConst.enhangedImage != null
              ? enahancedImageBody(
                  context: context,
                  key: const Key("enhancedImage"),
                  image: Image.memory(
                      _viewModel.enhancedEditImage ?? AppConst.enhangedImage!))
              : imageBody(
                  context: context,
                  key: const Key("unEnhanceImage"),
                  imagePath: _viewModel.editImage ?? AppConst.imagePath!),
    );
  }

  Widget _buildInterpolationBox() {
    return Observer(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _interPolationButton(
              onTap: () => _viewModel.updateEnhanceNumber(2),
              interpolation: "x2"),
          _interPolationButton(
              onTap: () => _viewModel.updateEnhanceNumber(4),
              interpolation: "x4"),
          _interPolationButton(
              onTap: () => _viewModel.updateEnhanceNumber(8),
              interpolation: "x8"),
          _interPolationButton(
              onTap: () => _viewModel.updateEnhanceNumber(10),
              interpolation: "x10"),
        ],
      );
    });
  }

  Observer _buildSizedBox() {
    return Observer(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _sizeBox(size: _viewModel.width ?? 0),
          const LottieCustomWidget(
              path: AppIcons.APPLOTTIE_SIZE_CROSS, width: 45, height: 45),
          _sizeBox(size: _viewModel.height ?? 0),
        ],
      );
    });
  }

  Widget get buildChooseImageButton => SizedBox(
        width: dynamicWidth(1),
        height: dynamicHeight(.8),
        child: Center(
          child: GestureDetector(
            onTap: () => _viewModel.pickImage(),
            child: Container(
                width: dynamicWidth(.4),
                height: dynamicHeight(.1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.APPCOLOR_BLUE_2.withOpacity(.1)),
                child: const LottieCustomWidget(
                  path: AppIcons.APPLOTTIE_PLUS_PURPLE,
                  width: 45,
                  height: 45,
                )),
          ),
        ),
      );

  Widget _sizeBox({required int size}) {
    return Container(
      width: dynamicWidth(.2),
      height: dynamicHeight(.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.APPCOLOR_BLUE_2),
      child: Center(
          child: Text(
        size.toString(),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      )),
    );
  }

  Widget _interPolationButton(
      {required Function()? onTap, required String interpolation}) {
    Color color = randomColorful();
    return IconButton(
      onPressed: onTap,
      icon: Container(
          child: Center(
            child: AutoSizeText.rich(
              TextSpan(text: interpolation),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          width: 100,
          height: 100,
          decoration: BoxDecoration(boxShadow: [
            interpolation.contains(_viewModel.enhanceNumber.toString())
                ? BoxShadow(
                    color: color,
                    blurRadius: 20.0, // soften the shadow
                    spreadRadius: 8.0, //extend the shadow
                    offset: const Offset(
                      2.0, // Move to right 5  horizontally
                      2.0, // Move to bottom 5 Vertically
                    ),
                  )
                : const BoxShadow()
          ], borderRadius: BorderRadius.circular(12), color: color)),
    );
  }

  Widget get _buildEnhanceStartButton => GestureDetector(
        onTap: () {
          dialogBuilder(context, _viewModel.enhanceImageService());
        },
        child: Container(
          height: dynamicHeight(.05),
          width: dynamicWidth(.2),
          margin: EdgeInsets.only(top: dynamicHeight(.05)),
          decoration: BoxDecoration(
              color: randomColorful(), borderRadius: BorderRadius.circular(12)),
          child: const Center(
              child: Text(
            "Start",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          )),
        ),
      );
}
