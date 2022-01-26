class DummyModel {
  DummyModel({required this.id, required this.name});

  int id;
  String name;

  factory DummyModel.fromJson(Map<String, dynamic> json) =>
      DummyModel(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
