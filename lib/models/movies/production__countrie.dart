import 'dart:convert';

class ProductionCountrie {
  final String iso_3166_1;
  final String name;
  ProductionCountrie({
    required this.iso_3166_1,
    required this.name,
  });

  ProductionCountrie copyWith({
    String? iso_3166_1,
    String? name,
  }) {
    return ProductionCountrie(
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso_3166_1': iso_3166_1,
      'name': name,
    };
  }

  factory ProductionCountrie.fromMap(Map<String, dynamic> map) {
    return ProductionCountrie(
      iso_3166_1: (map['iso_3166_1'] ?? '') as String,
      name: (map['name'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountrie.fromJson(String source) =>
      ProductionCountrie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductionCountrie(iso_3166_1: $iso_3166_1, name: $name)';

  @override
  bool operator ==(covariant ProductionCountrie other) {
    if (identical(this, other)) return true;

    return other.iso_3166_1 == iso_3166_1 && other.name == name;
  }

  @override
  int get hashCode => iso_3166_1.hashCode ^ name.hashCode;
}
