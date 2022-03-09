class Movie {
  final int id;
  final String title;
  final double? voteAverage;
  final String? poster;
  final List<String>? genres;
  final DateTime? releaseDate;

  Movie({
    required this.id,
    required this.title,
    this.voteAverage,
    this.poster,
    this.genres,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      voteAverage: json['vote_average'] as double? ?? 0.0,
      poster: json['poster_url'] as String? ?? '',
      genres: List<String>.from(json['genres']),
      releaseDate: DateTime.parse(json['release_date'] ?? '0000-00-00'),
    );
  }

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, voteAverage: $voteAverage, posterUrl: $poster, genres: $genres, releaseDate: $releaseDate)';
  }
}
