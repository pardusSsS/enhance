import 'package:enhance/core/contants/navbar_constants.dart';
import 'package:enhance/core/contants/page_constants.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'base_vm.g.dart';

class BaseViewModel = BaseViewBase with _$BaseViewModel;

abstract class BaseViewBase with Store {
  @observable
  int navBarChoosedIndex = NavBarItems.NAVBAR_ENHANCE_INDEX;

  @observable
  PageController appPageController =
      PageController(initialPage: NavBarItems.NAVBAR_ENHANCE_INDEX);

  @action
  void changeNavBarIndex({required int index}) {
    navBarChoosedIndex = index;
    print(appPageController);
    if (appPageController.hasClients) {
      appPageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      print(navBarChoosedIndex);
    }
  }
}
