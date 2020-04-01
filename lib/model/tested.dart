class Tested {
  String source;
  String testsconductedbyprivatelabs;
  String totalindividualstested;
  String totalpositivecases;
  String totalsamplestested; // 38442
  String updatetimestamp; // 30/3/2020

  Tested(
      {this.source,
      this.testsconductedbyprivatelabs,
      this.totalindividualstested,
      this.totalpositivecases,
      this.totalsamplestested,
      this.updatetimestamp});

  factory Tested.fromJson(Map<String, dynamic> json) {
    return Tested(
      source: json['source'],
      testsconductedbyprivatelabs: json['testsconductedbyprivatelabs'],
      totalindividualstested: json['totalindividualstested'],
      totalpositivecases: json['totalpositivecases'],
      totalsamplestested: json['totalsamplestested'],
      updatetimestamp: json['updatetimestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['testsconductedbyprivatelabs'] = this.testsconductedbyprivatelabs;
    data['totalindividualstested'] = this.totalindividualstested;
    data['totalpositivecases'] = this.totalpositivecases;
    data['totalsamplestested'] = this.totalsamplestested;
    data['updatetimestamp'] = this.updatetimestamp;
    return data;
  }
}
