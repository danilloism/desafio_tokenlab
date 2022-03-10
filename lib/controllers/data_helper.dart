import 'dart:convert';

import 'package:desafio_tokenlab/models/api_service.dart';
import 'package:desafio_tokenlab/models/cache_manager.dart';
import 'package:desafio_tokenlab/models/movie.dart';

class DataHelper {
  DataHelper._();
  static final getInstance = DataHelper._();

  static final _movies = <Movie>[];

  static Future<List<Movie>> get movies async {
    final cacheManager = CacheManager.getInstance;
    final String data;
    final isCached = await cacheManager.isDataCached;
    final List cacheDecoded;

    if (isCached) {
      data = await cacheManager.data;
      cacheDecoded = json.decode(data);
      for (var movie in cacheDecoded) {
        _movies.add(Movie.fromJson(movie));
      }

      return List.unmodifiable(_movies);
    }
    data = await ApiService.data;
    cacheDecoded = json.decode(data);
    await cacheManager.writeCache(json.encode(cacheDecoded));
    for (var movie in cacheDecoded) {
      _movies.add(Movie.fromJson(movie));
    }
    return List.unmodifiable(_movies);
  }
}
