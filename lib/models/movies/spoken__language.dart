// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SpokenLanguage {
  final String englishName;
  final String iso_639_1;
  final String name;
  SpokenLanguage({
    required this.englishName,
    required this.iso_639_1,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'english_name': englishName,
      'iso_639_1': iso_639_1,
      'name': name,
    };
  }

  factory SpokenLanguage.fromMap(Map<String, dynamic> map) {
    return SpokenLanguage(
      englishName: (map['english_name'] ?? '') as String,
      iso_639_1: (map['iso_639_1'] ?? '') as String,
      name: (map['name'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguage.fromJson(String source) =>
      SpokenLanguage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SpokenLanguage(english_name: $englishName, iso_639_1: $iso_639_1, name: $name)';

  @override
  bool operator ==(covariant SpokenLanguage other) {
    if (identical(this, other)) return true;

    return other.englishName == englishName &&
        other.iso_639_1 == iso_639_1 &&
        other.name == name;
  }

  @override
  int get hashCode => englishName.hashCode ^ iso_639_1.hashCode ^ name.hashCode;

  SpokenLanguage copyWith({
    String? englishName,
    String? iso_639_1,
    String? name,
  }) {
    return SpokenLanguage(
      englishName: englishName ?? this.englishName,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      name: name ?? this.name,
    );
  }
}
