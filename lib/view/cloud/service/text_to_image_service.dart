// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:io';

import 'package:enhance/core/init/env/env.dart';
import 'package:enhance/view/cloud/model/cloud_model.dart';
import 'package:enhance/view/cloud/service/IText_to_image_service.dart';
import 'package:http/http.dart' as http;

class TextToImageService implements ITextToImageService {
  @override
  Future initCloudList({required String text}) async {
    var uri = Uri.parse(Env.textToImageUrl);

    var headers = {
      "X-RapidAPI-Key": Env.textToImageKey,
      "X-RapidAPI-Host": Env.textToImageHost,
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
              .map((e) => CloudModel.fromJson(e))
              .cast<CloudModel>()
              .toList();
          return data;
        } else if (jsonData is Map<String, dynamic>) {
          return CloudModel.fromJson(jsonData);
        } else
          return jsonData;
    }
  }
}
