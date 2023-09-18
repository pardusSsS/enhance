// ignore_for_file: unused_field

import 'package:enhance/core/contants/app_constants.dart';
import 'package:enhance/view/cloud/model/cloud_model.dart';
import 'package:enhance/view/cloud/service/text_to_image_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

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
    print("textto image: ${AppConst.textToImagePath}");
  }

  //---------------------------------------------------------------
  //-------------------------enhance image service----------------------------
  Future<void> initCloudModel({required String text}) async {
    print(1);
    final response = await _textToImageService.initCloudList(text: text);
    print(2);
    print(response.runtimeType);
    var result = response is CloudModel;
    print(result);
    if (response is CloudModel) {
      print("status: ${response.status}");
      dynamic res = false;
      while (res != false) {
        res = await _fetchImageBytes(response.url);
        print("res: $res");
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
      try {
        final imageBytes = response.bodyBytes;
        return Image.memory(imageBytes);
      } catch (_) {
        // If decoding as an image fails, return the JSON response
        return false;
      }
    } else {
      throw Exception('Failed to load image');
    }
  }
}

bool _isValidPng(Uint8List bytes) {
  // Check the PNG header (first 8 bytes)
  const List<int> pngSignature = [137, 80, 78, 71, 13, 10, 26, 10];
  if (bytes.length >= pngSignature.length) {
    for (int i = 0; i < pngSignature.length; i++) {
      if (bytes[i] != pngSignature[i]) {
        return false;
      }
    }
    return true;
  }
  return false;
}
