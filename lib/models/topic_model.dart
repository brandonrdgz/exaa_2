class TopicModel {
  TopicModel({
    required this.name_topic,
    required this.description_topic,
    required this.name_module,
  });

  String name_topic;
  String description_topic;
  String name_module;

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
        name_topic: json["name_topic"],
        description_topic: json["description_topic"],
        name_module: json["name_module"],
      );

  Map<String, dynamic> toJson() => {
        "name_topic": name_topic,
        "description_topic": description_topic,
        "name_module": name_module,
      };
}
