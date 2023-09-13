import 'package:mobx/mobx.dart';
part 'cloud_vm.g.dart';

class CloudViewModel = CloudViewBase with _$CloudViewModel;

abstract class CloudViewBase with Store {}
