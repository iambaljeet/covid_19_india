class KeyValue {
  String confirmeddelta; // 189
  String counterforautotimeupdate; // 645
  String deceaseddelta; // 7
  String lastupdatedtime; // 30/03/2020 21:52:24
  String recovereddelta; // 35
  String statesdelta; // 0

  KeyValue(
      {this.confirmeddelta,
      this.counterforautotimeupdate,
      this.deceaseddelta,
      this.lastupdatedtime,
      this.recovereddelta,
      this.statesdelta});

  factory KeyValue.fromJson(Map<String, dynamic> json) {
    return KeyValue(
      confirmeddelta: json['confirmeddelta'],
      counterforautotimeupdate: json['counterforautotimeupdate'],
      deceaseddelta: json['deceaseddelta'],
      lastupdatedtime: json['lastupdatedtime'],
      recovereddelta: json['recovereddelta'],
      statesdelta: json['statesdelta'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmeddelta'] = this.confirmeddelta;
    data['counterforautotimeupdate'] = this.counterforautotimeupdate;
    data['deceaseddelta'] = this.deceaseddelta;
    data['lastupdatedtime'] = this.lastupdatedtime;
    data['recovereddelta'] = this.recovereddelta;
    data['statesdelta'] = this.statesdelta;
    return data;
  }
}
