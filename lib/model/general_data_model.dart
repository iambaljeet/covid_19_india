class GeneralDataModel {
  List<String> generalRecommendations;
  List<String> mythBusters;

  GeneralDataModel.fromJson(Map<String, dynamic> map)
      : generalRecommendations =
            List<String>.from(map["generalRecommendations"]),
        mythBusters = List<String>.from(map["mythBusters"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['generalRecommendations'] = generalRecommendations;
    data['mythBusters'] = mythBusters;
    return data;
  }
}
