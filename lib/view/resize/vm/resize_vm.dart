import 'package:enhance/core/contants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
part 'resize_vm.g.dart';

class ResizeViewModel = ResizeViewBase with _$ResizeViewModel;

abstract class ResizeViewBase with Store {
  @observable
  int? width;
  @observable
  int? height;

  @action
  Future<void> onInit() async {
    final byteData = await rootBundle.load(AppConst.imagePath!);
    final bytes = byteData.buffer.asUint8List();
    final decodedImage = await decodeImageFromList(bytes);

    width = decodedImage.width;
    height = decodedImage.height;
  }
}
