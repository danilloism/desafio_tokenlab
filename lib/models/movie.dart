import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'voteAverage': voteAverage,
      'posterUrl': poster,
      'genres': genres,
      'releaseDate': releaseDate?.millisecondsSinceEpoch,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      voteAverage: map['voteAverage']?.toDouble(),
      poster: map['posterUrl'],
      genres: List<String>.from(map['genres']),
      releaseDate: map['releaseDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['releaseDate'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, voteAverage: $voteAverage, posterUrl: $poster, genres: $genres, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.id == id &&
        other.title == title &&
        other.voteAverage == voteAverage &&
        other.poster == poster &&
        listEquals(other.genres, genres) &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        voteAverage.hashCode ^
        poster.hashCode ^
        genres.hashCode ^
        releaseDate.hashCode;
  }
}
