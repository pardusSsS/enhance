import 'package:enhance/core/contants/color_constans.dart';
import 'package:flutter/material.dart';

Widget enahancedImageBody(
    {required BuildContext context, required Key key, required Image image}) {
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
    child: _buildImage(key: key, image: image),
  );
}

ClipRRect _buildImage({required Key key, required Image image}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: RepaintBoundary(
      key: key,
      child: image,
    ),
  );
}
