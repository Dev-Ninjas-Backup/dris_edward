class ReviewModel {
  final String id;
  final String name;
  final double rating;
  final String reviewText;
  final String profileImage;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewText,
    required this.profileImage,
    required this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewText: json['reviewText'] ?? json['review_text'] ?? '',
      profileImage: json['profileImage'] ?? json['profile_image'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'reviewText': reviewText,
      'profileImage': profileImage,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class RatingStats {
  final double averageRating;
  final int totalReviews;
  final int excellentCount;
  final int goodCount;
  final int averageCount;
  final int poorCount;
  final int terribleCount;

  RatingStats({
    required this.averageRating,
    required this.totalReviews,
    required this.excellentCount,
    required this.goodCount,
    required this.averageCount,
    required this.poorCount,
    required this.terribleCount,
  });

  factory RatingStats.fromJson(Map<String, dynamic> json) {
    return RatingStats(
      averageRating: (json['averageRating'] ?? json['average_rating'] ?? 0)
          .toDouble(),
      totalReviews: json['totalReviews'] ?? json['total_reviews'] ?? 0,
      excellentCount: json['excellentCount'] ?? json['excellent_count'] ?? 0,
      goodCount: json['goodCount'] ?? json['good_count'] ?? 0,
      averageCount: json['averageCount'] ?? json['average_count'] ?? 0,
      poorCount: json['poorCount'] ?? json['poor_count'] ?? 0,
      terribleCount: json['terribleCount'] ?? json['terrible_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'averageRating': averageRating,
      'totalReviews': totalReviews,
      'excellentCount': excellentCount,
      'goodCount': goodCount,
      'averageCount': averageCount,
      'poorCount': poorCount,
      'terribleCount': terribleCount,
    };
  }
}
