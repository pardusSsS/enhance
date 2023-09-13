// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/colorful_filter_selector.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/contants/color_constans.dart';
import 'package:enhance/core/contants/page_constants.dart';
import 'package:enhance/view/filter/vm/filter_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends BaseState<Filter> {
  final _globalKey = GlobalKey();
  final FilterViewModel _viewModel = FilterViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView<FilterViewModel>(
        onPageBuilder: (BuildContext context, Store value) =>
            SafeArea(child: _body),
        viewModel: FilterViewModel());
  }

  Widget get _body => Column(
        children: <Widget>[
          topBar(context: context, title: "Filters", svgPath: AppPages.TICK),
          _imageBody,
          _filterBar
        ],
      );

  Widget get _topBar => Container(
        margin: EdgeInsets.only(
            left: dynamicWidth(.05),
            right: dynamicWidth(.05),
            top: dynamicHeight(.01)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 25,
            ),
            const Text("Filters",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                )),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppPages.TICK),
            ),
          ],
        ),
      );

  Widget get _imageBody => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsetsDirectional.symmetric(
            horizontal: dynamicWidth(.05), vertical: dynamicHeight(.05)),
        height: dynamicHeight(.5),
        width: dynamicWidth(1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ValueListenableBuilder(
            valueListenable: _viewModel.filterColor,
            builder: (BuildContext context, Color color, Widget? child) {
              return _buildImage(color);
            },
          ),
        ),
      );

  ClipRRect _buildImage(Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: RepaintBoundary(
        key: _globalKey,
        child: CachedNetworkImage(
          imageUrl: 'https://googleflutter.com/sample_image.jpg',
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.contain,
          placeholder: (context, url) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget get _filterBar => Container(
        key: const Key("ColorFilterBar"),
        margin: EdgeInsetsDirectional.symmetric(horizontal: dynamicWidth(.05)),
        width: dynamicWidth(1),
        height: dynamicHeight(.1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.APPCOLOR_BLUE_3.withOpacity(.6)),
        child: FilterSelector(
          onFilterChanged: _viewModel.onFilterChanged,
          filters: _viewModel.filters,
        ),
      );
}
