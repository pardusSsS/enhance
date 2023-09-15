import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:enhance/core/contants/app_constants.dart';
import 'package:enhance/core/init/env/env.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'enhance_vm.g.dart';

class EnhanceViewModel = EnhanceViewBase with _$EnhanceViewModel;

abstract class EnhanceViewBase with Store {
  @observable
  int enhanceNumber = 2;
  //XFile? singleImage;
  @observable
  String? editImage;
  @observable
  Uint8List? enhancedEditImage;
  @observable
  int? width;
  @observable
  int? height;

  @action
  Future<void> pickImage() async {
    //type 0: profile || 1: cover
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      editImage = pickedFile.path;
      AppConst.imagePath = pickedFile.path;
      await calculateImageSize();
    }
  }

  @action
  Future<void> enhancedImage(Uint8List imageData) async {
    enhancedEditImage = imageData;
    AppConst.enhangedImage = enhancedEditImage;
    await calculateImageSize();
  }

  @action
  void updateEnhanceNumber(int num) {
    enhanceNumber = num;
  }

  @action
  void removeImage() {
    editImage = null;
    AppConst.imagePath = null;
    AppConst.enhangedImage = null;
  }

  @action
  Future<void> onInit() async {
    await calculateImageSize();
  }

  Future<void> calculateImageSize() async {
    if (AppConst.enhangedImage != null) {
      final decodedImage = await decodeImageFromList(AppConst.enhangedImage!);
      // Retrieve width and height
      width = decodedImage.width;
      height = decodedImage.height;
    } else if (AppConst.imagePath != null) {
      final File imageFile = File(AppConst.imagePath!);
      final Uint8List bytes = await imageFile.readAsBytes();

      // Use the bytes to decode the image
      final decodedImage = await decodeImageFromList(bytes);

      // Retrieve width and height
      width = decodedImage.width;
      height = decodedImage.height;
    }
  }

  //---------------------------------------------------------------
  //-------------------------enhance image service----------------------------

  Future<bool> enhanceImageService() async {
    try {
      var uri = Uri.parse(Env.enhanceUrl);
      var request = http.MultipartRequest('POST', uri)
        ..fields['sizeFactor'] = enhanceNumber.toString()
        ..fields['imageStyle'] = 'default'
        ..fields['noiseCancellationFactor'] = '0';

      var imageFile =
          await http.MultipartFile.fromPath('image', AppConst.imagePath!);
      request.files.add(imageFile);

      request.headers.addAll({
        "X-RapidAPI-Key": Env.enhanceKey,
        "X-RapidAPI-Host": Env.enhanceHost,
      });

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // Read and process the response here
        var responseString = response.bodyBytes;
        enhancedImage(responseString);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      throw e; // Throw the error to propagate it
    }
  }
//---------------------------------------------------------------
//---------------------------------------------------------------
}
