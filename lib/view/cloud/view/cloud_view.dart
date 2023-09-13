// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/random_colorful.dart';
import 'package:enhance/core/contants/app_icons_constants.dart';
import 'package:enhance/core/contants/color_constans.dart';
import 'package:enhance/core/contants/page_constants.dart';
import 'package:enhance/view/cloud/vm/cloud_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

class Cloud extends StatefulWidget {
  const Cloud({super.key});

  @override
  _CloudState createState() => _CloudState();
}

class _CloudState extends BaseState<Cloud> {
  @override
  Widget build(BuildContext context) {
    return BaseView<CloudViewModel>(
        onPageBuilder: (BuildContext context, Store value) => SafeArea(
              child: _body,
            ),
        viewModel: CloudViewModel());
  }

  Widget get _body => Column(
        children: <Widget>[
          topBar(context: context, title: "Cloud", width: 60, height: 60),
          _folderBody
        ],
      );

  Widget get _folderBody => Container(
        margin: EdgeInsetsDirectional.symmetric(
            vertical: dynamicHeight(.05), horizontal: dynamicWidth(.05)),
        width: dynamicWidth(1),
        height: dynamicHeight(.65),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.APPCOLOR_NAVBAR),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_newFolderButton, _folderGrid],
        ),
      );

  Widget get _newFolderButton => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.APPICON_WHITE_FOLDER_ADD),
          ),
        ],
      );

  Widget get _folderGrid => Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: dynamicWidth(.025)),
        width: dynamicWidth(.9),
        height: dynamicHeight(.5),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            _folder(title: "Travel"),
            _folder(title: "Work"),
            _folder(title: "My Family"),
            _folder(title: "Friends"),
            _folder(
                title: "Workkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"),
            _folder(title: "My Family"),
          ],
        ),
      );

  Widget _folder({required String title}) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: randomColorful()),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              AppIcons.APPICON_WHITE_FOLDER,
              width: 30,
              height: 30,
            ),
            Flexible(
                child: AutoSizeText.rich(
              TextSpan(text: title),
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      ),
    );
  }
}
