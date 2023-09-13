// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/image_body_widget.dart';
import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/base/widget/random_colorful.dart';
import 'package:enhance/core/contants/app_constants.dart';
import 'package:enhance/core/contants/app_icons_constants.dart';
import 'package:enhance/core/contants/color_constans.dart';
import 'package:enhance/view/resize/vm/resize_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class Resize extends StatefulWidget {
  const Resize({super.key});

  @override
  _ResizeState createState() => _ResizeState();
}

class _ResizeState extends BaseState<Resize> {
  ResizeViewModel _viewModel = ResizeViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView<ResizeViewModel>(
        onModelReady: () async {
          if (AppConst.imagePath != null) {
            await _viewModel.onInit();
            print(_viewModel.width);
            print(_viewModel.height);
          }
        },
        onPageBuilder: (BuildContext context, Store value) =>
            SafeArea(child: _body),
        viewModel: ResizeViewModel());
  }

  Widget get _body => Column(
        children: <Widget>[
          topBar(height: 60, width: 60, context: context, title: "Resize"),
          AppConst.imagePath != null
              ? imageBody(
                  context: context,
                  key: const Key("resizeImage"),
                  imagePath: AppConst.imagePath!)
              : Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      vertical: dynamicHeight(.05),
                      horizontal: dynamicWidth(.05)),
                  child: nullImageBody(context: context)),
          Observer(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _sizeBox(size: _viewModel.width ?? 0),
                const LottieCustomWidget(
                    path: AppIcons.APPLOTTIE_SIZE_CROSS, width: 45, height: 45),
                _sizeBox(size: _viewModel.height ?? 0),
              ],
            );
          }),
          SizedBox(
            height: dynamicHeight(.01),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _interPolationButton(onTap: null, interpolation: "x2"),
              _interPolationButton(onTap: null, interpolation: "x4"),
              _interPolationButton(onTap: null, interpolation: "x8"),
            ],
          ),
        ],
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
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: randomColorful())),
    );
  }
}
