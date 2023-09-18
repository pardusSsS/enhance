// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/colorful_filter_selector.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/image/image_body_widget.dart';
import 'package:enhance/core/constants/app_constants.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:enhance/view/filter/vm/filter_vm.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends BaseState<Filter> {
  final FilterViewModel _viewModel = FilterViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView<FilterViewModel>(
        onPageBuilder: (BuildContext context, Store value) =>
            SafeArea(child: _body),
        viewModel: FilterViewModel());
  }

  Widget get _body => Stack(
        children: <Widget>[
          topBar(
              height: 60,
              width: 60,
              context: context,
              title: "Filters",
              lastIconPath: AppIcons.APPLOTTIE_TICK),
          AppConst.imagePath != null
              ? Positioned(
                  right: dynamicWidth(.05),
                  left: dynamicWidth(.05),
                  bottom: dynamicHeight(.3),
                  child: _imageBody,
                )
              : Positioned(
                  right: dynamicWidth(.05),
                  left: dynamicWidth(.05),
                  bottom: dynamicHeight(.4),
                  child: nullImageBody(context: context)),
          _filterBar
        ],
      );

  Widget get _imageBody => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsetsDirectional.symmetric(
            horizontal: dynamicWidth(.05), vertical: dynamicHeight(.05)),
        height: dynamicHeight(.5),
        width: dynamicWidth(1),
        child: ValueListenableBuilder(
          valueListenable: _viewModel.filterColor,
          builder: (BuildContext context, Color color, Widget? child) {
            return _buildImage(color);
          },
        ),
      );

  ClipRRect _buildImage(Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: RepaintBoundary(
        key: const Key("filterImage"),
        child: Image.file(
          File(AppConst.imagePath!),
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget get _filterBar => Positioned(
        bottom: dynamicHeight(.2),
        right: dynamicWidth(.05),
        left: dynamicWidth(.05),
        child: Container(
          key: const Key("ColorFilterBar"),
          width: dynamicWidth(1),
          height: dynamicHeight(.1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.APPCOLOR_BLUE_3.withOpacity(.6)),
          child: FilterSelector(
            onFilterChanged: _viewModel.onFilterChanged,
            filters: _viewModel.filters,
          ),
        ),
      );
}
