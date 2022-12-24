// Film detaylarının modeli

import 'package:json_annotation/json_annotation.dart';
part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailsModel {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetailsModel(
      {this.adult,
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
      this.voteCount});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieDetailsModelToJson(this);
  }
}

@JsonSerializable()
class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return _$BelongsToCollectionFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BelongsToCollectionToJson(this);
  }
}

@JsonSerializable()
class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return _$GenresFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenresToJson(this);
  }
}

@JsonSerializable()
class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) {
    return _$ProductionCompaniesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductionCompaniesToJson(this);
  }
}

@JsonSerializable()
class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) {
    return _$ProductionCountriesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductionCountriesToJson(this);
  }
}

@JsonSerializable()
class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) {
    return _$SpokenLanguagesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SpokenLanguagesToJson(this);
  }
}
