import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'backdrop.dart';
import 'logo.dart';
import 'poster.dart';

class Images {
  final List<Backdrop> backdrops;
  final int id;
  final List<Logo> logos;
  final List<Poster> posters;
  Images({
    required this.backdrops,
    required this.id,
    required this.logos,
    required this.posters,
  });

  Images copyWith({
    List<Backdrop>? backdrops,
    int? id,
    List<Logo>? logos,
    List<Poster>? posters,
  }) {
    return Images(
      backdrops: backdrops ?? this.backdrops,
      id: id ?? this.id,
      logos: logos ?? this.logos,
      posters: posters ?? this.posters,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdrops': backdrops.map((x) => x.toMap()).toList(),
      'id': id,
      'logos': logos.map((x) => x.toMap()).toList(),
      'posters': posters.map((x) => x.toMap()).toList(),
    };
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      backdrops: List<Backdrop>.from(
        (map['backdrops'] as List).map<Backdrop>(
          (x) => Backdrop.fromMap(x as Map<String, dynamic>),
        ),
      ),
      id: (map['id'].toInt() ?? 0) as int,
      logos: List<Logo>.from(
        (map['logos'] as List).map<Logo>(
          (x) => Logo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      posters: List<Poster>.from(
        (map['posters'] as List).map<Poster>(
          (x) => Poster.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) =>
      Images.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Images(backdrops: $backdrops, id: $id, logos: $logos, posters: $posters)';
  }

  @override
  bool operator ==(covariant Images other) {
    if (identical(this, other)) return true;

    return listEquals(other.backdrops, backdrops) &&
        other.id == id &&
        listEquals(other.logos, logos) &&
        listEquals(other.posters, posters);
  }

  @override
  int get hashCode {
    return backdrops.hashCode ^ id.hashCode ^ logos.hashCode ^ posters.hashCode;
  }
}
