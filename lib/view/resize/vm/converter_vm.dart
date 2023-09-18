import 'dart:async';
import 'dart:io';

import 'package:enhance/core/contants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

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
  @action
  void updateFileKind({required String kind}) {
    toFileKind = kind;
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
      convertedFilePath = filePath;
      print("cvpath: $convertedFilePath");
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

  Future<bool> changeFileKind() async {
    Completer<bool> completer = Completer<bool>();
    if (AppConst.imagePath != null || AppConst.enhangedImage != null) {
      try {
        var currentImage = img.decodeImage(AppConst.enhangedImage ??
            File(AppConst.imagePath!).readAsBytesSync());

        Uint8List? newImage;
        // Get the documents directory
        final appDocDir = await getApplicationDocumentsDirectory();

        var fileExtens = "";
        switch (toFileKind) {
          case "JEPG":
            fileExtens = "jpg";
            newImage = img.encodeJpg(currentImage!);
            break;
          case "PNG":
            fileExtens = "png";
            newImage = img.encodePng(currentImage!);

            break;

          case "BMP":
            fileExtens = "bmp";
            newImage = img.encodeBmp(currentImage!);

            break;
          case "TIFF":
            fileExtens = "tiff";
            newImage = img.encodeTiff(currentImage!);

            break;
          case "TGA":
            fileExtens = "tga";
            newImage = img.encodeTga(currentImage!);

            break;

          case "ICO":
            fileExtens = "ico";
            currentImage =
                img.copyResize(currentImage!, width: 256, height: 256);
            newImage = img.encodeIco(currentImage);

            break;

          case "GIF":
            fileExtens = "gif";
            newImage = img.encodeGif(currentImage!);

            break;
        }

        // Generate a unique file name for the JPG image
        final fileName = '${DateTime.now().toIso8601String()}.$fileExtens';

        // Create the file path by combining the directory and file name
        final filePath = '${appDocDir.path}/$fileName';

        // Write the JPG image to the file
        File(filePath).writeAsBytesSync(newImage!);

        updateConvertedFilePath(filePath: filePath, status: true);
        completer.complete(true);
      } catch (e) {
        completer.completeError(false);
      }
    } else {
      completer.complete(false);
    }

    return completer.future;
  }

  Future<bool> saveConvertedImage() async {
    Completer<bool> completer = Completer<bool>();
    try {
      // Save the JPG image to the gallery
      final result = await ImageGallerySaver.saveFile(convertedFilePath!);

      if (result['isSuccess']) {
        print('Image saved to gallery successfully.');
        File(convertedFilePath!).delete();
        completer.complete(true);
      } else {
        completer.complete(false);
      }
    } catch (e) {
      completer.completeError(true);
    }
    return completer.future;
  }
}
