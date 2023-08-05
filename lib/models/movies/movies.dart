import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'dates.dart';
import 'result.dart';

class Movies {
  final Dates? dates;
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;
  Movies({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Movies copyWith({
    Dates? dates,
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return Movies(
      dates: dates ?? this.dates,
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dates': dates == null ? {} : dates!.toMap(),
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      dates: map['dates'] != null
          ? Dates.fromMap(map['dates'] as Map<String, dynamic>)
          : null,
      page: (map['page'].toInt() ?? 0) as int,
      results: map['results'] != null
          ? List<Result>.from((map['results'] as List)
              .map((x) => Result.fromMap(x as Map<String, dynamic>)))
          : [],
      totalPages: (map['total_pages'].toInt() ?? 0) as int,
      totalResults: (map['total_results'].toInt() ?? 0) as int,
    )..results.removeWhere((movie) => movie.posterPath.isEmpty);
  }

  String toJson() => json.encode(toMap());

  factory Movies.fromJson(String source) =>
      Movies.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movies(dates: $dates, page: $page, results: $results, total_pages: $totalPages, total_results: $totalResults)';
  }

  @override
  bool operator ==(covariant Movies other) {
    if (identical(this, other)) return true;

    return other.dates == dates &&
        other.page == page &&
        listEquals(other.results, results) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return dates.hashCode ^
        page.hashCode ^
        results.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}
