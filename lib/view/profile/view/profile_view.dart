// ignore_for_file: library_private_types_in_public_api

import 'package:enhance/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends BaseState<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("profile"),
    );
  }
}
