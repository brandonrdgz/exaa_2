class ModuleModel {
  ModuleModel(
      {required this.name_module,
      required this.description_module,
      required this.pathImage});

  String name_module;
  String description_module;
  String pathImage;

  factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
      name_module: json["name_module"],
      description_module: json["description_module"],
      pathImage: json["pathImage"]);

  Map<String, dynamic> toJson() => {
        "name_module": name_module,
        "description_module": description_module,
        "pathImage": pathImage
      };
}
