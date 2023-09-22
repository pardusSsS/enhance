import 'dart:async';
import 'dart:io';

import 'package:enhance/core/constants/app_constants.dart';
import 'package:enhance/view/convert/vm/converter_vm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import "package:image/image.dart" as img;

Future<bool> saveConvertedImage({required String path}) async {
  final token = RootIsolateToken.instance;
  return await compute(_saveConvertedImage, [path, token]);
}

Future<bool> _saveConvertedImage(List<Object?> args) async {
  String convertedFilePath = args[0] as String;
  dynamic token = args[1];
  BackgroundIsolateBinaryMessenger.ensureInitialized(token);
  Completer<bool> completer = Completer<bool>();
  try {
    // Save the JPG image to the gallery
    final result = await ImageGallerySaver.saveFile(convertedFilePath);

    if (result['isSuccess']) {
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

//////////////////

Future<dynamic> _changeFileKind(Map<String, dynamic> args) async {
  dynamic enhpath = args["enhpath"];
  dynamic token = args["token"];
  dynamic unenhpath = args["unenhpath"];
  dynamic fileKind = args["fileKind"];

  ConverterViewModel _viewModel = ConverterViewModel();
  BackgroundIsolateBinaryMessenger.ensureInitialized(token);

  Completer<dynamic> completer = Completer<dynamic>();
  try {
    img.Image? currentImage =
        img.decodeImage(enhpath ?? File(unenhpath).readAsBytesSync());
    print("cur: $currentImage");
    Uint8List? newImage;
    // Get the documents directory
    final appDocDir = await getApplicationDocumentsDirectory();

    var fileExtens = "";
    switch (fileKind) {
      case "JPEG":
        print("pngpngpn");

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
        currentImage = img.copyResize(currentImage!, width: 256, height: 256);
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
    AppConst.convertedImagePath = filePath;
    _viewModel.updateConvertedFilePath(filePath: filePath, status: true);
    completer.complete(filePath);
  } catch (e) {
    print(e);
    completer.completeError(false);
  }
  return completer.future;
}

Future<dynamic> changeFileKind(
    {Uint8List? enhpath, String? unenhpath, String? fileKind}) async {
  final token = RootIsolateToken.instance;
  Map<String, dynamic> args = {
    "enhpath": enhpath,
    "unenhpath": unenhpath,
    "fileKind": fileKind,
    "token": token
  };
  return await compute(_changeFileKind, args);
}
