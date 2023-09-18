// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CloudViewModel on CloudViewBase, Store {
  late final _$textToImagePathAtom =
      Atom(name: 'CloudViewBase.textToImagePath', context: context);

  @override
  String? get textToImagePath {
    _$textToImagePathAtom.reportRead();
    return super.textToImagePath;
  }

  @override
  set textToImagePath(String? value) {
    _$textToImagePathAtom.reportWrite(value, super.textToImagePath, () {
      super.textToImagePath = value;
    });
  }

  late final _$CloudViewBaseActionController =
      ActionController(name: 'CloudViewBase', context: context);

  @override
  void updateCachedImage({required String path}) {
    final _$actionInfo = _$CloudViewBaseActionController.startAction(
        name: 'CloudViewBase.updateCachedImage');
    try {
      return super.updateCachedImage(path: path);
    } finally {
      _$CloudViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textToImagePath: ${textToImagePath}
    ''';
  }
}
