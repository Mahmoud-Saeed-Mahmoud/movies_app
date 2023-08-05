// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductionCompanie {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;
  ProductionCompanie({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }

  factory ProductionCompanie.fromMap(Map<String, dynamic> map) {
    return ProductionCompanie(
      id: (map['id'].toInt() ?? 0) as int,
      logoPath: (map['logo_path'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      originCountry: (map['origin_country'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompanie.fromJson(String source) =>
      ProductionCompanie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductionCompanie(id: $id, logo_path: $logoPath, name: $name, origin_country: $originCountry)';
  }

  ProductionCompanie copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) {
    return ProductionCompanie(
      id: id ?? this.id,
      logoPath: logoPath ?? this.logoPath,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
    );
  }

  @override
  bool operator ==(covariant ProductionCompanie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.logoPath == logoPath &&
        other.name == name &&
        other.originCountry == originCountry;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        logoPath.hashCode ^
        name.hashCode ^
        originCountry.hashCode;
  }
}
