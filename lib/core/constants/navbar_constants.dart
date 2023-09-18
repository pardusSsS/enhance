// ignore_for_file: non_constant_identifier_names, constant_identifier_names

//appbar constants
import 'package:flutter/material.dart';

class NavBarItems {
  static const String NAVBAR_FILTER_SVG = "assets/images/svg/filter.svg";
  static const String NAVBAR_RESIZE_SVG = "assets/images/svg/resize.svg";
  static const String NAVBAR_ENHANCE_SVG = "assets/images/svg/enhance.svg";
  static const String NAVBAR_CLOUD_SVG = "assets/images/svg/cloud.svg";
  static const String NAVBAR_PROFILE_SVG = "assets/images/svg/profile.svg";

  static const int NAVBAR_FILTER_INDEX = 0;
  static const int NAVBAR_RESIZE_INDEX = 1;
  static const int NAVBAR_ENHANCE_INDEX = 2;
  static const int NAVBAR_CLOUD_INDEX = 3;
  static const int NAVBAR_PROFILE_INDEX = 4;

//appbar constants list
  static List<Map<String, dynamic>> appBarItems = [
    buildNavBarItemMap(
        key: const Key("filters"), icon: NAVBAR_FILTER_SVG, text: 'Filters'),
    buildNavBarItemMap(
        key: const Key("resize"), icon: NAVBAR_RESIZE_SVG, text: 'Resize'),
    buildNavBarItemMap(
        key: const Key("enhance"), icon: NAVBAR_ENHANCE_SVG, text: 'Enhance'),
    buildNavBarItemMap(
        key: const Key("textToImage"),
        icon: NAVBAR_CLOUD_SVG,
        text: 'Text to \nimage'),
    buildNavBarItemMap(
        key: const Key("profile"), icon: NAVBAR_PROFILE_SVG, text: 'Profile'),
  ];
}

//appbar constant item map for show front
Map<String, dynamic> buildNavBarItemMap(
    {required String icon, required String text, required Key key}) {
  return {"icon": icon, "text": text, "key": key};
}
