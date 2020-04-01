import 'package:covid19india/model/delta.dart';

class Statewise {
  String active; // 0
  String confirmed; // 0
  String deaths; // 0
  Delta delta;
  String lastupdatedtime; // 26/03/2020 07:19:29
  String recovered; // 0
  String state; // Tripura

  Statewise(
      {this.active,
      this.confirmed,
      this.deaths,
      this.delta,
      this.lastupdatedtime,
      this.recovered,
      this.state});

  factory Statewise.fromJson(Map<String, dynamic> json) {
    return Statewise(
      active: json['active'],
      confirmed: json['confirmed'],
      deaths: json['deaths'],
      delta: json['delta'] != null ? Delta.fromJson(json['delta']) : null,
      lastupdatedtime: json['lastupdatedtime'],
      recovered: json['recovered'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['lastupdatedtime'] = this.lastupdatedtime;
    data['recovered'] = this.recovered;
    data['state'] = this.state;
    if (this.delta != null) {
      data['delta'] = this.delta.toJson();
    }
    return data;
  }
}
