// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resize_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResizeViewModel on ResizeViewBase, Store {
  late final _$widthAtom = Atom(name: 'ResizeViewBase.width', context: context);

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
      Atom(name: 'ResizeViewBase.height', context: context);

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

  late final _$onInitAsyncAction =
      AsyncAction('ResizeViewBase.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  @override
  String toString() {
    return '''
width: ${width},
height: ${height}
    ''';
  }
}
