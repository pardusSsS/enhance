// ignore_for_file: non_constant_identifier_names, unused_field, prefer_const_constructors_in_immutables

import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/vm/base_vm.dart';
import 'package:enhance/core/base/widget/navbar.dart';
import 'package:enhance/core/contants/page_constants.dart';
import 'package:flutter/material.dart';

class AppPagesBuilder extends StatefulWidget {
  AppPagesBuilder({Key? key}) : super(key: key);
  @override
  State<AppPagesBuilder> createState() => _AppPagesBuilderState();
}

class _AppPagesBuilderState extends BaseState<AppPagesBuilder> {
  final BaseViewModel _baseViewModel = BaseViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [AppPagesBody(), NavBarWidget()],
      ),
    );
  }

  Widget AppPagesBody() {
    return PageView(
      key: const Key("AppPagesBody"),
      controller: AppPages.appPageController,
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      children: AppPages.appMainPages,
    );
  }
}
