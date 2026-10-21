
class WellnessAnswer {
  final String text;
  final int score;

  const WellnessAnswer({
    required this.text,
    required this.score,
  });
}

class WellnessQuestion {
  final String question;
  final List<WellnessAnswer> answers;

  const WellnessQuestion({
    required this.question,
    required this.answers,
  });
}
