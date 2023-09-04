import 'package:mobx/mobx.dart';
part 'enhance_vm.g.dart';

class EnhanceViewModel = EnhanceViewBase with _$EnhanceViewModel;

abstract class EnhanceViewBase with Store {}
