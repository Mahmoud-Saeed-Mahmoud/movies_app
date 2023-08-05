import 'dart:convert';

class Poster {
  final double aspectRatio;
  final int height;
  final String iso_639_1;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;
  Poster({
    required this.aspectRatio,
    required this.height,
    required this.iso_639_1,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  Poster copyWith({
    double? aspectRatio,
    int? height,
    String? iso_639_1,
    String? filePath,
    double? voteAverage,
    int? voteCount,
    int? width,
  }) {
    return Poster(
      aspectRatio: aspectRatio ?? this.aspectRatio,
      height: height ?? this.height,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      filePath: filePath ?? this.filePath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      width: width ?? this.width,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'aspect_ratio': aspectRatio,
      'height': height,
      'iso_639_1': iso_639_1,
      'file_path': filePath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'width': width,
    };
  }

  factory Poster.fromMap(Map<String, dynamic> map) {
    return Poster(
      aspectRatio: (map['aspect_ratio'].toDouble() ?? 0.0) as double,
      height: (map['height'].toInt() ?? 0) as int,
      iso_639_1: (map['iso_639_1'] ?? '') as String,
      filePath: (map['file_path'] ?? '') as String,
      voteAverage: (map['vote_average'].toDouble() ?? 0.0) as double,
      voteCount: (map['vote_count'].toInt() ?? 0) as int,
      width: (map['width'].toInt() ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Poster.fromJson(String source) =>
      Poster.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Poster(aspect_ratio: $aspectRatio, height: $height, iso_639_1: $iso_639_1, file_path: $filePath, vote_average: $voteAverage, vote_count: $voteCount, width: $width)';
  }

  @override
  bool operator ==(covariant Poster other) {
    if (identical(this, other)) return true;

    return other.aspectRatio == aspectRatio &&
        other.height == height &&
        other.iso_639_1 == iso_639_1 &&
        other.filePath == filePath &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount &&
        other.width == width;
  }

  @override
  int get hashCode {
    return aspectRatio.hashCode ^
        height.hashCode ^
        iso_639_1.hashCode ^
        filePath.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode ^
        width.hashCode;
  }
}
