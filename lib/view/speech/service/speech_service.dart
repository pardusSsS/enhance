// ignore_for_file: curly_braces_in_flow_control_structures
import 'dart:convert';
import 'dart:io';
import 'package:enhance/core/init/env/env.dart';
import 'package:enhance/view/speech/model/speech_model.dart';
import 'package:enhance/view/speech/service/ISpeech_service.dart';
import 'package:http/http.dart' as http;

class TextToSpeechService implements ITextToSpeechService {
  @override
  Future initCloudList({required String text}) async {
    var uri = Uri.parse(Env.textToSpeechUrl);

    var headers = {
      "X-RapidAPI-Key": Env.textToSpeechKey,
      "X-RapidAPI-Host": Env.textToSpeechHost,
      'content-type': 'application/x-www-form-urlencoded',
    };

    var response = await http.post(
      uri,
      headers: headers,
      body: {
        'text': text,
      },
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          var data = jsonData
              .map((e) => SpeechModel.fromJson(e))
              .cast<SpeechModel>()
              .toList();
          return data;
        } else if (jsonData is Map<String, dynamic>) {
          return SpeechModel.fromJson(jsonData);
        } else
          return jsonData;
    }
  }
}
