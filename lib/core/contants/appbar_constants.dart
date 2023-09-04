// ignore_for_file: non_constant_identifier_names, constant_identifier_names

//appbar constants
class AppBarItems {
  static const String APPBAR_FILTER_SVG = "assets/images/svg/filter.svg";
  static const String APPBAR_RESIZE_SVG = "assets/images/svg/resize.svg";
  static const String APPBAR_ENHANCE_SVG = "assets/images/svg/enhance.svg";
  static const String APPBAR_CLOUD_SVG = "assets/images/svg/cloud.svg";
  static const String APPBAR_PROFILE_SVG = "assets/images/svg/profile.svg";

//appbar constants list
  static List<Map<String, String>> appBarItems = [
    buildAppBarItemMap(icon: AppBarItems.APPBAR_FILTER_SVG, text: 'Filters'),
    buildAppBarItemMap(icon: AppBarItems.APPBAR_RESIZE_SVG, text: 'Resize'),
    buildAppBarItemMap(icon: AppBarItems.APPBAR_ENHANCE_SVG, text: 'Enhance'),
    buildAppBarItemMap(icon: AppBarItems.APPBAR_CLOUD_SVG, text: 'Cloud'),
    buildAppBarItemMap(icon: AppBarItems.APPBAR_PROFILE_SVG, text: 'Profile'),
  ];
}

//appbar constant item map for show front
Map<String, String> buildAppBarItemMap(
    {required String icon, required String text}) {
  return {"icon": icon, "text": text};
}
