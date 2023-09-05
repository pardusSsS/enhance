// ignore_for_file: library_private_types_in_public_api

import 'package:enhance/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class Resize extends StatefulWidget {
  const Resize({super.key});

  @override
  _ResizeState createState() => _ResizeState();
}

class _ResizeState extends BaseState<Resize> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Reize"),
    );
  }
}
