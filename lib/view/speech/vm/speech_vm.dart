// ignore_for_file: unused_element, prefer_final_fields

import 'dart:io';

import 'package:enhance/core/constants/app_constants.dart';
import 'package:enhance/view/speech/model/speech_model.dart';
import 'package:enhance/view/speech/service/speech_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

part 'speech_vm.g.dart';

class SpeechViewModel = SpeechViewBase with _$SpeechViewModel;

abstract class SpeechViewBase with Store {
  final filterColor = ValueNotifier<Color>(Colors.white);
  TextToSpeechService _textToSpeechService = TextToSpeechService();

  @observable
  String? audioUrl;

  @action
  void updateAudioUrl({required String path}) {
    audioUrl = path;
    AppConst.audioUrl = path;
  }

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

  //---------------------------------------------------------------
  //-------------------------enhance image service----------------------------
  Future<void> initSpeechModel({required String text}) async {
    final response = await _textToSpeechService.initCloudList(text: text);
    if (response is SpeechModel) {
      dynamic res = false;
      while (res == false) {
        res = await fetchAudio(response.url);
      }
      updateAudioUrl(path: response.url);
    }
  }

  Future<dynamic> fetchAudio(String audioUrl) async {
    final response = await http.get(Uri.parse(audioUrl));
    print("audio body : ${response.statusCode}");

    if (response.statusCode == 200) {
      var body = response.body;
      final contentType = response.headers['content-type'];

      if (contentType == 'audio/wav') {
        AppConst.audioBytes = response.bodyBytes;
        print("audio body");
        return true;
      } else {
        final jsonBody = response.body;
        return false;
      }
    }
  }

  Future<void> saveAudio() async {
    if (AppConst.audioBytes != null) {
      // Get the downloads directory
      var downloadsDirectory = await DownloadsPath.downloadsDirectory();
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.wav';
      // Specify the file path where you want to save the audio
      var filePath = "${downloadsDirectory!.path}/$fileName";
      // Write the audioBytes to the file
      await File(filePath).writeAsBytes(AppConst.audioBytes!);
    }
  }
}
