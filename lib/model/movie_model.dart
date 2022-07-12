class Movie {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final num? voteAverage;
  final num? voteCount;

  Movie(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        adult: json['aduld'],
        backdropPath: json['backdrop_path'],
        genreIds: json['genre_ids'].cast<int>(),
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}

class MovieResponse {
  late int page;
  late List<Movie> results;
  late int totalPages;
  late int totalResults;

  MovieResponse({this.page = 0, this.results = const [], this.totalPages = 0, this.totalResults = 0});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    try {
      page = json['page'];
      if (json['results'] != null) {
        results = <Movie>[];
        json['results'].forEach((v) => results.add(Movie.fromJson(v)));
      }
    } catch (e) {
      print(e);
    }
  }
}
