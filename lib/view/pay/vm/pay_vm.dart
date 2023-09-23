import 'package:mobx/mobx.dart';
part 'pay_vm.g.dart';

class PayViewModel = PayViewBase with _$PayViewModel;

abstract class PayViewBase with Store {
  @observable
  int enhanceCount = 0;
  @observable
  int textToImageCount = 0;
  @observable
  int textToSpeechCount = 0;
  @observable
  int converterCount = 0;

  @action
  void addEnhanceCount() {
    enhanceCount += 1;
  }

  @action
  void removeEnhanceCount() {
    if (enhanceCount > 0) enhanceCount -= 1;
  }

  @action
  void addTextToImageCount() {
    textToImageCount += 1;
  }

  @action
  void removeTextToImageCount() {
    if (textToImageCount > 0) textToImageCount -= 1;
  }

  @action
  void addTextToSpeechCount() {
    textToSpeechCount += 1;
  }

  @action
  void removeTextToSpeechCount() {
    if (textToSpeechCount > 0) textToSpeechCount -= 1;
  }

  @action
  void addConverterCount() {
    converterCount += 1;
  }

  @action
  void removeConverterCount() {
    if (converterCount > 0) converterCount -= 1;
  }
}
