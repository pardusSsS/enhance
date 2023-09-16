// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resize_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResizeViewModel on ResizeViewBase, Store {
  late final _$toFileKindAtom =
      Atom(name: 'ResizeViewBase.toFileKind', context: context);

  @override
  String get toFileKind {
    _$toFileKindAtom.reportRead();
    return super.toFileKind;
  }

  @override
  set toFileKind(String value) {
    _$toFileKindAtom.reportWrite(value, super.toFileKind, () {
      super.toFileKind = value;
    });
  }

  late final _$fileKindAtom =
      Atom(name: 'ResizeViewBase.fileKind', context: context);

  @override
  String get fileKind {
    _$fileKindAtom.reportRead();
    return super.fileKind;
  }

  @override
  set fileKind(String value) {
    _$fileKindAtom.reportWrite(value, super.fileKind, () {
      super.fileKind = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: 'ResizeViewBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$ResizeViewBaseActionController =
      ActionController(name: 'ResizeViewBase', context: context);

  @override
  void updateFileKind({required String kind}) {
    final _$actionInfo = _$ResizeViewBaseActionController.startAction(
        name: 'ResizeViewBase.updateFileKind');
    try {
      return super.updateFileKind(kind: kind);
    } finally {
      _$ResizeViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedIndex({required int index, required String selectedItem}) {
    final _$actionInfo = _$ResizeViewBaseActionController.startAction(
        name: 'ResizeViewBase.updateSelectedIndex');
    try {
      return super
          .updateSelectedIndex(index: index, selectedItem: selectedItem);
    } finally {
      _$ResizeViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
toFileKind: ${toFileKind},
fileKind: ${fileKind},
selectedIndex: ${selectedIndex}
    ''';
  }
}
