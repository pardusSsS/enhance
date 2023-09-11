// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'filter_vm.g.dart';

class FilterViewModel = FilterViewBase with _$FilterViewModel;

abstract class FilterViewBase with Store {
  final filterColor = ValueNotifier<Color>(Colors.white);

//colorful filter items
  final filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  void onFilterChanged(Color value) {
    filterColor.value = value;
  }
}
