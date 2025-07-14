class ReviewData {
  double easeFactor;
  int interval;
  int repetitions;
  DateTime dueDate;

  ReviewData({
    this.easeFactor = 2.5,
    this.interval = 0,
    this.repetitions = 0,
    DateTime? dueDate,
  }) : dueDate = dueDate ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'easeFactor': easeFactor,
        'interval': interval,
        'repetitions': repetitions,
        'dueDate': dueDate.toIso8601String(),
      };

  factory ReviewData.fromJson(Map<String, dynamic> json) => ReviewData(
        easeFactor: (json['easeFactor'] as num).toDouble(),
        interval: json['interval'] as int,
        repetitions: json['repetitions'] as int,
        dueDate: DateTime.parse(json['dueDate'] as String),
      );
}
