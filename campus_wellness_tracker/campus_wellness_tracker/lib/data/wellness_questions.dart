
import '../models/wellness_question.dart';

const List<WellnessQuestion> wellnessQuestions = [
  WellnessQuestion(
    question: 'How many hours do you usually sleep each night?',
    answers: [
      WellnessAnswer(text: 'Less than 4 hours', score: 1),
      WellnessAnswer(text: '4–5 hours', score: 2),
      WellnessAnswer(text: '6 hours', score: 3),
      WellnessAnswer(text: '7–9 hours', score: 4),
    ],
  ),

  WellnessQuestion(
    question: 'How much water do you drink each day?',
    answers: [
      WellnessAnswer(text: '1–2 glasses', score: 1),
      WellnessAnswer(text: '3–4 glasses', score: 2),
      WellnessAnswer(text: '5–6 glasses', score: 3),
      WellnessAnswer(text: '7–8 glasses or more', score: 4),
    ],
  ),

  WellnessQuestion(
    question: 'How often do you engage in physical activity?',
    answers: [
      WellnessAnswer(text: 'Rarely or never', score: 1),
      WellnessAnswer(text: 'Once a week', score: 2),
      WellnessAnswer(text: '2–3 days a week', score: 3),
      WellnessAnswer(text: '4 or more days a week', score: 4),
    ],
  ),

  WellnessQuestion(
    question: 'How do you usually manage academic stress?',
    answers: [
      WellnessAnswer(text: 'I often feel overwhelmed', score: 1),
      WellnessAnswer(text: 'I usually ignore my stress', score: 2),
      WellnessAnswer(text: 'I take breaks when needed', score: 3),
      WellnessAnswer(text: 'I use healthy coping strategies', score: 4),
    ],
  ),

  WellnessQuestion(
    question: 'How well do you balance studying and personal time?',
    answers: [
      WellnessAnswer(text: 'I have almost no personal time', score: 1),
      WellnessAnswer(text: 'My schedule is often unbalanced', score: 2),
      WellnessAnswer(text: 'I usually maintain a reasonable balance', score: 3),
      WellnessAnswer(text: 'I balance both consistently', score: 4),
    ],
  ),
];
