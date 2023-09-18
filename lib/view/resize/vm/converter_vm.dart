import 'dart:io';

import 'package:enhance/core/constants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'converter_vm.g.dart';

class ConverterViewModel = ConverterViewBase with _$ConverterViewModel;

abstract class ConverterViewBase with Store {
  @observable
  String toFileKind = 'JPEG';
  @observable
  String fileKind = 'JPEG';
  @observable
  int selectedIndex = 0;
  @observable
  String? convertedFilePath;
  @observable
  bool converterStatus = false;
  @action
  void updateFileKind({required String kind}) {
    toFileKind = kind;
  }

  @action
  void updateConverterStatus({required bool status}) {
    AppConst.converterStatus = status;
    converterStatus = status;
  }

  @action
  void updateSelectedIndex({required int index, required String selectedItem}) {
    selectedIndex = index;
    updateFileKind(kind: selectedItem);
  }

  @action
  void onInit() {
    if (AppConst.imagePath != null || AppConst.enhangedImage != null) {
      fileKind = getImageType(AppConst.enhangedImage ??
          File(AppConst.imagePath!).readAsBytesSync());
    }
  }

  @action
  void updateConvertedFilePath({String? filePath, required bool status}) {
    if (status) {
      AppConst.convertedImagePath = filePath;
      convertedFilePath = filePath;
      print("conv im convertedFilePath: " + convertedFilePath.toString());
    } else {
      convertedFilePath = null;
    }
  }

  String getImageType(Uint8List bytes) {
    if (bytes.length < 3) {
      return 'Unknown'; // The bytes are too short to identify the image type
    }

    if (bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF) {
      return 'JPEG';
    } else if (bytes[0] == 0x89 && bytes[1] == 0x50 && bytes[2] == 0x4E) {
      return 'PNG';
    } else if (bytes[0] == 0x47 && bytes[1] == 0x49 && bytes[2] == 0x46) {
      return 'GIF';
    } else if (bytes[0] == 0x42 && bytes[1] == 0x4D) {
      return 'BMP';
    } else if (bytes[0] == 0x49 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x2A &&
        bytes[3] == 0x00) {
      return 'TIFF';
    } else if (bytes[0] == 0x00 &&
        bytes[1] == 0x00 &&
        bytes[2] == 0x01 &&
        bytes[3] == 0x00) {
      return 'ICO';
    } else {
      return 'Unknown';
    }
  }
}
