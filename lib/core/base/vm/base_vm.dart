import 'package:enhance/core/constants/navbar_constants.dart';
import 'package:enhance/core/constants/page_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'base_vm.g.dart';

class BaseViewModel = BaseViewBase with _$BaseViewModel;

abstract class BaseViewBase with Store {
  @observable
  int navBarChoosedIndex = NavBarItems.NAVBAR_ENHANCE_INDEX;

  @action
  void changeNavBarIndex({required int index}) {
    navBarChoosedIndex = index;
    if (AppPages.appPageController.hasClients) {
      AppPages.appPageController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
  }
}
