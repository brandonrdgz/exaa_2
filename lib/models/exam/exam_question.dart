import 'package:exaa_2/models/exam/exam_answer.dart';
import 'package:exaa_2/models/exam/question_model.dart';

class ExamQuestion {
  QuestionModel question;
  List<ExamAnswer> answers;

  ExamQuestion(this.question, this.answers);
}