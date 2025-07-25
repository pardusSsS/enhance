// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speech_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SpeechViewModel on SpeechViewBase, Store {
  late final _$audioUrlAtom =
      Atom(name: 'SpeechViewBase.audioUrl', context: context);

  @override
  String? get audioUrl {
    _$audioUrlAtom.reportRead();
    return super.audioUrl;
  }

  @override
  set audioUrl(String? value) {
    _$audioUrlAtom.reportWrite(value, super.audioUrl, () {
      super.audioUrl = value;
    });
  }

  late final _$SpeechViewBaseActionController =
      ActionController(name: 'SpeechViewBase', context: context);

  @override
  void updateAudioUrl({required String path}) {
    final _$actionInfo = _$SpeechViewBaseActionController.startAction(
        name: 'SpeechViewBase.updateAudioUrl');
    try {
      return super.updateAudioUrl(path: path);
    } finally {
      _$SpeechViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
audioUrl: ${audioUrl}
    ''';
  }
}
