import 'package:enhance/core/constants/color_constans.dart';
import 'package:flutter/material.dart';
import 'package:image_compare_slider/image_compare_slider.dart';

Widget enahancedImageBody(
    {required BuildContext context,
    required Key key,
    required Image unenhImage,
    required Image enhImage}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.APPCOLOR_BLUE_3),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * .4,
    margin: EdgeInsetsDirectional.symmetric(
        horizontal: MediaQuery.of(context).size.width * (.05),
        vertical: MediaQuery.of(context).size.height * (.05)),
    child: _buildImage(key: key, unenhImage: unenhImage, enhImage: enhImage),
  );
}

Widget _buildImage(
    {required Key key, required Image unenhImage, required Image enhImage}) {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ImageCompareSlider(
        itemOne: unenhImage,
        itemTwo: enhImage,
      ),
    ),
  );

  //  ClipRRect(
  //   borderRadius: BorderRadius.circular(20),
  //   child: RepaintBoundary(
  //     key: key,
  //     child: image,
  //   ),
  // );
}
