import 'dart:convert';

class Videos {
  final int id;
  final List<Result> results;
  Videos({
    required this.id,
    required this.results,
  });

  Videos copyWith({
    int? id,
    List<Result>? results,
  }) {
    return Videos(
      id: id ?? this.id,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory Videos.fromMap(Map<String, dynamic> map) {
    return Videos(
      id: (map['id'].toInt() ?? 0) as int,
      results: List<Result>.from(
        (map['results'] as List).map<Result>(
          (x) => Result.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Videos.fromJson(String source) =>
      Videos.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Videos(id: $id, results: $results)';
}

class Result {
  final String iso_639_1;
  final String iso_3166_1;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;
  Result({
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  Result copyWith({
    String? iso_639_1,
    String? iso_3166_1,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    String? publishedAt,
    String? id,
  }) {
    return Result(
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      name: name ?? this.name,
      key: key ?? this.key,
      site: site ?? this.site,
      size: size ?? this.size,
      type: type ?? this.type,
      official: official ?? this.official,
      publishedAt: publishedAt ?? this.publishedAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso_639_1': iso_639_1,
      'iso_3166_1': iso_3166_1,
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'published_at': publishedAt,
      'id': id,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      iso_639_1: (map['iso_639_1'] ?? '') as String,
      iso_3166_1: (map['iso_3166_1'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      key: (map['key'] ?? '') as String,
      site: (map['site'] ?? '') as String,
      size: (map['size'].toInt() ?? 0) as int,
      type: (map['type'] ?? '') as String,
      official: (map['official'] ?? false) as bool,
      publishedAt: (map['published_at'] ?? '') as String,
      id: (map['id'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) =>
      Result.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Result(iso_639_1: $iso_639_1, iso_3166_1: $iso_3166_1, name: $name, key: $key, site: $site, size: $size, type: $type, official: $official, published_at: $publishedAt, id: $id)';
  }

  @override
  bool operator ==(covariant Result other) {
    if (identical(this, other)) return true;

    return other.iso_639_1 == iso_639_1 &&
        other.iso_3166_1 == iso_3166_1 &&
        other.name == name &&
        other.key == key &&
        other.site == site &&
        other.size == size &&
        other.type == type &&
        other.official == official &&
        other.publishedAt == publishedAt &&
        other.id == id;
  }

  @override
  int get hashCode {
    return iso_639_1.hashCode ^
        iso_3166_1.hashCode ^
        name.hashCode ^
        key.hashCode ^
        site.hashCode ^
        size.hashCode ^
        type.hashCode ^
        official.hashCode ^
        publishedAt.hashCode ^
        id.hashCode;
  }
}
