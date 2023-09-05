// ignore_for_file: non_constant_identifier_names, constant_identifier_names

//appbar constants
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
  static List<Map<String, String>> appBarItems = [
    buildNavBarItemMap(icon: NAVBAR_FILTER_SVG, text: 'Filters'),
    buildNavBarItemMap(icon: NAVBAR_RESIZE_SVG, text: 'Resize'),
    buildNavBarItemMap(icon: NAVBAR_ENHANCE_SVG, text: 'Enhance'),
    buildNavBarItemMap(icon: NAVBAR_CLOUD_SVG, text: 'Cloud'),
    buildNavBarItemMap(icon: NAVBAR_PROFILE_SVG, text: 'Profile'),
  ];
}

//appbar constant item map for show front
Map<String, String> buildNavBarItemMap(
    {required String icon, required String text}) {
  return {"icon": icon, "text": text};
}
