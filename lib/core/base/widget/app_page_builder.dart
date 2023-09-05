// ignore_for_file: non_constant_identifier_names

import 'package:enhance/core/base/vm/base_vm.dart';
import 'package:enhance/core/base/widget/navbar.dart';
import 'package:enhance/core/contants/page_constants.dart';
import 'package:flutter/material.dart';

class AppPagesBuilder extends StatefulWidget {
  AppPagesBuilder({Key? key}) : super(key: key);
  @override
  State<AppPagesBuilder> createState() => _AppPagesBuilderState();
}

class _AppPagesBuilderState extends State<AppPagesBuilder> {
  final BaseViewModel _baseViewModel = BaseViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [AppPagesBody(), NavBarWidget()],
    );
  }

  Widget AppPagesBody() {
    return PageView(
      controller: _baseViewModel.appPageController,
      onPageChanged: (index) {
        _baseViewModel.changeNavBarIndex(index: index);
      },
      children: AppPages.appMainPages,
    );
  }
}
