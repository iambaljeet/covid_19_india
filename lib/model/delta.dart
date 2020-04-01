class Delta {
  int active; // 0
  int confirmed; // 0
  int deaths; // 0
  int recovered; // 0

  Delta({this.active, this.confirmed, this.deaths, this.recovered});

  factory Delta.fromJson(Map<String, dynamic> json) {
    return Delta(
      active: json['active'],
      confirmed: json['confirmed'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    return data;
  }
}
