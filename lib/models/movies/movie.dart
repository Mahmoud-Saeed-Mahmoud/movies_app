// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:movies_app/models/movies/production__companie.dart';
import 'package:movies_app/models/movies/production__countrie.dart';
import 'package:movies_app/models/movies/spoken__language.dart';

import '../movie_genres/genre.dart';
import 'belongs__to__collection.dart';

class Movie {
  final bool? adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanie>? productionCompanies;
  final List<ProductionCountrie>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  Movie({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'belongs_to_collection': belongsToCollection!.toMap(),
      'budget': budget,
      'genres': genres!.map((e) => e.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies':
          productionCompanies!.map((x) => x.toMap()).toList(),
      'production_countries':
          productionCountries!.map((x) => x.toMap()).toList(),
      'release_date': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages!.map((x) => x.toMap()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      adult: (map['adult'] ?? false) as bool,
      backdropPath: (map['backdrop_path'] ?? '') as String,
      belongsToCollection: map['belongs_to_collection'] != null
          ? BelongsToCollection.fromMap(
              map['belongs_to_collection'] as Map<String, dynamic>)
          : null,
      budget: (map['budget'].toInt() ?? 0) as int,
      genres: List<Genre>.from((map['genres'] as List<dynamic>).map<Genre>(
        (x) => Genre.fromMap(x as Map<String, dynamic>),
      )),
      homepage: (map['homepage'] ?? '') as String,
      id: (map['id'].toInt() ?? 0) as int,
      imdbId: (map['imdb_id'] ?? '') as String,
      originalLanguage: (map['original_language'] ?? '') as String,
      originalTitle: (map['original_title'] ?? '') as String,
      overview: (map['overview'] ?? '') as String,
      popularity: (map['popularity'].toDouble() ?? 0.0) as double,
      posterPath: (map['poster_path'] ?? '') as String,
      productionCompanies: List<ProductionCompanie>.from(
        (map['production_companies']).map<ProductionCompanie>(
          (x) => ProductionCompanie.fromMap(x as Map<String, dynamic>),
        ),
      ),
      productionCountries: List<ProductionCountrie>.from(
        (map['production_countries']).map<ProductionCountrie>(
          (x) => ProductionCountrie.fromMap(x as Map<String, dynamic>),
        ),
      ),
      releaseDate: (map['release_date'] ?? '') as String,
      revenue: (map['revenue'].toInt() ?? 0) as int,
      runtime: (map['runtime'].toInt() ?? 0) as int,
      spokenLanguages: List<SpokenLanguage>.from(
        (map['spoken_languages']).map<SpokenLanguage>(
          (x) => SpokenLanguage.fromMap(x as Map<String, dynamic>),
        ),
      ),
      status: (map['status'] ?? '') as String,
      tagline: (map['tagline'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      video: (map['video'] ?? false) as bool,
      voteAverage: (map['vote_average'].toDouble() ?? 0.0) as double,
      voteCount: (map['vote_count'].toInt() ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(adult: $adult, backdrop_path: $backdropPath, belongs_to_collection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdb_id: $imdbId, original_language: $originalLanguage, original_title: $originalTitle, overview: $overview, popularity: $popularity, poster_path: $posterPath, production_companies: $productionCompanies, production_countries: $productionCountries, release_date: $releaseDate, revenue: $revenue, runtime: $runtime, spoken_languages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, vote_average: $voteAverage, vote_count: $voteCount)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.adult == adult &&
        other.backdropPath == backdropPath &&
        other.belongsToCollection == belongsToCollection &&
        other.budget == budget &&
        other.genres == genres &&
        other.homepage == homepage &&
        other.id == id &&
        other.imdbId == imdbId &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        listEquals(other.productionCompanies, productionCompanies) &&
        listEquals(other.productionCountries, productionCountries) &&
        other.releaseDate == releaseDate &&
        other.revenue == revenue &&
        other.runtime == runtime &&
        listEquals(other.spokenLanguages, spokenLanguages) &&
        other.status == status &&
        other.tagline == tagline &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdropPath.hashCode ^
        belongsToCollection.hashCode ^
        budget.hashCode ^
        genres.hashCode ^
        homepage.hashCode ^
        id.hashCode ^
        imdbId.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        posterPath.hashCode ^
        productionCompanies.hashCode ^
        productionCountries.hashCode ^
        releaseDate.hashCode ^
        revenue.hashCode ^
        runtime.hashCode ^
        spokenLanguages.hashCode ^
        status.hashCode ^
        tagline.hashCode ^
        title.hashCode ^
        video.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }

  Movie copyWith({
    bool? adult,
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompanie>? productionCompanies,
    List<ProductionCountrie>? productionCountries,
    String? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      belongsToCollection: belongsToCollection ?? this.belongsToCollection,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
}
