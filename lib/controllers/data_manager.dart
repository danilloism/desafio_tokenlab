import 'dart:convert';

import 'package:desafio_tokenlab/controllers/api_manager.dart';
import 'package:desafio_tokenlab/controllers/cache_manager.dart';
import 'package:desafio_tokenlab/models/movie.dart';

class DataManager {
  // static Future<String> get dataAsString async {
  //   final isCached = await CacheManager.isDataCached;
  //   if (isCached) {
  //     return CacheManager.cache;
  //   }
  //   final data = await ApiManager.getData;
  //   CacheManager.cacheData(data);
  //   return data;
  // }

  // final _movies = <dynamic>[];

  // //List<Movie> get movies => List.unmodifiable(_movies);

  // Future<List<dynamic>> get _decodeData async => jsonDecode(await dataAsString);

  // Future<List<Object?>> get movies async {
  //   var decodedData = await _decodeData;

  //   decodedData = decodedData.map((e) => Movie.fromMap(e)).toList();

  //   _movies.addAll(decodedData);
  //   return _movies;
  // }
}
