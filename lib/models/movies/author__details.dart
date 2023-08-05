import 'dart:convert';

class AuthorDetails {
  final String name;
  final String username;
  final String avatarPath;
  final num rating;
  AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  AuthorDetails copyWith({
    String? name,
    String? username,
    String? avatarPath,
    int? rating,
  }) {
    return AuthorDetails(
      name: name ?? this.name,
      username: username ?? this.username,
      avatarPath: avatarPath ?? this.avatarPath,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'avatar_path': avatarPath,
      'rating': rating,
    };
  }

  factory AuthorDetails.fromMap(Map<String, dynamic> map) {
    return AuthorDetails(
      name: (map['name'] ?? '') as String,
      username: (map['username'] ?? '') as String,
      avatarPath: (map['avatar_path'] ?? '') as String,
      rating: (map['rating'] ?? 0) as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorDetails.fromJson(String source) =>
      AuthorDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Author_details(name: $name, username: $username, avatar_path: $avatarPath, rating: $rating)';
  }

  @override
  bool operator ==(covariant AuthorDetails other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.username == username &&
        other.avatarPath == avatarPath &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        username.hashCode ^
        avatarPath.hashCode ^
        rating.hashCode;
  }
}
