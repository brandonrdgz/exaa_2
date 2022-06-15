class SubtopicModel {
  SubtopicModel({
    required this.name_subtopic,
    required this.content_subtopic,
    required this.name_topic,
  });

  String name_subtopic;
  String content_subtopic;
  String name_topic;

  factory SubtopicModel.fromJson(Map<String, dynamic> json) => SubtopicModel(
        name_subtopic: json["name_subtopic"],
        content_subtopic: json["content_subtopic"],
        name_topic: json["name_topic"],
      );

  Map<String, dynamic> toJson() => {
        "name_subtopic": name_subtopic,
        "content_subtopic": content_subtopic,
        "name_topic": name_topic
      };
}
