import 'review_data.dart';

class Flashcard {
  String id;
  String front;
  String back;
  List<String> tags;
  bool mastered;
  ReviewData review;

  Flashcard({
    required this.id,
    required this.front,
    required this.back,
    this.tags = const [],
    this.mastered = false,
    ReviewData? review,
  }) : review = review ?? ReviewData();

  Map<String, dynamic> toJson() => {
        'id': id,
        'front': front,
        'back': back,
        'tags': tags,
        'mastered': mastered,
        'review': review.toJson(),
      };

  factory Flashcard.fromJson(Map<String, dynamic> json) => Flashcard(
        id: json['id'] as String,
        front: json['front'] as String,
        back: json['back'] as String,
        tags: List<String>.from(json['tags'] ?? []),
        mastered: json['mastered'] as bool? ?? false,
        review: ReviewData.fromJson(json['review'] as Map<String, dynamic>),
      );
}
