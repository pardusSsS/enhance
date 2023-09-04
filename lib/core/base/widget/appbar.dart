// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:enhance/core/contants/appbar_constants.dart';
import 'package:enhance/core/contants/color_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
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
        height: MediaQuery.of(context).size.height * .1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.APPCOLOR_APPBAR),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildAppBarItems,
        ),
      ),
    );
  }
}

List<Widget> get buildAppBarItems =>
    AppBarItems.appBarItems.mapIndexed((index, item) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              buildAppBarNavigate(index);
            },
            icon: SvgPicture.asset(item['icon']!),
          ),
          Expanded(child: AutoSizeText(item["text"]!))
        ],
      );
    }).toList();

void buildAppBarNavigate(int index) {
  switch (index) {
    case 0:
      break;
    case 1:
      break;
    case 2:
      break;
    case 3:
      break;
    case 4:
      break;
    default:
      null;
  }
}
