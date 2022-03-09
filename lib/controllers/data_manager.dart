import 'dart:convert';

import 'package:desafio_tokenlab/controllers/api_manager.dart';
import 'package:desafio_tokenlab/controllers/cache_manager.dart';
import 'package:desafio_tokenlab/models/movie.dart';

class DataManager {
  static Future<Set> get data async {
    final cacheManager = CacheManager.getInstance;

    final isCached = await cacheManager.isDataCached;
    if (isCached) {
      return cacheManager.data;
    }
    final data = await ApiManager.data;
    cacheManager.cacheCompleteFetchedData(data);
    return ApiManager.dataAsSet;
  }

  final _movies = <dynamic>{};

  // //List<Movie> get movies => List.unmodifiable(_movies);

  // Future<List<dynamic>> get _decodeData async => jsonDecode(await dataAsString);

  Future<Set<Object?>> get movies async {
    final dataAsSet = await data;

    final movies = dataAsSet.map((e) => Movie.fromJson(e)).toList();

    _movies.addAll(movies);
    return _movies;
  }
}
