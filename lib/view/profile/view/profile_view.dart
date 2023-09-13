// ignore_for_file: library_private_types_in_public_api

import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/contants/app_icons_constants.dart';
import 'package:enhance/core/contants/color_constans.dart';
import 'package:enhance/view/profile/vm/profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends BaseState<Profile> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
        onPageBuilder: (BuildContext context, Store value) =>
            SafeArea(child: _body),
        viewModel: ProfileViewModel());
  }

  Widget get _body => Column(
        children: <Widget>[
          topBar(width: 60, height: 60, context: context, title: "Profile"),
          _profileImage,
          _listBody
        ],
      );

  Widget get _profileImage => Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: dynamicHeight(.05)),
          child: CircleAvatar(
            radius: dynamicWidth(.2),
            backgroundColor: AppColors.APPCOLOR_BLUE_1,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(AppIcons.APPICON_PROFILE_WHITE)),
          ),
        ),
      );

  Widget get _listBody => Container(
        padding: EdgeInsets.symmetric(
            vertical: dynamicHeight(.02), horizontal: dynamicWidth(.03)),
        margin: EdgeInsetsDirectional.symmetric(horizontal: dynamicWidth(.05)),
        height: dynamicHeight(.4),
        width: dynamicWidth(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.APPCOLOR_BLUE_3.withOpacity(.4)),
        child: _list,
      );

  Widget get _list => ListView.builder(
        itemCount: _cardContents.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildListCard(
              title: _cardContents[index][1],
              color: _cardContents[index][0],
              lottie: index == _cardContents.length - 1
                  ? AppIcons.APPLOTTIE_RATE_US
                  : null);
        },
      );

  Widget _buildListCard(
      {required String title,
      Function()? onTap,
      required Color color,
      String? lottie}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: dynamicHeight(.01)),
        width: dynamicWidth(.5),
        height: dynamicHeight(.05),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: dynamicHeight(.025),
                  height: dynamicHeight(.05),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    color: color,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  lottie != null
                      ? SizedBox(
                          width: dynamicWidth(.2),
                          child: const LottieCustomWidget(
                            path: AppIcons.APPLOTTIE_RATE_US,
                            width: 45,
                            height: 45,
                          ),
                        )
                      : const SizedBox(
                          width: 0,
                        ),
                  Container(
                      margin: EdgeInsets.only(left: lottie != null ? 8 : 0),
                      child: SvgPicture.asset(AppIcons.APPICON_RIGHT_ARROW)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<List<dynamic>> get _cardContents => [
        [AppColors.APPCOLOR_COLORFUL_1, "Change Profile Photos"],
        [AppColors.APPCOLOR_COLORFUL_2, "Favorites"],
        [AppColors.APPCOLOR_COLORFUL_3, "Subscribe"],
        [AppColors.APPCOLOR_COLORFUL_4, "Rate us"],
      ];
}
