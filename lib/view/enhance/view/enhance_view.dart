// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/contants/app_icons_constants.dart';
import 'package:enhance/core/contants/color_constans.dart';
import 'package:enhance/view/enhance/vm/enhance_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

class Enhance extends StatefulWidget {
  const Enhance({super.key});

  @override
  _EnhanceState createState() => _EnhanceState();
}

class _EnhanceState extends BaseState<Enhance> {
  @override
  Widget build(BuildContext context) {
    return BaseView<EnhanceViewModel>(
        onPageBuilder: (BuildContext context, Store value) =>
            buildChooseImageButton,
        viewModel: EnhanceViewModel());
  }

  Widget get buildChooseImageButton => Center(
        child: Container(
          width: dynamicWidth(.4),
          height: dynamicHeight(.1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.APPCOLOR_BLUE_2.withOpacity(.1)),
          child: SvgPicture.asset(
            AppIcons.APPICON_CIRCLE_PLUS,
            fit: BoxFit.none,
          ),
        ),
      );
}
