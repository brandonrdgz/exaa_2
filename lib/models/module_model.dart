class ModuleModel {
  ModuleModel({
    required this.nameModule,
    required this.descriptionModule
  });

  String nameModule;
  String descriptionModule;

  factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
        nameModule: json["nameModule"],
        descriptionModule: json["descriptionModule"]
      );

  Map<String, dynamic> toJson() => {
        "nameModule": nameModule,
        "descriptionModule": descriptionModule
      };
}