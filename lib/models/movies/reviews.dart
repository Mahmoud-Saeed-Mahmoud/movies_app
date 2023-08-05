import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'review.dart';

class Reviews {
  final int id;
  final int page;
  final List<Review> results;
  final int totalPages;
  final int totalResults;
  Reviews({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Reviews copyWith({
    int? id,
    int? page,
    List<Review>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return Reviews(
      id: id ?? this.id,
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      id: (map['id'] ?? 0) as int,
      page: (map['page'] ?? 0) as int,
      results: List<Review>.from(
        (map['results'] as List).map<Review>(
          (x) => Review.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalPages: (map['total_pages'] ?? 0) as int,
      totalResults: (map['total_results'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reviews.fromJson(String source) =>
      Reviews.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reviews(id: $id, page: $page, results: $results, total_pages: $totalPages, total_results: $totalResults)';
  }

  @override
  bool operator ==(covariant Reviews other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.page == page &&
        listEquals(other.results, results) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        page.hashCode ^
        results.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}
