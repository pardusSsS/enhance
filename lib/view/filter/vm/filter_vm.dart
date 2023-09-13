// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;
part 'filter_vm.g.dart';

class FilterViewModel = FilterViewBase with _$FilterViewModel;

abstract class FilterViewBase with Store {
  final filterColor = ValueNotifier<Color>(Colors.white);

//colorful filter items
  final filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  // Function to capture and save the image
  Future<void> captureAndSaveImage({required GlobalKey key}) async {
    try {
      var status = await Permission.storage.request();
      // Capture the image as a byte data
      final boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 2.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      // Save the image to the gallery
      if (byteData != null) {
        final buffer = byteData.buffer.asUint8List();
        final result =
            await ImageGallerySaver.saveImage(Uint8List.fromList(buffer));
      }
    } catch (e) {
      print('Error capturing and saving image: $e');
    }
  }

  void onFilterChanged(Color value) {
    filterColor.value = value;
  }
}
