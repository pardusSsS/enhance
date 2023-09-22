import 'dart:io';

import 'package:enhance/core/base/service/firestore_service.dart';
import 'package:enhance/core/base/vm/base_vm.dart';
import 'package:enhance/core/init/navigation/navigator_route_service.dart';
import 'package:enhance/core/init/navigation/navigator_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBZoiMnr2B5XqEqDOSQhY7Fum9ZDahWKN8",
              appId: "1:610708732750:android:05aa74dd5ba083d4effc1f",
              messagingSenderId: "610708732750",
              projectId: "ai-project-38ba6"))
      : await Firebase.initializeApp();
}

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
