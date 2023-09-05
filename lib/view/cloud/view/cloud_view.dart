// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Cloud extends StatefulWidget {
  const Cloud({super.key});

  @override
  _CloudState createState() => _CloudState();
}

class _CloudState extends State<Cloud> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("cloud"),
    );
  }
}
