import 'dart:convert';

class Backdrop {
  final double aspectRatio;
  final int height;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;
  Backdrop({
    required this.aspectRatio,
    required this.height,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  Backdrop copyWith({
    double? aspectRatio,
    int? height,
    String? filePath,
    double? voteAverage,
    int? voteCount,
    int? width,
  }) {
    return Backdrop(
      aspectRatio: aspectRatio ?? this.aspectRatio,
      height: height ?? this.height,
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
      'file_path': filePath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'width': width,
    };
  }

  factory Backdrop.fromMap(Map<String, dynamic> map) {
    return Backdrop(
      aspectRatio: (map['aspect_ratio'].toDouble() ?? 0.0) as double,
      height: (map['height'].toInt() ?? 0) as int,
      filePath: (map['file_path'] ?? '') as String,
      voteAverage: (map['vote_average'].toDouble() ?? 0.0) as double,
      voteCount: (map['vote_count'].toInt() ?? 0) as int,
      width: (map['width'].toInt() ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Backdrop.fromJson(String source) =>
      Backdrop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Backdrop(aspect_ratio: $aspectRatio, height: $height, file_path: $filePath, vote_average: $voteAverage, vote_count: $voteCount, width: $width)';
  }

  @override
  bool operator ==(covariant Backdrop other) {
    if (identical(this, other)) return true;

    return other.aspectRatio == aspectRatio &&
        other.height == height &&
        other.filePath == filePath &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount &&
        other.width == width;
  }

  @override
  int get hashCode {
    return aspectRatio.hashCode ^
        height.hashCode ^
        filePath.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode ^
        width.hashCode;
  }
}
