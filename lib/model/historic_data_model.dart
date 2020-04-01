import 'package:covid19india/model/cases_time_sery.dart';
import 'package:covid19india/model/key_value.dart';
import 'package:covid19india/model/state_wise.dart';
import 'package:covid19india/model/tested.dart';

class HistoricDataModel {
  List<CasesTimeSery> cases_time_series;
  List<KeyValue> key_values;
  List<Statewise> statewise;
  List<Tested> tested;

  HistoricDataModel(
      {this.cases_time_series, this.key_values, this.statewise, this.tested});

  factory HistoricDataModel.fromJson(Map<String, dynamic> json) {
    return HistoricDataModel(
      cases_time_series: json['cases_time_series'] != null
          ? (json['cases_time_series'] as List)
              .map((i) => CasesTimeSery.fromJson(i))
              .toList()
          : null,
      key_values: json['key_values'] != null
          ? (json['key_values'] as List)
              .map((i) => KeyValue.fromJson(i))
              .toList()
          : null,
      statewise: json['statewise'] != null
          ? (json['statewise'] as List)
              .map((i) => Statewise.fromJson(i))
              .toList()
          : null,
      tested: json['tested'] != null
          ? (json['tested'] as List).map((i) => Tested.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cases_time_series != null) {
      data['cases_time_series'] =
          this.cases_time_series.map((v) => v.toJson()).toList();
    }
    if (this.key_values != null) {
      data['key_values'] = this.key_values.map((v) => v.toJson()).toList();
    }
    if (this.statewise != null) {
      data['statewise'] = this.statewise.map((v) => v.toJson()).toList();
    }
    if (this.tested != null) {
      data['tested'] = this.tested.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
