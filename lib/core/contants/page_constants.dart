import 'package:enhance/core/base/vm/base_vm.dart';
import 'package:enhance/view/cloud/view/cloud_view.dart';
import 'package:enhance/view/enhance/view/enhance_view.dart';
import 'package:enhance/view/filter/view/filter_view.dart';
import 'package:enhance/view/profile/view/profile_view.dart';
import 'package:enhance/view/resize/view/resize_view.dart';
import 'package:flutter/material.dart';

class AppPages {
  static List<Widget> appMainPages = [
    Filter(),
    Resize(),
    Enhance(),
    Cloud(),
    Profile()
  ];
}
