import 'package:mobx/mobx.dart';
part 'profile_vm.g.dart';

class ProfileViewModel = ProfileViewBase with _$ProfileViewModel;

abstract class ProfileViewBase with Store {}
