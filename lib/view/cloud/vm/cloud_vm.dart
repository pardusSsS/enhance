// ignore_for_file: unused_field, depend_on_referenced_packages

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:enhance/core/base/widget/snackbars/app_snackbars.dart';
import 'package:enhance/core/constants/app_constants.dart';
import 'package:enhance/view/cloud/model/cloud_model.dart';
import 'package:enhance/view/cloud/service/text_to_image_service.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

part 'cloud_vm.g.dart';

class CloudViewModel = CloudViewBase with _$CloudViewModel;

abstract class CloudViewBase with Store {
  final TextToImageService _textToImageService = TextToImageService();
  @observable
  String? textToImagePath;

  @action
  void updateCachedImage({required String path}) {
    textToImagePath = path;
    AppConst.textToImagePath = path;
  }

  //---------------------------------------------------------------
  //-------------------------enhance image service----------------------------
  Future<void> initCloudModel({required String text}) async {
    final response = await _textToImageService.initCloudList(text: text);
    if (response is CloudModel) {
      dynamic res = false;
      while (res == false) {
        res = await _fetchImageBytes(response.url);
      }
      updateCachedImage(path: response.url);
    }
  }

//---------------------------------------------------------------
//---------------------------------------------------------------
  Future<dynamic> _fetchImageBytes(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      var bytes = response.bodyBytes;
      var result = await isImageValid(bytes);
      if (result) {
        AppConst.textToImage = bytes;
      }
      return result;
    }
  }

  Future<bool> isImageValid(Uint8List bytes) async {
    try {
      final codec = await instantiateImageCodec(bytes, targetWidth: 32);
      final frameInfo = await codec.getNextFrame();
      return frameInfo.image.width > 0;
    } catch (e) {
      return false;
    }
  }
}
