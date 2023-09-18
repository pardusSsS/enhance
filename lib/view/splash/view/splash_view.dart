// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_final_fields

import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:enhance/view/splash/vm/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends BaseState<Splash> {
  SplashViewModel _viewModel = SplashViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: _viewModel.onInit(),
      onPageBuilder: (BuildContext context, Store value) => _body,
      viewModel: SplashViewModel(),
    );
  }

  Widget get _body => SizedBox(
        width: dynamicWidth(1),
        height: dynamicHeight(1),
        child: Center(
          child: LottieCustomWidget(
            path: AppIcons.APPLOTTIE_AI,
            height: dynamicWidth(.3),
            width: dynamicWidth(.3),
          ),
        ),
      );
}
