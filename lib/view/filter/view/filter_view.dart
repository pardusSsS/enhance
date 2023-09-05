// ignore_for_file: library_private_types_in_public_api

import 'package:enhance/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends BaseState<Filter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text("Filter")
    );
  }
}
