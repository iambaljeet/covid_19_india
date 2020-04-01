import 'dart:async';
import 'dart:convert';

import 'package:covid19india/model/historic_data_model.dart';
import 'package:covid19india/utility/constants.dart';
import 'package:http/http.dart' as http;

class RemoteRepository {
  static Future<HistoricDataModel> getHistoricDataApi() async {
    var url = baseUrl + historicData;
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return HistoricDataModel.fromJson(body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
