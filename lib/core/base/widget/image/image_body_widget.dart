// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:enhance/core/components/empty_lottie.dart';
import 'package:enhance/core/constants/color_constans.dart';
import 'package:flutter/material.dart';

Widget imageBody(
    {required BuildContext context,
    required Key key,
    required String imagePath}) {
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
    child: _buildImage(key: key, imagePath: imagePath),
  );
}

ClipRRect _buildImage({required Key key, required String imagePath}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: RepaintBoundary(
      key: key,
      child: Image.file(
        File(imagePath),
        colorBlendMode: BlendMode.color,
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget nullImageBody({required BuildContext context}) {
  return Container(
      child: buildEmptyLottie(
          width: MediaQuery.of(context).size.width * (.6),
          height: MediaQuery.of(context).size.height * (.5)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.APPCOLOR_BLUE_3));
}
