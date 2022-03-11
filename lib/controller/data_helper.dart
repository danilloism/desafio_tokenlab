import 'dart:convert';
import 'dart:io';

import 'package:desafio_tokenlab/model/api_service.dart';
import 'package:desafio_tokenlab/model/cache_manager.dart';
import 'package:desafio_tokenlab/model/movie.dart';

class DataHelper {
  static final _movies = <Movie>[];
  static final _cacheManager = CacheManager.getInstance;

  static Future<List<Movie>> get movies async {
    final String data;
    final isCached = await _cacheManager.isDataCached;
    final List cacheDecoded;

    if (isCached) {
      data = await _cacheManager.data;
      cacheDecoded = json.decode(data);
      for (var movie in cacheDecoded) {
        _movies.add(Movie.fromJson(movie));
      }

      return List.unmodifiable(_movies);
    }

    try {
      data = await ApiService.data;
      cacheDecoded = json.decode(data);
      _cacheManager.writeCache(json.encode(cacheDecoded));
      for (var movie in cacheDecoded) {
        _movies.add(Movie.fromJson(movie));
      }
    } on HttpException {
      rethrow;
    } on Exception {
      rethrow;
    }

    return List.unmodifiable(_movies);
  }

  static void eraseCache() => _cacheManager.eraseCache;
}
