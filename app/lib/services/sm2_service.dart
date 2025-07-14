import '../models/review_data.dart';

class SM2Service {
  ReviewData nextReview(ReviewData data, int grade) {
    final q = grade.clamp(0, 5);
    if (q >= 3) {
      if (data.repetitions == 0) {
        data.interval = 1;
      } else if (data.repetitions == 1) {
        data.interval = 6;
      } else {
        data.interval = (data.interval * data.easeFactor).round();
      }
      data.repetitions += 1;
    } else {
      data.repetitions = 0;
      data.interval = 1;
    }

    data.easeFactor = (data.easeFactor + (0.1 - (5 - q) * (0.08 + (5 - q) * 0.02)))
        .clamp(1.3, double.infinity);
    data.dueDate = DateTime.now().add(Duration(days: data.interval));
    return data;
  }
}
