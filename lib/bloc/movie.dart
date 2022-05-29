class Movie {
  final int id;
  final String title;
  final double voteAverage;
  final String poster;
  final List<String> genres;
  final DateTime releaseDate;
  final String? description;

  Movie({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.poster,
    required this.genres,
    required this.releaseDate,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      voteAverage: json['vote_average'] as double? ?? 0.0,
      poster: json['poster_url'] as String? ?? '',
      genres: List<String>.from(json['genres']),
      releaseDate: DateTime.parse(json['release_date'] ?? '0000-00-00'),
      description: json['overview'] as String?,
    );
  }
}
