// ignore_for_file: library_private_types_in_public_api

import 'package:enhance/core/base/state/base_state.dart';
import 'package:enhance/core/base/view/base_widget.dart';
import 'package:enhance/core/base/widget/common_top_bar.dart';
import 'package:enhance/core/base/widget/indicator.dart';
import 'package:enhance/core/base/widget/lottie_widget.dart';
import 'package:enhance/core/constants/app_icons_constants.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:enhance/core/constants/navbar_constants.dart';
import 'package:enhance/core/constants/user_constants.dart';
import 'package:enhance/view/profile/vm/profile_vm.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends BaseState<Profile> {
  int touchedIndex = 0;
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
        onModelReady: () {
          Future.microtask(() => setState(() {
                data = AppUserConst.sumUserUsages();
              }));
        },
        onPageBuilder: (BuildContext context, Store value) =>
            SafeArea(child: _body),
        viewModel: ProfileViewModel());
  }

  Widget get _body => Column(
        children: <Widget>[
          topBar(width: 60, height: 60, context: context, title: "Profile"),
          //_profileImage,

          _buildChartArea(),
          _listBody,
        ],
      );

  Widget _buildChartArea() {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: dynamicHeight(.05)),
      child: Row(
        children: [
          _buildChart(),
          _buildChartIndicator(),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  Expanded _buildChart() {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.3,
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(),
          )),
        ),
      ),
    );
  }

  Column _buildChartIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Indicator(
          color: AppColors.APPCOLOR_COLORFUL_1,
          text: "Enhance (${AppUserConst.enhanceLimit.toString()})",
          isSquare: true,
        ),
        const SizedBox(
          height: 4,
        ),
        Indicator(
          color: AppColors.APPCOLOR_COLORFUL_2,
          text: "Text to image (${AppUserConst.textToImageLimit.toString()})",
          isSquare: true,
        ),
        const SizedBox(
          height: 4,
        ),
        Indicator(
          color: AppColors.APPCOLOR_COLORFUL_3,
          text: "Text to speech (${AppUserConst.textToSpeechLimit.toString()})",
          isSquare: true,
        ),
        const SizedBox(
          height: 4,
        ),
        Indicator(
          color: AppColors.APPCOLOR_COLORFUL_4,
          text: "Converter (${AppUserConst.converterLimit.toString()})",
          isSquare: true,
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }

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
        margin: EdgeInsetsDirectional.symmetric(
            horizontal: dynamicWidth(.05), vertical: dynamicHeight(.05)),
        height: dynamicHeight(.3),
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

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.APPCOLOR_COLORFUL_1,
            value: data["enhance"],
            title: "%${data["enhance"]}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              NavBarItems.NAVBAR_ENHANCE_SVG,
              size: widgetSize,
              borderColor: AppColors.APPCOLOR_COLORFUL_1,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.APPCOLOR_COLORFUL_2,
            value: data["textToImage"],
            title: "%${data["textToImage"]}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              NavBarItems.NAVBAR_ENHANCE_SVG,
              size: widgetSize,
              borderColor: AppColors.APPCOLOR_COLORFUL_2,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.APPCOLOR_COLORFUL_3,
            value: data["textToSpeech"],
            title: "%${data["textToSpeech"]}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              NavBarItems.NAVBAR_ENHANCE_SVG,
              size: widgetSize,
              borderColor: AppColors.APPCOLOR_COLORFUL_3,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.APPCOLOR_COLORFUL_4,
            value: data["converter"],
            title: "%${data["converter"]}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              NavBarItems.NAVBAR_ENHANCE_SVG,
              size: widgetSize,
              borderColor: AppColors.APPCOLOR_COLORFUL_4,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }

  List<List<dynamic>> get _cardContents => [
        [AppColors.APPCOLOR_COLORFUL_1, "Buy to limit"],
        [AppColors.APPCOLOR_COLORFUL_2, "Favorites"],
        [AppColors.APPCOLOR_COLORFUL_3, "Subscribe"],
        [AppColors.APPCOLOR_COLORFUL_4, "Rate us"],
      ];
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}
