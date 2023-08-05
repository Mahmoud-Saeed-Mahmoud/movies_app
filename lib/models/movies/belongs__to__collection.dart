// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BelongsToCollection {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;
  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
    };
  }

  factory BelongsToCollection.fromMap(Map<String, dynamic> map) {
    return BelongsToCollection(
      id: (map['id'].toInt() ?? 0) as int,
      name: (map['name'] ?? '') as String,
      posterPath: (map['poster_path'] ?? '') as String,
      backdropPath: (map['backdrop_path'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BelongsToCollection.fromJson(String source) =>
      BelongsToCollection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BelongsToCollection(id: $id, name: $name, poster_path: $posterPath, backdrop_path: $backdropPath)';
  }

  @override
  bool operator ==(covariant BelongsToCollection other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.posterPath == posterPath &&
        other.backdropPath == backdropPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        posterPath.hashCode ^
        backdropPath.hashCode;
  }

  BelongsToCollection copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) {
    return BelongsToCollection(
      id: id ?? this.id,
      name: name ?? this.name,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
    );
  }
}
