import 'dart:convert';

class Dates {
  final String maximum;
  final String minimum;
  Dates({
    required this.maximum,
    required this.minimum,
  });

  Dates copyWith({
    String? maximum,
    String? minimum,
  }) {
    return Dates(
      maximum: maximum ?? this.maximum,
      minimum: minimum ?? this.minimum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maximum': maximum,
      'minimum': minimum,
    };
  }

  factory Dates.fromMap(Map<String, dynamic> map) {
    return Dates(
      maximum: (map['maximum'] ?? '') as String,
      minimum: (map['minimum'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dates.fromJson(String source) => Dates.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Dates(maximum: $maximum, minimum: $minimum)';

  @override
  bool operator ==(covariant Dates other) {
    if (identical(this, other)) return true;
  
    return 
      other.maximum == maximum &&
      other.minimum == minimum;
  }

  @override
  int get hashCode => maximum.hashCode ^ minimum.hashCode;
}