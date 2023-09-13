import 'dart:io';

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
    if (AppConst.imagePath != null) {
      final File imageFile = File(AppConst.imagePath!);
      final Uint8List bytes = await imageFile.readAsBytes();

      // Use the bytes to decode the image
      final decodedImage = await decodeImageFromList(bytes);

      // Retrieve width and height
      width = decodedImage.width;
      height = decodedImage.height;
    }
  }
}
