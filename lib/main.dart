import 'package:enhance/core/base/widget/app_page_builder.dart';
import 'package:enhance/view/enhance/view/enhance_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(body: AppPagesBuilder()),
    );
  }
}
