class ExamModel {
  ExamModel({required this.id_exam, required this.type_exam});

  num id_exam;
  String type_exam;

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      ExamModel(id_exam: json["id_exam"], type_exam: json["type_exam"]);

  Map<String, dynamic> toJson() => {"id_exam": id_exam, "type_exam": type_exam};
}
