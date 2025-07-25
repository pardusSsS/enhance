import 'dart:typed_data';

import 'package:enhance/core/constants/color_constans.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget cachedImageBody(
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
  print(imagePath);
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: RepaintBoundary(
        key: key,
        child: CachedNetworkImage(
          imageUrl: imagePath,
          placeholder: (context, url) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )

        // Image.network(
        //   imagePath,
        //   loadingBuilder: (BuildContext context, Widget child,
        //       ImageChunkEvent? loadingProgress) {
        //     print("loadingprog: $loadingProgress");
        //     if (loadingProgress == null) {
        //       // Image has finished loading, return the child widget (the image).
        //       return child;
        //     } else {
        //       // Image is still loading, return a loading indicator or placeholder.
        //       return const Center(child: CircularProgressIndicator());
        //     }
        //   },
        // ),

        // Image.file(
        //   File(imagePath),
        //   colorBlendMode: BlendMode.color,
        //   fit: BoxFit.contain,
        // ),

        // Image.memory(
        //   imagePath,
        //   errorBuilder:
        //       (BuildContext context, Object error, StackTrace? stackTrace) {
        //     print("Error loading image: $error");
        //     return const Center(
        //         child:
        //             Icon(Icons.error)); // Replace with your custom error widget.
        //   },
        // ),
        ),
  );
}
