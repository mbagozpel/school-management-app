// import 'dart:convert';

// import 'package:school_management_app/models/assignment.dart';
// import 'package:school_management_app/models/choices.dart';

// class Question {
//   final int id;
//   final String question;
//   final Choice choices;
//   final Choice answer;
//   final Assignment assignment;
//   final int order;
//   Question({
//     required this.id,
//     required this.question,
//     required this.choices,
//     required this.answer,
//     required this.assignment,
//     required this.order,
//   });

//   Question copyWith({
//     int? id,
//     String? question,
//     Choice? choices,
//     Choice? answer,
//     Assignment? assignment,
//     int? order,
//   }) {
//     return Question(
//       id: id ?? this.id,
//       question: question ?? this.question,
//       choices: choices ?? this.choices,
//       answer: answer ?? this.answer,
//       assignment: assignment ?? this.assignment,
//       order: order ?? this.order,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'question': question,
//       'choices': choices.toMap(),
//       'answer': answer.toMap(),
//       'assignment': assignment.toMap(),
//       'order': order,
//     };
//   }

//   factory Question.fromMap(Map<String, dynamic> map) {
//     return Question(
//       id: map['id'],
//       question: map['question'],
//       choices: Choice.fromMap(map['choices']),
//       answer: Choice.fromMap(map['answer']),
//       assignment: Assignment.fromMap(map['assignment']),
//       order: map['order'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Question.fromJson(String source) =>
//       Question.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Question(id: $id, question: $question, choices: $choices, answer: $answer, assignment: $assignment, order: $order)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Question &&
//         other.id == id &&
//         other.question == question &&
//         other.choices == choices &&
//         other.answer == answer &&
//         other.assignment == assignment &&
//         other.order == order;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         question.hashCode ^
//         choices.hashCode ^
//         answer.hashCode ^
//         assignment.hashCode ^
//         order.hashCode;
//   }
// }
