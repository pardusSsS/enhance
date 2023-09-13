// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enhance_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EnhanceViewModel on EnhanceViewBase, Store {
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

  late final _$pickImageAsyncAction =
      AsyncAction('EnhanceViewBase.pickImage', context: context);

  @override
  Future<void> pickImage() {
    return _$pickImageAsyncAction.run(() => super.pickImage());
  }

  late final _$EnhanceViewBaseActionController =
      ActionController(name: 'EnhanceViewBase', context: context);

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
editImage: ${editImage}
    ''';
  }
}
