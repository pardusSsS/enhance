import 'package:enhance/core/base/widget/app_page_builder.dart';
import 'package:enhance/core/contants/route_constants.dart';
import 'package:enhance/core/init/navigation/not_found.dart';
import 'package:enhance/core/init/navigation/transitions/fade_route.dart';
import 'package:enhance/view/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class NavigationRouteManager {
  static dynamic onRouteGenerate(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case RouteConstants.HOME:
        return _navigateToDefault(AppPagesBuilder(), settings);
      case RouteConstants.SPLASH:
        return _navigateToFadeDefault(const Splash(), settings);
      case RouteConstants.BACK:
        _previousScreen(context);
        return null;
      default:
        return MaterialPageRoute(
            builder: (_) => const NotFoundNavigationWidget());
    }
  }

  NavigationRouteManager._init();

  static MaterialPageRoute _navigateToDefault(
      Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }

  static PageRoute _navigateToFadeDefault(Widget page, RouteSettings settings) {
    return FadeRoute(page: page, settings: settings);
  }

  static _previousScreen(BuildContext context) {
    return Navigator.pop(context);
  }
}
