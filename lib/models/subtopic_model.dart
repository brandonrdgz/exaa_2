class SubtopicModel {
  SubtopicModel({
    required this.nameSubtopic,
    required this.contentSubtopic,
    required this.nameTopic,
  });

  String nameSubtopic;
  String contentSubtopic;
  String nameTopic;

  factory SubtopicModel.fromJson(Map<String, dynamic> json) => SubtopicModel(
        nameSubtopic: json["nameSubtopic"],
        contentSubtopic: json["contentSubtopic"],
        nameTopic: json["nameTopic"],
      );

  Map<String, dynamic> toJson() => {
        "nameSubtopic": nameSubtopic,
        "contentSubtopic": contentSubtopic,
        "nameTopic": nameTopic
      };
}
