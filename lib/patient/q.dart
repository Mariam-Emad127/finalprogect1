class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question("هل تشعر بالأنحطاط الكلي",
    [
      Answer("نعم", true),
      Answer("لا", false),
    ],)
  );

  list.add(
      Question("هل تشعر بأرتفاع في درجة الحرارة",
        [
          Answer("نعم", true),
          Answer("لا", false),
        ],)
  );
  list.add(
      Question("هل تشعر بألم في المفاصل (الظهر أو الرجل)",
        [
          Answer("نعم", true),
          Answer("لا", false),
        ],)
  );
  list.add(
      Question("هل هناك كدمات ",
        [
          Answer("نعم", true),
          Answer("لا", false),
        ],)
  );
  list.add(
      Question("هل تشعر بالضعف العام",
        [
          Answer("نعم", true),
          Answer("لا", false),
        ],)
  );
  list.add(
      Question("هل هناك نزيف",
        [
          Answer("نعم", true),
          Answer("لا", false),
        ],)
  );
  list.add(
      Question("هل تشعر بالأنحطاط الكلي",
        [
          Answer("نعم", true),
          Answer("لا", false),
        ],)
  );

  return list;
}