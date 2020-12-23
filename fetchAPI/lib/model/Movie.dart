class Movie {
  num popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  num voteAverage;
  String overview;
  String releaseDate;

  Movie(
      {this.popularity,
      this.voteCount,
      this.video,
      this.posterPath,
      this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.title,
      this.voteAverage,
      this.overview,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json)=> Movie (
    popularity : json['popularity'] as num,
    voteCount : json['vote_count'] as int,
    video : json['video'] as bool,
    posterPath : json['poster_path'] as String,
    id : json['id'] as int,
    adult : json['adult']as bool,
    backdropPath : json['backdrop_path'] as String,
    originalLanguage : json['original_language'] as String,
    originalTitle : json['original_title'] as String,
    genreIds :List<int>.from(json['genre_ids']),
    title : json['title'] as String,
    voteAverage : json['vote_average'] as num,
    overview : json['overview'] as String,
    releaseDate : json['release_date'] as String,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this.popularity;
    data['vote_count'] = this.voteCount;
    data['video'] = this.video;
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }
}

class Dates {
  String maximum;
  String minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maximum'] = this.maximum;
    data['minimum'] = this.minimum;
    return data;
  }
}
