import 'package:enhance/core/contants/route_constants.dart';
import 'package:enhance/core/init/navigation/navigator_service.dart';
import 'package:mobx/mobx.dart';
part 'splash_vm.g.dart';

class SplashViewModel = SplashViewBase with _$SplashViewModel;

abstract class SplashViewBase with Store {
  Future<void> controlToken() async {
    await Future.delayed(const Duration(seconds: 5));
    NavigationService.instance.navigateToReset(RouteConstants.HOME);
  }

  onInit() {
    Future.microtask(() {
      controlToken();
      Future.delayed(const Duration(seconds: 1));
    });
  }
}
