import 'package:enhance/core/base/widget/app_page_builder.dart';
import 'package:enhance/core/init/navigation/navigator_route_service.dart';
import 'package:enhance/core/init/navigation/navigator_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      onGenerateRoute: (settings) =>
          NavigationRouteManager.onRouteGenerate(settings, context),
      navigatorKey: NavigationService.instance.navigatorKey,
      title: 'Enhance',
    );
  }
}
