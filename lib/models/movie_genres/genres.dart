import 'dart:convert';

import 'package:collection/collection.dart';

import 'genre.dart';

class Genres {
  final List<Genre>? genres;

  const Genres({this.genres});

  @override
  String toString() => 'Genres(genres: $genres)';

  factory Genres.fromMap(Map<String, dynamic> data) => Genres(
        genres: (data['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'genres': genres?.map((e) => e.toMap()).toList(),
      };

  factory Genres.fromJson(String data) {
    return Genres.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  Genres copyWith({
    List<Genre>? genres,
  }) {
    return Genres(
      genres: genres ?? this.genres,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Genres) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => genres.hashCode;
}
