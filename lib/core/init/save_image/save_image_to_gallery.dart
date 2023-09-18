import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

Future<bool> saveImageToGallery(Uint8List image) async {
  final token = RootIsolateToken.instance;

  return await compute(_saveImageInIsolate, [image, token]);
}

Future<bool> _saveImageInIsolate(List<Object?> args) async {
  Uint8List image = args[0] as Uint8List;
  dynamic token = args[1];
  BackgroundIsolateBinaryMessenger.ensureInitialized(token);
  Completer<bool> completer = Completer<bool>();
  try {
    var currentImage = img.decodeImage(image);
    Uint8List? newImage;
    // Get the documents directory
    final appDocDir = await getApplicationDocumentsDirectory();
    // Generate a unique file name for the JPG image
    final fileName = '${DateTime.now().toIso8601String()}.png';
    // Create the file path by combining the directory and file name
    final filePath = '${appDocDir.path}/$fileName';
    newImage = img.encodePng(currentImage!);
    // Write the JPG image to the file
    File(filePath).writeAsBytesSync(newImage);
    final result = await ImageGallerySaver.saveFile(filePath);
    if (result['isSuccess']) {
      File(filePath).delete();
      completer.complete(true);
    } else {
      completer.complete(false);
    }
  } catch (e) {
    print(e);
    completer.completeError(false);
  }
  return completer.future;
}
