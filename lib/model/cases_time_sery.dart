class CasesTimeSery {
  String dailyconfirmed; // 110
  String dailydeceased; // 3
  String dailyrecovered; // 17
  String date; // 29 March
  String totalconfirmed; // 1139
  String totaldeceased; // 27
  String totalrecovered; // 102

  CasesTimeSery(
      {this.dailyconfirmed,
      this.dailydeceased,
      this.dailyrecovered,
      this.date,
      this.totalconfirmed,
      this.totaldeceased,
      this.totalrecovered});

  factory CasesTimeSery.fromJson(Map<String, dynamic> json) {
    return CasesTimeSery(
      dailyconfirmed: json['dailyconfirmed'],
      dailydeceased: json['dailydeceased'],
      dailyrecovered: json['dailyrecovered'],
      date: json['date'],
      totalconfirmed: json['totalconfirmed'],
      totaldeceased: json['totaldeceased'],
      totalrecovered: json['totalrecovered'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyconfirmed'] = this.dailyconfirmed;
    data['dailydeceased'] = this.dailydeceased;
    data['dailyrecovered'] = this.dailyrecovered;
    data['date'] = this.date;
    data['totalconfirmed'] = this.totalconfirmed;
    data['totaldeceased'] = this.totaldeceased;
    data['totalrecovered'] = this.totalrecovered;
    return data;
  }
}
