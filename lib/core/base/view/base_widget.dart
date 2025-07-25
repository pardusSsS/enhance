// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function()? onModelReady;
  final VoidCallback? onDispose;

  const BaseView(
      {Key? key,
      required this.onPageBuilder,
      required this.viewModel,
      this.onModelReady,
      this.onDispose})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends BaseState<BaseView> {
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) widget.onModelReady!();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: dynamicWidth(1),
        height: dynamicHeight(1),
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        color: AppColors.APPCOLOR_BLUE_4,
        child: widget.onPageBuilder(context, widget.viewModel),
      ),
    );
  }
}
