import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieCustomWidget extends StatelessWidget {
  final String path;
  const LottieCustomWidget({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(path);
  }
}
