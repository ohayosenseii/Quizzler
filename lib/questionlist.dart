import 'question.dart';

class QuestionList {
  int _questionnumber = 0;
  List<QuestionClass> questionlist = [
    QuestionClass('Eshan is the national animal of Moradabad?', true),
    QuestionClass('Aman is the national sleeping animal of India?', true),
    QuestionClass('Mimansha is the national symbol of aalsi in India?', true),
    QuestionClass('Rajjo is the PM of India?', false),
    QuestionClass('Aakash is ZODD?? 😐', true),
    QuestionClass('Madarchod ho tum?', true),
  ];

  String returnQuestion() {
    return questionlist[_questionnumber].question;
  }

  bool returnanswer() {
    return questionlist[_questionnumber].answer;
  }

  void nextQuestion() {
    if (_questionnumber < questionlist.length - 1) {
      _questionnumber++;
      print(_questionnumber);
    }
  }

  bool isFinished() {
    if (_questionnumber >= questionlist.length - 1)
      return true;
    else
      return false;
  }

  void reset() {
    _questionnumber = 0;
  }
}
