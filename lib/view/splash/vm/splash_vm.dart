import 'package:enhance/core/base/service/firestore_service.dart';
import 'package:enhance/core/constants/route_constants.dart';
import 'package:enhance/core/init/navigation/navigator_service.dart';
import 'package:mobx/mobx.dart';
part 'splash_vm.g.dart';

class SplashViewModel = SplashViewBase with _$SplashViewModel;

abstract class SplashViewBase with Store {
  Future<void> controlToken() async {
    FirestoreService service = FirestoreService();
    await service.anonimLogin();
    await service.userUsageCheck();
    await Future.delayed(const Duration(seconds: 5));
    NavigationService.instance.navigateToReset(RouteConstants.HOME);
  }

  onInit() {
    Future.microtask(() async {
      await controlToken();
      Future.delayed(const Duration(seconds: 1));
    });
  }
}
