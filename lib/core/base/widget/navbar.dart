// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:enhance/core/base/vm/base_vm.dart';
import 'package:enhance/core/contants/navbar_constants.dart';
import 'package:enhance/core/contants/color_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarWidget extends StatelessWidget {
  final BaseViewModel _baseViewModel = BaseViewModel();
  @override
  Widget build(BuildContext context) {
    return buildAppBar(context);
  }

  Widget buildAppBar(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 8,
      left: 8,
      child: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(vertical: 23, horizontal: 23),
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * .09,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.APPCOLOR_NAVBAR),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavBarItems,
        ),
      ),
    );
  }

  List<Widget> get buildNavBarItems =>
      NavBarItems.appBarItems.mapIndexed((index, item) {
        return Observer(
          builder: (context) => buildNavBarItem(index, item),
        );
      }).toList();

  Column buildNavBarItem(int index, Map<String, String> item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: _baseViewModel.navBarChoosedIndex == index
                ? AppColors.APPCOLOR_NAVBAR.withOpacity(.3)
                : Colors.transparent,
          ),
          child: IconButton(
            onPressed: () {
              buildNavBarNavigate(index);
            },
            icon: SvgPicture.asset(item['icon']!),
          ),
        ),
        Expanded(child: AutoSizeText(item["text"]!))
      ],
    );
  }

  void buildNavBarNavigate(int index) {
    switch (index) {
      case 0:
        _baseViewModel.changeNavBarIndex(index: index);
        break;
      case 1:
        _baseViewModel.changeNavBarIndex(index: index);
        break;
      case 2:
        _baseViewModel.changeNavBarIndex(index: index);
        break;
      case 3:
        _baseViewModel.changeNavBarIndex(index: index);
        break;
      case 4:
        _baseViewModel.changeNavBarIndex(index: index);
        break;
      default:
        null;
    }
  }
}
