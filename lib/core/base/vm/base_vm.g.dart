// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseViewModel on BaseViewBase, Store {
  late final _$navBarChoosedIndexAtom =
      Atom(name: 'BaseViewBase.navBarChoosedIndex', context: context);

  @override
  int get navBarChoosedIndex {
    _$navBarChoosedIndexAtom.reportRead();
    return super.navBarChoosedIndex;
  }

  @override
  set navBarChoosedIndex(int value) {
    _$navBarChoosedIndexAtom.reportWrite(value, super.navBarChoosedIndex, () {
      super.navBarChoosedIndex = value;
    });
  }

  late final _$BaseViewBaseActionController =
      ActionController(name: 'BaseViewBase', context: context);

  @override
  void changeNavBarIndex({required int index}) {
    final _$actionInfo = _$BaseViewBaseActionController.startAction(
        name: 'BaseViewBase.changeNavBarIndex');
    try {
      return super.changeNavBarIndex(index: index);
    } finally {
      _$BaseViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
navBarChoosedIndex: ${navBarChoosedIndex}
    ''';
  }
}
