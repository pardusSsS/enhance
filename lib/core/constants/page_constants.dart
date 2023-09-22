// ignore_for_file: constant_identifier_names

import 'package:enhance/core/constants/navbar_constants.dart';
import 'package:enhance/view/cloud/view/cloud_view.dart';
import 'package:enhance/view/convert/view/converter_view.dart';
import 'package:enhance/view/enhance/view/enhance_view.dart';
import 'package:enhance/view/profile/view/profile_view.dart';
import 'package:enhance/view/speech/view/speech_view.dart';
import 'package:flutter/material.dart';

class AppPages {
  static const String BACK_ARROW = "assets/images/svg/back-arrow.svg";
  static const String TICK = "assets/images/svg/tick.svg";

  static PageController appPageController =
      PageController(initialPage: NavBarItems.NAVBAR_ENHANCE_INDEX);
  static List<Widget> appMainPages = [
    Speech(),
    Converter(),
    Enhance(),
    Cloud(),
    Profile()
  ];
}
