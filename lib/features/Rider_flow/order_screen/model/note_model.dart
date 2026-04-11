class NoteModel {
  final String? id;
  final String date;
  final String time;
  final String text;
  final DateTime? createdAt;

  NoteModel({
    this.id,
    required this.date,
    required this.time,
    required this.text,
    this.createdAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'] as String?,
      date: json['date'] as String? ?? '',
      time: json['time'] as String? ?? '',
      text: json['text'] as String? ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'time': time,
      'text': text,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  NoteModel copyWith({
    String? id,
    String? date,
    String? time,
    String? text,
    DateTime? createdAt,
  }) {
    return NoteModel(
      id: id ?? this.id,
      date: date ?? this.date,
      time: time ?? this.time,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() =>
      'NoteModel(id: $id, date: $date, time: $time, text: $text)';
}
