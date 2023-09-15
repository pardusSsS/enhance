// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/image/image_body_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    return BaseView<ResizeViewModel>(
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
        ],
      );
}
