import 'dart:convert';

import 'author__details.dart';

class Review {
  final String author;
  final AuthorDetails authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;
  Review({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  Review copyWith({
    String? author,
    AuthorDetails? authorDetails,
    String? content,
    String? createdAt,
    String? id,
    String? updatedAt,
    String? url,
  }) {
    return Review(
      author: author ?? this.author,
      authorDetails: authorDetails ?? this.authorDetails,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'author_details': authorDetails.toMap(),
      'content': content,
      'created_at': createdAt,
      'id': id,
      'updated_at': updatedAt,
      'url': url,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      author: (map['author'] ?? '') as String,
      authorDetails:
          AuthorDetails.fromMap(map['author_details'] as Map<String, dynamic>),
      content: (map['content'] ?? '') as String,
      createdAt: (map['created_at'] ?? '') as String,
      id: (map['id'] ?? '') as String,
      updatedAt: (map['updated_at'] ?? '') as String,
      url: (map['url'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Result(author: $author, author_details: $authorDetails, content: $content, created_at: $createdAt, id: $id, updated_at: $updatedAt, url: $url)';
  }

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.authorDetails == authorDetails &&
        other.content == content &&
        other.createdAt == createdAt &&
        other.id == id &&
        other.updatedAt == updatedAt &&
        other.url == url;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        authorDetails.hashCode ^
        content.hashCode ^
        createdAt.hashCode ^
        id.hashCode ^
        updatedAt.hashCode ^
        url.hashCode;
  }
}
