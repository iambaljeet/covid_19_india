import 'dart:async';
import 'dart:convert';

import 'package:covid19india/model/general_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocalRepository {
  static Future<String> loadGeneralDataAssets() async {
    return await rootBundle.loadString('assets/general_data.json');
  }

  static Future<GeneralDataModel> getGeneralData() async {
    String jsonString = await loadGeneralDataAssets();

    debugPrint("getGeneralData: " + jsonString);

    var body = json.decode(jsonString);
    return GeneralDataModel.fromJson(body);
  }
}
