class TopicModel {
  TopicModel({
    required this.topicName,
    required this.topicDescription,
    required this.moduleName,
  });

  String topicName;
  String topicDescription;
  String moduleName;

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
        topicName: json["topicName"],
        topicDescription: json["topicDescription"],
        moduleName: json["moduleName"],
      );

  Map<String, dynamic> toJson() => {
        "topicName": topicName,
        "topicDescription": topicDescription,
        "moduleName": moduleName,
      };
}
