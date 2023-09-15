// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enhance_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EnhanceViewModel on EnhanceViewBase, Store {
  late final _$enhanceNumberAtom =
      Atom(name: 'EnhanceViewBase.enhanceNumber', context: context);

  @override
  int get enhanceNumber {
    _$enhanceNumberAtom.reportRead();
    return super.enhanceNumber;
  }

  @override
  set enhanceNumber(int value) {
    _$enhanceNumberAtom.reportWrite(value, super.enhanceNumber, () {
      super.enhanceNumber = value;
    });
  }

  late final _$editImageAtom =
      Atom(name: 'EnhanceViewBase.editImage', context: context);

  @override
  String? get editImage {
    _$editImageAtom.reportRead();
    return super.editImage;
  }

  @override
  set editImage(String? value) {
    _$editImageAtom.reportWrite(value, super.editImage, () {
      super.editImage = value;
    });
  }

  late final _$enhancedEditImageAtom =
      Atom(name: 'EnhanceViewBase.enhancedEditImage', context: context);

  @override
  Uint8List? get enhancedEditImage {
    _$enhancedEditImageAtom.reportRead();
    return super.enhancedEditImage;
  }

  @override
  set enhancedEditImage(Uint8List? value) {
    _$enhancedEditImageAtom.reportWrite(value, super.enhancedEditImage, () {
      super.enhancedEditImage = value;
    });
  }

  late final _$widthAtom =
      Atom(name: 'EnhanceViewBase.width', context: context);

  @override
  int? get width {
    _$widthAtom.reportRead();
    return super.width;
  }

  @override
  set width(int? value) {
    _$widthAtom.reportWrite(value, super.width, () {
      super.width = value;
    });
  }

  late final _$heightAtom =
      Atom(name: 'EnhanceViewBase.height', context: context);

  @override
  int? get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(int? value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  late final _$pickImageAsyncAction =
      AsyncAction('EnhanceViewBase.pickImage', context: context);

  @override
  Future<void> pickImage() {
    return _$pickImageAsyncAction.run(() => super.pickImage());
  }

  late final _$enhancedImageAsyncAction =
      AsyncAction('EnhanceViewBase.enhancedImage', context: context);

  @override
  Future<void> enhancedImage(Uint8List imageData) {
    return _$enhancedImageAsyncAction.run(() => super.enhancedImage(imageData));
  }

  late final _$onInitAsyncAction =
      AsyncAction('EnhanceViewBase.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  late final _$EnhanceViewBaseActionController =
      ActionController(name: 'EnhanceViewBase', context: context);

  @override
  void updateEnhanceNumber(int num) {
    final _$actionInfo = _$EnhanceViewBaseActionController.startAction(
        name: 'EnhanceViewBase.updateEnhanceNumber');
    try {
      return super.updateEnhanceNumber(num);
    } finally {
      _$EnhanceViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeImage() {
    final _$actionInfo = _$EnhanceViewBaseActionController.startAction(
        name: 'EnhanceViewBase.removeImage');
    try {
      return super.removeImage();
    } finally {
      _$EnhanceViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enhanceNumber: ${enhanceNumber},
editImage: ${editImage},
enhancedEditImage: ${enhancedEditImage},
width: ${width},
height: ${height}
    ''';
  }
}
