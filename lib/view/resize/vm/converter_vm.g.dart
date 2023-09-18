// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converter_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConverterViewModel on ConverterViewBase, Store {
  late final _$toFileKindAtom =
      Atom(name: 'ConverterViewBase.toFileKind', context: context);

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
      Atom(name: 'ConverterViewBase.fileKind', context: context);

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
      Atom(name: 'ConverterViewBase.selectedIndex', context: context);

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

  late final _$convertedFilePathAtom =
      Atom(name: 'ConverterViewBase.convertedFilePath', context: context);

  @override
  String? get convertedFilePath {
    _$convertedFilePathAtom.reportRead();
    return super.convertedFilePath;
  }

  @override
  set convertedFilePath(String? value) {
    _$convertedFilePathAtom.reportWrite(value, super.convertedFilePath, () {
      super.convertedFilePath = value;
    });
  }

  late final _$converterStatusAtom =
      Atom(name: 'ConverterViewBase.converterStatus', context: context);

  @override
  bool get converterStatus {
    _$converterStatusAtom.reportRead();
    return super.converterStatus;
  }

  @override
  set converterStatus(bool value) {
    _$converterStatusAtom.reportWrite(value, super.converterStatus, () {
      super.converterStatus = value;
    });
  }

  late final _$ConverterViewBaseActionController =
      ActionController(name: 'ConverterViewBase', context: context);

  @override
  void updateFileKind({required String kind}) {
    final _$actionInfo = _$ConverterViewBaseActionController.startAction(
        name: 'ConverterViewBase.updateFileKind');
    try {
      return super.updateFileKind(kind: kind);
    } finally {
      _$ConverterViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateConverterStatus({required bool status}) {
    final _$actionInfo = _$ConverterViewBaseActionController.startAction(
        name: 'ConverterViewBase.updateConverterStatus');
    try {
      return super.updateConverterStatus(status: status);
    } finally {
      _$ConverterViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedIndex({required int index, required String selectedItem}) {
    final _$actionInfo = _$ConverterViewBaseActionController.startAction(
        name: 'ConverterViewBase.updateSelectedIndex');
    try {
      return super
          .updateSelectedIndex(index: index, selectedItem: selectedItem);
    } finally {
      _$ConverterViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onInit() {
    final _$actionInfo = _$ConverterViewBaseActionController.startAction(
        name: 'ConverterViewBase.onInit');
    try {
      return super.onInit();
    } finally {
      _$ConverterViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateConvertedFilePath({String? filePath, required bool status}) {
    final _$actionInfo = _$ConverterViewBaseActionController.startAction(
        name: 'ConverterViewBase.updateConvertedFilePath');
    try {
      return super.updateConvertedFilePath(filePath: filePath, status: status);
    } finally {
      _$ConverterViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
toFileKind: ${toFileKind},
fileKind: ${fileKind},
selectedIndex: ${selectedIndex},
convertedFilePath: ${convertedFilePath},
converterStatus: ${converterStatus}
    ''';
  }
}
