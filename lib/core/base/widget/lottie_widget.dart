import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieCustomWidget extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  const LottieCustomWidget(
      {super.key,
      required this.path,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(path, width: width, height: height);
  }
}
